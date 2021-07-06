import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ClienteSucursal } from 'src/app/models/ClienteSucursal';
import { Pedido } from 'src/app/models/Pedido';
import { ApplicationStateService } from 'src/app/services/application-state.service';
import { PedidoService } from 'src/app/services/pedido.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-pedido',
  templateUrl: './pedido.component.html',
  styleUrls: ['./pedido.component.css']
})
export class PedidoComponent implements OnInit {
  pedido: Pedido;
  dDespachoMin: Date;
  form: FormGroup;
  loading: boolean;
  titulo: string = "Editar Pedido";

  selectedCityId: number = 1;

  clientes: ClienteSucursal[] = [];

  constructor(private aRoute: ActivatedRoute, private _pedidoService: PedidoService
    , private fb: FormBuilder, private toastr: ToastrService, private router: Router
    , public appStateService: ApplicationStateService
  ) {

    this.loading = false;

    this.dDespachoMin = new Date();
    this.dDespachoMin.setDate(this.dDespachoMin.getDate() + environment.dias_despacho_min);

    // Implementa form
    this.form = this.fb.group({
      cNota: [''],
      dDespacho: ['', Validators.required],
      fMarca: ['', Validators.required],
      nPrecio: ['', Validators.required],
      cSKU: ['', Validators.required]
    });

    // Recupera info desde router
    this.pedido = new Pedido(0, this.dDespachoMin, 0, '', 0, 0, 0);
    var s = this.aRoute.snapshot.paramMap.get("id");
    if (s && s != "nuevo") {
      this.loading = true;
      this.getPedido(parseInt(s));
    } else
      this.pedidoToform();
    // Carga combos
    this.getClientes();
    // this.getMarcas();
  }

  ngOnInit(): void {
  }

  goBack(): void {
    this.router.navigate([this.appStateService.getPreviousUrl()]);
  }

  getPedido(id: number): void {
    this._pedidoService.getPedido(id).subscribe(
      doc => {
        this.loading = false;
        if (!doc.success) {
          this.toastr.error(doc.message, "Error");
          return;
        }
        if (doc.records.length == 0) {
          this.toastr.error("No existe registro con ID:" + id, "Error");
          return;
        }
        this.pedido = doc.records[0];
        // this.pedidoToform();
      })
  }

  private pedidoToform(): void {
    this.form.patchValue({
      cNota: this.pedido.cNota,
      dDespacho: this.pedido.dDespacho.toISOString().substr(0, 10),
      fMarca: this.pedido.fEstado,
      nPrecio: this.pedido.fUsuario,
      cSKU: this.pedido.pPedido
    });
  }

  savePedido(): void {
    const PRODUCTO: any = {
      pPedido: this.pedido.pPedido,
      cNota: this.form.value.cNota,
      dDespacho: this.form.value.dDespacho,
      fMarca: this.form.value.fMarca,
      nPrecio: this.form.value.nPrecio,
      cSKU: this.form.value.cSKU,
      bVigente: true
    }
    this._pedidoService.savePedido(PRODUCTO).subscribe(doc => {
      if (doc.success) {
        this.toastr.success(doc.message ? doc.message : "Registro grabado OK", "Pedidos");
        this.goBack();
        return;
      }
      this.toastr.error(doc.message, "Error");
    });

  }

  getClientes(): void {
    this._pedidoService.getClientes().subscribe(doc => {
      if (!doc.success) {
        this.toastr.error(doc.message, "Clientes");
        return;
      }
      this.clientes = doc.records;
    })
  }

}
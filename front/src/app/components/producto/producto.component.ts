import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Familia } from 'src/app/models/Familia';
import { Marca } from 'src/app/models/Marca';
import { Producto } from 'src/app/models/Producto';
import { ApplicationStateService } from 'src/app/services/application-state.service';
import { ProductoService } from 'src/app/services/producto.service';

@Component({
  selector: 'app-producto',
  templateUrl: './producto.component.html',
  styleUrls: ['./producto.component.css']
})
export class ProductoComponent implements OnInit {
  producto: Producto;
  form: FormGroup;
  loading: boolean;
  titulo: string = "Editar Producto";
  familias: Familia[] = [];
  marcas: Marca[] = [];


  constructor(private aRoute: ActivatedRoute, private _productoService: ProductoService
    , private fb: FormBuilder, private toastr: ToastrService, private router: Router
    , public appStateService: ApplicationStateService
  ) {

    this.loading = false;
    // Recupera info desde router
    this.producto = new Producto(0, '', 0, 0, 0, '');
    var s = this.aRoute.snapshot.paramMap.get("id");
    if (s && s != "nuevo") {
      this.loading = true;
      this.getProducto(parseInt(s));
    }
    // Implementa form
    this.form = this.fb.group({
      cDescripcion: ['', Validators.required],
      fFamilia: ['', Validators.required],
      fMarca: ['', Validators.required],
      nPrecio: ['', Validators.required],
      cSKU: ['', Validators.required]
    });
    // Carga combos
    this.getFamilias();
    this.getMarcas();

  }

  ngOnInit(): void {
  }

  goBack(): void {
    this.router.navigate([this.appStateService.getPreviousUrl()]);
  }

  getFamilias(): void {
    this._productoService.getFamilias().subscribe(doc => {
      if (!doc.success) {
        this.toastr.error(doc.message, "Famila de Productos");
        return;
      }
      this.familias = doc.records;
    })
  }

  getMarcas(): void {
    this._productoService.getMarcas().subscribe(doc => {
      if (!doc.success) {
        this.toastr.error(doc.message, "Marcas");
        return;
      }
      this.marcas = doc.records;
    })
  }

  getProducto(id: number): void {
    this._productoService.getProducto(id).subscribe(
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
        this.producto = doc.records[0];
        this.form.patchValue({
          cDescripcion: this.producto.cDescripcion,
          fFamilia: this.producto.fFamilia,
          fMarca: this.producto.fMarca,
          nPrecio: this.producto.nPrecio,
          cSKU: this.producto.cSKU
        })
      })
  }

  saveProducto(): void {
    const PRODUCTO: any = {
      pProducto: this.producto.pProducto,
      cDescripcion: this.form.value.cDescripcion,
      fFamilia: this.form.value.fFamilia,
      fMarca: this.form.value.fMarca,
      nPrecio: this.form.value.nPrecio,
      cSKU: this.form.value.cSKU,
      bVigente: true
    }
    this._productoService.saveProducto(PRODUCTO).subscribe(doc => {
      if (doc.success) {
        this.toastr.success(doc.message ? doc.message : "Registro grabado OK", "Productos");
        this.goBack();
        return;
      }
      this.toastr.error(doc.message, "Error");
    });

  }

}
import { Component, HostListener, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ApplicationStateService } from 'src/app/services/application-state.service';

import { Pedido } from 'src/app/models/Pedido';
import { PedidoService } from 'src/app/services/pedido.service';
import { ConfirmDialogService } from '../confirm-dialog/confirm-dialog.service';

@Component({
  selector: 'app-lista-pedidos',
  templateUrl: './lista-pedidos.component.html',
  styleUrls: ['./lista-pedidos.component.css']
})
export class ListaPedidosComponent implements OnInit {
  grillaOn: boolean;
  loading: boolean = false;
  paginacion: boolean = false;
  pedidos: Pedido[] = [];

  constructor(private _pedidoService: PedidoService, private router: Router
    , private toastr: ToastrService, private confirmDialogService: ConfirmDialogService
    , public appStateService: ApplicationStateService) {
    this.grillaOn = this.appStateService.getEstadoUI().grillaOn;
  }

  ngOnInit(): void {
    this.getPedidos();
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.appStateService.refresh();
  }

  eventGrillaOn(grillaOn: boolean): void {
    this.grillaOn = grillaOn;
    this.appStateService.getEstadoUI().grillaOn = grillaOn;
  }

  editarPedido(id: any): void {
    this.router.navigate(["/lista-pedidos/pedido/" + id]);
  }

  eliminarPedido(id: any): void {
    this.confirmDialogService.confirmThis('Are you sure to delete ?', () => {
      this.loading = true;
      this._pedidoService.delPedido(id).subscribe(doc => {
        this.loading = false;
        if (!doc.success) {
          this.toastr.error(doc.message, "Error");
          return;
        }
        this.getPedidos();
        this.toastr.success(doc.message, "Pedido");
      })
    }, () => { }
    );

  }

  getPedidos(): void {
    this.loading = true;

    this._pedidoService.getPedidos().subscribe(doc => {
      this.loading = false;
      if (!doc.success) {
        this.toastr.error(doc.message, "Error");
        return;
      }
      this.pedidos = doc.records;
    })
  }

}

import { Component, HostListener, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import LOCALE_ID from '@angular/common/locales/es-CL';

import { Producto } from 'src/app/models/Producto';
import { ProductoService } from 'src/app/services/producto.service';
import { ConfirmDialogService } from 'src/app/components/confirm-dialog/confirm-dialog.service';
import { ApplicationStateService } from 'src/app/services/application-state.service';
import { registerLocaleData } from '@angular/common';

@Component({
  selector: 'app-lista-productos',
  templateUrl: './lista-productos.component.html',
  styleUrls: ['./lista-productos.component.css']
})
export class ListaProductosComponent implements OnInit {
  grillaOn: boolean;
  productos: Producto[] = [];
  loading: boolean = false;
  paginacion: boolean = false;

  constructor(private _productoService: ProductoService, private router: Router
    , private toastr: ToastrService, private confirmDialogService: ConfirmDialogService
    , public appStateService: ApplicationStateService) {
    this.grillaOn = this.appStateService.getEstadoUI().grillaOn;
  }

  ngOnInit(): void {
    registerLocaleData(LOCALE_ID, 'es-CL');    
    this.getProductos();
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.appStateService.refresh();
  }

  editarProducto(id: any): void {
    this.router.navigate(["/lista-productos/producto/" + id]);
  }

  eliminarProducto(id: any): void {
    this.confirmDialogService.confirmThis('Are you sure to delete ?', () => {
      this.loading = true;
      this._productoService.delProducto(id).subscribe(doc => {
        this.loading = false;
        if (!doc.success) {
          this.toastr.error(doc.message, "Error");
          return;
        }
        this.getProductos();
        this.toastr.success(doc.message, "Producto");
      })
    }, () => { }
    );

  }

  eventGrillaOn(grillaOn: boolean): void {
    this.grillaOn = grillaOn;
    this.appStateService.getEstadoUI().grillaOn = grillaOn;
  }

  getProductos(): void {
    this.loading = true;

    this._productoService.getProductos().subscribe(doc => {
      this.loading = false;
      if (!doc.success) {
        this.toastr.error(doc.message, "Error");
        return;
      }
      this.productos = doc.records;
    })
  }

}

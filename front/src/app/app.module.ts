import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { ToastrModule } from 'ngx-toastr';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HashLocationStrategy, LocationStrategy } from '@angular/common';
import { NgSelectModule } from '@ng-select/ng-select';
import LOCALE_ID from '@angular/common/locales/es-CL';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { ClienteComponent } from './components/cliente/cliente.component';
import { ConfirmDialogModule } from './components/confirm-dialog/confirm-dialog.module';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { FooterComponent } from './components/footer/footer.component';
import { ListaClientesComponent } from './components/lista-clientes/lista-clientes.component';
import { ListaOrdenesComponent } from './components/lista-ordenes/lista-ordenes.component';
import { ListaPedidosComponent } from './components/lista-pedidos/lista-pedidos.component';
import { ListaProductosComponent } from './components/lista-productos/lista-productos.component';
import { ListaVendedoresComponent } from './components/lista-vendedores/lista-vendedores.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { NotificacionesComponent } from './components/notificaciones/notificaciones.component';
import { OrdenCompraComponent } from './components/orden-compra/orden-compra.component';
import { PedidoComponent } from './components/pedido/pedido.component';
import { ProductoComponent } from './components/producto/producto.component';
import { VendedorComponent } from './components/vendedor/vendedor.component';
import { SpinnerComponent } from './components/spinner/spinner.component';

@NgModule({
  declarations: [
    AppComponent, DashboardComponent, FooterComponent, NavbarComponent,
    ListaPedidosComponent, ListaOrdenesComponent, NotificacionesComponent, PedidoComponent,
    OrdenCompraComponent, ListaProductosComponent, ProductoComponent, ListaClientesComponent,
    ClienteComponent, ListaVendedoresComponent, VendedorComponent, SpinnerComponent
  ],
  imports: [
    AppRoutingModule, BrowserAnimationsModule, BrowserModule,
    ConfirmDialogModule, HttpClientModule,  ReactiveFormsModule,
    NgSelectModule, ToastrModule.forRoot(),
  ],
  providers: [{ provide: LocationStrategy, useClass: HashLocationStrategy }, { provide: LOCALE_ID, useValue: 'es-CL' }],
  bootstrap: [AppComponent]
})
export class AppModule { }

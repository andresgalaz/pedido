import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { ListaClientesComponent } from './components/lista-clientes/lista-clientes.component';
import { ListaProductosComponent } from './components/lista-productos/lista-productos.component';
import { ListaOrdenesComponent } from './components/lista-ordenes/lista-ordenes.component';
import { ListaPedidosComponent } from './components/lista-pedidos/lista-pedidos.component';
import { ListaVendedoresComponent } from './components/lista-vendedores/lista-vendedores.component';
import { ProductoComponent } from './components/producto/producto.component';
import { PedidoComponent } from './components/pedido/pedido.component';

const routes: Routes = [
  { path: '', component: DashboardComponent, pathMatch: 'full' },
  { path: 'lista-pedidos', component: ListaPedidosComponent },
  { path: 'lista-pedidos/pedido/:id', component: PedidoComponent },
  { path: 'lista-productos', component: ListaProductosComponent },
  { path: 'lista-productos/producto/:id', component: ProductoComponent },
  { path: 'lista-clientes', component: ListaClientesComponent },
  { path: 'lista-ordenes', component: ListaOrdenesComponent },
  { path: 'lista-vendedores', component: ListaVendedoresComponent },
  // { path: 'producto/:id', component: ProductoComponent },
  { path: '**', redirectTo: '', pathMatch: 'full' },
];


@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

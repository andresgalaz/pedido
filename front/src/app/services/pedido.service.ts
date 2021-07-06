import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http'
import { Observable } from 'rxjs';
import { Pedido } from '../models/Pedido';
import { BaseService } from './base.service';

@Injectable({ providedIn: 'root' })
export class PedidoService extends BaseService {
  tabla = 'pedido';

  constructor(protected http: HttpClient) {
    super(http);
  }

  delPedido(id: number): Observable<any> {
    return super.delete(this.tabla, { pPedido: id });
  }

  getPedidos(): Observable<any> {
    return super.getAll(this.tabla);
  }

  getPedido(id: number): Observable<any> {
    return super.get(this.tabla, { pPedido: id });
  }

  savePedido(pedido: Pedido): Observable<any> {
    return super.save(this.tabla, pedido);
  }

  getClientes(): Observable<any> {
    return super.getAll('clienteSucursal');
  }

}

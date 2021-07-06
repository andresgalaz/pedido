import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http'
import { Observable } from 'rxjs';
import { Producto } from '../models/Producto';
import { BaseService } from './base.service';

@Injectable({ providedIn: 'root' })
export class ProductoService extends BaseService {
  tabla = 'producto';

  constructor(protected http: HttpClient) {
    super(http);
  }

  delProducto(id: number): Observable<any> {
    return super.delete(this.tabla, { pProducto: id });
  }

  getProductos(): Observable<any> {
    return super.getAll(this.tabla);
  }

  getProducto(id: number): Observable<any> {
    return super.get(this.tabla, { pProducto: id });
  }

  saveProducto(producto: Producto): Observable<any> {
    return super.save(this.tabla, producto);
  }

  getFamilias(): Observable<any> {
    return super.getAll('familia');
  }

  getMarcas(): Observable<any> {
    return super.getAll('marca');
  }
}

import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http'
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable({ providedIn: 'root' })
export class BaseService {
  url = environment.server_url;
  token = environment.server_token;

  constructor(protected http: HttpClient) { }

  delete(tabla: string, params: any): Observable<any> {
    return this.callHttp(this.url + 'ws/' + tabla + '/delete', params);
  }

  getAll(tabla: string): Observable<any> {
    return this.callHttp(this.url + 'ws/' + tabla + '/list', {});
  }

  get(tabla: string, params: any): Observable<any> {
    return this.callHttp(this.url + 'ws/' + tabla + '/get', params);
  }

  save(tabla: string, params: any): Observable<any> {
    // return this.callHttp(this.url + 'ws/producto/save');
    return this.http.post<any>(this.url + 'ws/' + tabla + '/save' + '?token=' + this.token, params)
  }

  callHttp(cUrl: string, body: any): Observable<any> {
    if (environment.production) {
      const header = {
        headers: new HttpHeaders().set('Authorization', `Bearer ${this.token}`),
        withCredentials: true,
      };
      return this.http.post<any>(cUrl, body, header);
    }
    // CORS no soporta Autorization, el token se pasa como parámetro en ambiente de desarrollo
    return this.http.post<any>(cUrl + '?token=' + this.token, body);
  }
}

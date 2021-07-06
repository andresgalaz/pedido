
export class Pedido {
    pPedido: number;
    dDespacho: Date;
    cNota: string;
    tCreacion: Date;
    fFormaPago: number;
    cFormaPago: string;
    fEstado: number;
    cEstado: string;
    fClienteSucursal: number;
    fUsuario: number;

    constructor(pPedido: number, fecha: Date, fFormaPago: number,
        cNota: string, fEstado: number, fClienteSucursal: number, fUsuario: number
    ) {

        this.pPedido = pPedido;
        this.dDespacho = fecha;
        this.cNota = cNota;
        this.fFormaPago = fFormaPago;
        this.cFormaPago = '';
        this.fEstado = fEstado;
        this.cEstado = '';
        this.fClienteSucursal = fClienteSucursal;
        this.fUsuario = fUsuario;
        this.tCreacion = new Date();
    }
}
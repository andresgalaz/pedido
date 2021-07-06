
export class ClienteSucursal {
    pClienteSucursal: number;
    fCliente: number;
    cNombre: string;
    cDireccion: string;
    fComuna: number;

    constructor(pClienteSucursal: number, fCliente: number,
        cNombre: string, cDireccion: string, fComuna: number
    ) {
        this.pClienteSucursal = pClienteSucursal;
        this.fCliente = fCliente;
        this.cNombre = cNombre;
        this.cDireccion = cDireccion;
        this.fComuna = fComuna;
    }
}
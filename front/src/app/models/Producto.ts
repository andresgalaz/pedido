export class Producto {
    pProducto: number;
    cDescripcion: string;
    cFamilia: string;
    fFamilia: number;
    cMarca: string;
    fMarca: number;
    nPrecio: number;
    cSKU: string;
    bVigente: boolean;

    constructor(pProducto: number, cDescripcion: string, fFamilia: number,
        fMarca: number, nPrecio: number, cSKU: string
    ) {
        this.pProducto = pProducto;
        this.cDescripcion = cDescripcion;
        this.fFamilia = fFamilia;
        this.fMarca = fMarca;
        this.nPrecio = nPrecio;
        this.cSKU = cSKU;
        this.cMarca = '';
        this.cFamilia = '';
        this.bVigente = true;
    }
}
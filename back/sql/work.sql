select p.pPedido, p.dPedido, p.cNota, p.tCreacion, p.fFormaPago, fp.cDescripcion cFormaPago, p.fEstado, e.cDescripcion cEstado, p.fClienteSucursal, p.fUsuario, u.cNombre cUsuario
     , cs.cNombre cClienteNombre, cs.cDireccion, cs.fComuna, co.cLocalidad, co.cCiudad, co.cRegion
     , c.RazonSocial, c.cRut, c.fGiro,
from tPedido p
INNER JOIN tFormaPago fp ON fp.pFormaPago = p.fFormaPago
INNER JOIN tEstado    e  ON e.pEstado = p.fEstado
INNER JOIN tUsuario   u  ON u.pUsuario = p.fUsuario
INNER JOIN tClienteSucursal cs ON cs.pClienteSucursal = p.fClienteSucursal
INNER JOIN tCliente c ON c.pCliente = cs.fCliente
INNER JOIN tComuna  co ON co.pComuna = cs.fComuna
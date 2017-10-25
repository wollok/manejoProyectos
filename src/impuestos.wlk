class Impuesto {
	const porcentaje
	
	constructor(_porcentaje) {
		porcentaje = _porcentaje
	}
	
	method costo(costo) = costo * porcentaje / 100
}

object impuestoA inherits Impuesto (3) {}
object impuestoB inherits Impuesto (5) {}

////const impuestoA = new Impuesto (porcentaje = 3)
//
//object impuestoA inherits Impuesto (porcentaje = 3){}
//const impuestoB = new Impuesto (porcentaje = 5) 

class Impuesto {
	const porcentaje
	
	method costo(costo) = costo * porcentaje / 100
}


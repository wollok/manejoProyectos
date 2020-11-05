////const impuestoA = new Impuesto (porcentaje = 3)
//
//object impuestoA inherits Impuesto (porcentaje = 3){}
//const impuestoB = new Impuesto (porcentaje = 5) 
class Impuesto {

	const porcentaje

	method calcularValor(costo) = costo * porcentaje / 100

}

const impuestoA = new Impuesto(porcentaje = 3)

const impuestoB = new Impuesto(porcentaje = 5)


class Complejidad {

	method costoBase(tarea) = tarea.tiempo() * 25

	method costo(tarea) {
		const costoBase = self.costoBase(tarea)
		return costoBase + self.costoExtra(tarea.tiempo(), costoBase)
	}

	method costoExtra(tiempo, costoBase)

}

object complejidadMinima inherits Complejidad {

	override method costoExtra(tiempo, costoBase) = 0

	method diasAtraso(tarea) = 5

}

object complejidadMedia inherits Complejidad {

	override method costoExtra(tiempo, costoBase) = 0.05 * costoBase

	method diasAtraso(tarea) = 1.1 * tarea.tiempo()

}

object complejidadMaxima inherits Complejidad {

	override method costoExtra(tiempo, costoBase) = costoBase * 0.07 + self.costoAdicionalPorRetraso(tiempo)

	method costoAdicionalPorRetraso(tiempo) = 10 * 0.max(tiempo - 10)

	method diasAtraso(tarea) = 1.2 * tarea.tiempo() + 8

}

class Tarea {

	var property complejidad = complejidadMinima
	var property tiempo
	const impuestos = #{}

	method agregarImpuesto(impuesto) {
		impuestos.add(impuesto)
	}

	method cumplir()

	method costo() = self.costoComplejidad() + self.costoPorOverhead() + self.costoImpositivo()

	method costoComplejidad() = complejidad.costo(self)

	method diasAtraso() = complejidad.diasAtraso(self)

	method costoPorOverhead()

	method costoImpositivo() {
		const costoBase = self.costoComplejidad()
		return impuestos.sum{ impuesto => impuesto.calcularValor(costoBase) }
	}

}

class TareaSimple inherits Tarea {

	var property porcentajeCumplimiento = 0

	override method costoPorOverhead() = 0

	override method cumplir() {
		porcentajeCumplimiento = 100
	}

	method costoTotal() = self.costo()

}

class TareaCompuesta inherits Tarea {

	const subtareas = []

	override method cumplir() {
		throw new DomainException (message = "Solo puede marcar como cumplida una tarea simple")
	}

	method agregarSubtarea(subtarea) {
		subtareas.add(subtarea)
	}

	override method costoPorOverhead() = if (self.tieneMuchasSubtareas()) self.costoComplejidad() * 0.04 else 0

	method tieneMuchasSubtareas() = subtareas.size() > 3

	method costoTotal() = subtareas.sum{ tarea => tarea.costoTotal() }

	method porcentajeCumplimiento() = subtareas.sum{ subtarea => subtarea.porcentajeCumplimiento() } / subtareas.size()

}


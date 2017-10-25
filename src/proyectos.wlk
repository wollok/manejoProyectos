
class Proyecto {
	const tareas = [ ]

	method costoTotal() = tareas.sum{ tarea => tarea.costoTotal() }
}

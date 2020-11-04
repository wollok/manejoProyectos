class Proyecto {

	const tareas = [ ]

	method agregarTarea(tarea) = tareas.add(tarea)

	method costoTotal() = tareas.sum{ tarea => tarea.costoTotal() }

	method diasMaximosDeAtraso() = tareas.max{ tarea => tarea.diasAtraso() }.diasAtraso()

}


"
Vista para cambiar fechas de salida de viaje organizado (eliminar, agregar y modificar)

tablaFechasSalida:		<Table> 
botonAgregar: 		<Button>
botonCambiarCupo:	 <Button>
botonEliminar:		<Button>
"
Class {
	#name : #CambiarFechasSalida,
	#superclass : #ViewViaje,
	#instVars : [
		'tablaFechasSalida',
		'botonAgregar',
		'botonCambiarCupo',
		'botonEliminar',
		'campoFecha',
		'campoCupo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
CambiarFechasSalida >> addBotonAgregar [
	botonAgregar := Button label: 'Agregar Fecha de Salida' extent: 150@30.
	botonAgregar center: contenedor center; left: contenedor right + 50.
	
	botonAgregar mouseAction: [
		|fechaString cupoString|.
		fechaString := campoFecha input.
		cupoString := campoCupo input.
		(campoFecha isEmpty | campoCupo isEmpty) ifTrue: [
			self addMessage: 'Todos los campos son obligatorios'.
		] ifFalse: [
			(Helper stringIsNumeric: cupoString) ifTrue: [
				|regex unaFecha|.
				regex := '^(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])-(19|20)\d{2}$' asRegex.
				(regex matches: fechaString) ifTrue: [
					unaFecha := (Date fromString: fechaString).
						(unaFecha > Date today) ifTrue: [
							(viaje agregarFechaSalida: (FechaSalida crear: unaFecha cupo: (cupoString asNumber))) ifTrue: [
									self addMessage: 'Fecha agregada con exito.'.	
									campoFecha clear.
									campoCupo clear.	
								] ifFalse: [
									self addMessage: ('Fecha ingresada ',String cr,' ya se encuentra.') extent: 200@120.
								].
						] ifFalse: [
							self addMessage: ('Fecha ingresada debe',String cr,'ser luego del dia actual.') extent: 200@120.
						].
				] ifFalse: [
					self addMessage: 'Ingrese una fecha en el formato indicado' extent: 230@100.				
				].
			] ifFalse: [
				self addMessage: 'Cupo ingresado no es numerico.'.
				campoCupo clear.
			].
		].
	].

	body addMorph: botonAgregar.
]

{ #category : #adding }
CambiarFechasSalida >> addBotonEliminar [
	botonEliminar := Button label: 'Eliminar' extent: 80@30.
	botonEliminar center: tablaFechasSalida center; left: tablaFechasSalida right+50.	
	
	botonEliminar mouseAction: [ 
		self addMessageConfirm: '¿Esta seguro que desea',String cr,'eliminar la fecha?' actionConfirm: [:popup|
			(sistema quitarFechaSalidaDeViaje: viaje fechaSalida: (tablaFechasSalida selectedElement)) ifTrue: [
					self addMessage: 'Fecha eliminada con exito.'.
					tablaFechasSalida deselectAll.
					self borrarBotonEliminar.
				] ifFalse: [
					self addMessage: 'Existen contratos con dicha fecha',String cr,'Primero debe eliminar los mismos.' extent: 220@120.
				].
				popup delete.
			] extent: 220@120.
	].
	body addMorph: botonEliminar.
]

{ #category : #adding }
CambiarFechasSalida >> addCamposAgregarFecha [
	|labelFecha labelCupo|.
	self addContenedor: 250@150.
	contenedor center: tablaFechasSalida center + (0@225).
	
	campoFecha  := TextField createTransparentExtent: 200@30 ghostText: 'mes-dia-anio'.
	campoCupo  := TextField createTransparentExtent: 150@30 ghostText: ''.
	
	campoFecha borderWidth: 1; borderColor: Color black.
	campoCupo borderWidth: 1; borderColor: Color black.
	
	labelFecha := 'Fecha (mm-dd-aaa)' asMorph.
	labelCupo := 'Cupo' asMorph.
	
	campoFecha center: contenedor center - (0@30).
	labelFecha center: campoFecha center - (0@20).
	
	campoCupo center: contenedor center + (0@30).
	labelCupo center: campoCupo center - (0@20).
	
	body addMorph: campoFecha.
	body addMorph: labelFecha.
	body addMorph: campoCupo .
	body addMorph: labelCupo.	
	
	self addBotonAgregar.
]

{ #category : #adding }
CambiarFechasSalida >> addTablaFechas [
	"Agrega una tabla con fechas de salida de un viaje organizado"
	|label|.
	label := 'Fechas de Salida' asMorph.
	tablaFechasSalida  := Table createColumns: (#(Fecha Cupo) asOrderedCollection) extent: ((body width*0.3)@(body height*0.27)) dataSource: (DataSourceFecha createCollection: (viaje colFechasSalida) object: viaje).
	
	tablaFechasSalida top: masInfo top + 15; left: body left + 40.
	tablaFechasSalida borderColor: Color black; borderWidth: 1.
	label bottom: tablaFechasSalida top - 10; left: tablaFechasSalida left.
	
	body addMorph: tablaFechasSalida.
	tablaFechasSalida addMorph: label.
	
	tablaFechasSalida setClick: [ :obj |
		obj ifNotNil: [
			self borrarBotonEliminar.
			self addBotonEliminar.
		].	
	].
]

{ #category : #deleting }
CambiarFechasSalida >> borrarBotonEliminar [
	botonEliminar ifNotNil:[
			botonEliminar delete.
		].
	
]

{ #category : #initialization }
CambiarFechasSalida >> initializeWithSystem: unSistema viaje: unViaje [
	super initializeWithSystem: unSistema viaje: unViaje.
	self addTitulo: 'Cambiar Fechas Salida'.
	self addBotonBorrarVentana: 'Atras'.
	self addTablaFechas.
	self addCamposAgregarFecha.
	
	
	
	
]

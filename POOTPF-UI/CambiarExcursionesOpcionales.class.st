"
Vista para cambiar excursiones opcionales de viaje organizado (eliminar y agregar)

tablaExcursionesOpcionales: 	<Table>
botonAgregar:		<Button>
botonEliminar:		<Button>
campoDescripcion: <TextField>
campoCosto:			<TextField>
"
Class {
	#name : #CambiarExcursionesOpcionales,
	#superclass : #ViewViaje,
	#instVars : [
		'tablaExcursionesOpcionales',
		'botonAgregar',
		'botonEliminar',
		'campoDescripcion',
		'campoCosto'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
CambiarExcursionesOpcionales >> addBotonAgregar [
	botonAgregar := Button label: 'Agregar Excursion' extent: 120@30.
	botonAgregar center: contenedor center; left: contenedor right + 50.
	
	botonAgregar mouseAction: [
		|descripcionString costoString|.
		descripcionString := campoDescripcion input.
		costoString := campoCosto input.
		(campoDescripcion isEmpty | campoCosto isEmpty) ifTrue: [
			self addMessage: 'Todos los campos son obligatorios'.
		] ifFalse: [
			(Helper stringIsNumeric: costoString) ifTrue: [
				(viaje buscarExcursionConDescripcion: descripcionString) ifNil: [
					viaje agregarExcursionOpcional: (ExcursionOpcional crear: descripcionString costoPorPersona: (costoString asNumber)).
					self addMessage: 'Excursion agregada con exito.'.	
					campoDescripcion  clear.
					campoCosto clear.
				] ifNotNil: [
					self addMessage: 'Descripcion ya utilizada.'.
					campoDescripcion clear.
				].
			] ifFalse: [
				self addMessage: 'Costo ingresado no es numerico.'.
				campoCosto clear.
			].
		].
	].

	body addMorph: botonAgregar.
]

{ #category : #adding }
CambiarExcursionesOpcionales >> addBotonEliminar [
	botonEliminar := Button label: 'Eliminar' extent: 80@30.
	botonEliminar center: tablaExcursionesOpcionales center; left: tablaExcursionesOpcionales right+50.	
	
	botonEliminar mouseAction: [ 
		self addMessageConfirm: '¿Esta seguro? Se conservaran las',String cr,'reservas relacionadas a la excursion.' actionConfirm: [:popup|
				(viaje quitarExcursionOpcional: (tablaExcursionesOpcionales selectedElement)) ifTrue:[
						self addMessage: 'Excursion eliminada con exito.'.
						tablaExcursionesOpcionales deselectAll.
					] ifFalse: [
						self addMessage: 'Hubo un problema al',String cr,'eliminar la excursion.'.
					].
				popup delete.
			] extent: 220@120.
	].
	body addMorph: botonEliminar.
	
]

{ #category : #adding }
CambiarExcursionesOpcionales >> addCamposAgregarExcursion [
	|labelDesc labelCosto|.
	self addContenedor: 250@150.
	contenedor center: tablaExcursionesOpcionales center + (0@225).
	
	campoDescripcion  := TextField createTransparentExtent: 200@30 ghostText: 'Viaje en...'.
	campoCosto  := TextField createTransparentExtent: 150@30 ghostText: '$$$'.
	
	campoDescripcion borderWidth: 1; borderColor: Color black.
	campoCosto borderWidth: 1; borderColor: Color black.
	
	labelDesc := 'Descripcion' asMorph.
	labelCosto := 'Costo por Persona' asMorph.
	
	campoDescripcion center: contenedor center - (0@30).
	labelDesc center: campoDescripcion center - (0@20).
	
	campoCosto center: contenedor center + (0@30).
	labelCosto center: campoCosto center - (0@20).
	
	body addMorph: campoDescripcion.
	body addMorph: labelDesc.
	body addMorph: campoCosto .
	body addMorph: labelCosto.	
	
	self addBotonAgregar.
]

{ #category : #adding }
CambiarExcursionesOpcionales >> addTablaExcursiones [
	"Agrega una tabla con excursiones opcionales de un viaje"
	|label|.
	label := 'Excursiones Opcionales' asMorph.
	tablaExcursionesOpcionales := Table createColumns: (#(Descripcion 'Costo por persona') asOrderedCollection) extent: ((body width*0.3)@(body height*0.27)) dataSource: (DataSourceExcursionOpcional createCollection: (viaje colExcursionesOpcionales) object: viaje).
	
	tablaExcursionesOpcionales top: masInfo top + 15; left: body left + 40.
	tablaExcursionesOpcionales borderColor: Color black; borderWidth: 1.
	label bottom: tablaExcursionesOpcionales top - 10; left: tablaExcursionesOpcionales left.
	
	body addMorph: tablaExcursionesOpcionales.
	tablaExcursionesOpcionales addMorph: label.
	
	tablaExcursionesOpcionales setClick: [ :obj |
		obj ifNotNil: [
			self borrarInputs.
			self addBotonEliminar.
		].	
	].
]

{ #category : #deleting }
CambiarExcursionesOpcionales >> borrarInputs [
	botonEliminar ifNotNil:[
			botonEliminar delete.
		].
]

{ #category : #initialization }
CambiarExcursionesOpcionales >> initializeWithSystem: unSistema viaje: unViaje [
	super initializeWithSystem: unSistema viaje: unViaje.
	self addTitulo: 'Cambiar Excursiones Opcionales'.
	self addBotonBorrarVentana: 'Atras'.
	self addTablaExcursiones.
	self addCamposAgregarExcursion.
]

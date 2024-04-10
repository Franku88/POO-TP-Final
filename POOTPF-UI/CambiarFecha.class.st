"
Vista que mostrara un menu de modificacion de fecha seleccionada para un contrato.

"
Class {
	#name : #CambiarFecha,
	#superclass : #ViewContrato,
	#instVars : [
		'tablaFechas',
		'botonCambiar'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
CambiarFecha >> addBotonCambiarFecha [
	botonCambiar := Button label: 'Cambiar fecha' extent: 100@35.
	botonCambiar center: tablaFechas center; top: tablaFechas bottom + 25.
	
	botonCambiar mouseAction: [
		|unPlus|.
		unPlus := contrato calcularPlusFecha: (tablaFechas selectedElement fecha).
		self addMessageConfirm: '¿Esta seguro? Se le cobrara un plus de 
		$',unPlus asString,' por el cambio.' actionConfirm: [:popup|
				(cliente modificarContratoConNumero: (contrato numero) fechaSeleccionada: (tablaFechas selectedElement fecha)) ifTrue: [ 
						self addMessage: 'Fecha modificada con exito.'.
						"Crea otra tabla con nuevos datos"
						tablaFechas delete.
						self addTablaFechas: (contrato viaje).
					] ifFalse: [ 
						self addMessage: 'Fecha invalida o Dinero insuficiente.'.
					].
				"Como es modificada a esa fecha, no queda ninguno seleccionado"
				"tablaFechas selectedElement: nil."
				popup delete.
				botonCambiar delete.
			] extent: 250@130. 
	].
	self addMorph: botonCambiar.
]

{ #category : #adding }
CambiarFecha >> addButtons [
	self addBotonCambiarFecha.
]

{ #category : #adding }
CambiarFecha >> addTablaFechas: unViaje [
	"Agrega una tabla con fechas vigentes de unViaje"
	|label|.
	label := 'Seleccionar nueva fecha' asMorph.
	tablaFechas := Table createColumns: (#(Fecha Cupo) asOrderedCollection) extent: ((body width*0.22)@(body height*0.3)) dataSource: (DataSourceFecha createCollection: (unViaje getColFechasVigentesExcepto: (contrato fechaSeleccionada)) object: unViaje).
	
	tablaFechas center: masInfo center; left: body left + 100.
	tablaFechas borderColor: Color black; borderWidth: 1.
	label bottom: tablaFechas top - 10; left: tablaFechas left.
	
	body addMorph: tablaFechas.
	tablaFechas addMorph: label.
	
	tablaFechas setClick: [ :obj |
		obj ifNotNil: [
			self addButtons.
		].	
	].
]

{ #category : #initialization }
CambiarFecha >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	super initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
	self addBotonBorrarVentana: 'Atras'.
	self addTitulo: 'Cambiar fecha seleccionada'.
	self addTablaFechas: (contrato viaje).
	
	
]

"
Vista que mostrara un menu para agregar una excursion opcional a un contrato.
"
Class {
	#name : #ModificarReservas,
	#superclass : #ViewContrato,
	#instVars : [
		'tablaExcursiones',
		'tablaReservas',
		'campoCantPersonas',
		'botonAgregarExcursion',
		'botonCancelarReserva'
	],
	#category : #'POOTPF-UI'
}

{ #category : #adding }
ModificarReservas >> addBotonAgregarExcursion [
	botonAgregarExcursion := Button label: 'Agregar excursion' extent: 125@35.
	botonAgregarExcursion bottom: tablaExcursiones bottom - 15; left: tablaExcursiones right + 30.
	
	botonAgregarExcursion mouseAction: [	
			|cantP|.
			cantP := (campoCantPersonas getValor).
			(cantP > 0) ifTrue: [
					self addMessageConfirm: ('¿Esta seguro de crear la reserva?',String cr,' Se cobraran $',((tablaExcursiones selectedElement costoPorPersona)*(cantP)) asString,' para ',cantP asString,' personas.') actionConfirm: ([:popup|
						(cliente agregarReservaAContratoConNumero: (contrato numero) excursionOpcional: (tablaExcursiones selectedElement) cantPersonas: cantP) ifTrue: [
							self addMessage: 'Excursion agregada' extent: 150@100.
							tablaExcursiones delete.
							self addTablaExcursiones: (contrato viaje).
						] ifFalse: [
							self addMessage: 'Error plazo/personas/organizado'.
						].
						popup delete.
						self borrarInputsReserva.
						self borrarInputsCancelar.
						tablaExcursiones deselectAll.
						tablaReservas deselectAll.
					]) extent: 210@115.				
				] ifFalse: [
					self addMessage: ('Todas las personas estan en una reserva.',String cr,'Cancele alguna para poder contratar otra.') extent: 250@125.
				].
		].
	self addMorph: botonAgregarExcursion.
]

{ #category : #adding }
ModificarReservas >> addBotonCancelarReserva [
	botonCancelarReserva := Button label: 'Cancelar reserva' extent: 125@35.
	botonCancelarReserva center: tablaReservas center; top: tablaReservas bottom + 15.
	
	botonCancelarReserva mouseAction: [
		self addMessageConfirm: ('¿Esta seguro de cancelar la reserva?',String cr,'	 Se reembolsaran $',((tablaReservas selectedElement) costoExtra) asString,'.') actionConfirm: ([:popup|
			(cliente cancelarReservaAContratoConNumero: (contrato numero) unaReserva: (tablaReservas selectedElement)) ifTrue: [
				self addMessage: 'Reserva cancelada con exito.'.
			] ifFalse:[
				self addMessage: 'No fue posible cancelar la reserva.'.
			].
			popup delete.
			self borrarInputsReserva.
			self borrarInputsCancelar.
			tablaExcursiones deselectAll.
			tablaReservas deselectAll.
		]) extent: 215@115.				
	].
	self addMorph: botonCancelarReserva.
]

{ #category : #adding }
ModificarReservas >> addCampoCantPersonas [
	"Agrega campo para ingresar una cantidad de personas, queda en 0 si no se permite el ingreso"
	|title title2 sinRes|
	sinRes := contrato calcularPersonasSinReserva.
	title2 := ('(',sinRes asString,' personas sin reserva)') asMorph.
	(sinRes > 0) ifTrue:[
			campoCantPersonas := MenuSelectInt createBetween: 1 and: sinRes.
			title := 'Cantidad de Personas' asMorph.
		] ifFalse:[
			campoCantPersonas := MenuSelectInt createBetween: 0 and: 0.
			title := 'Maximo alcanzado' asMorph.
		].
	
	campoCantPersonas top: (tablaExcursiones top + 15); left: (tablaExcursiones right + 30).
	title bottom: (campoCantPersonas center y); left: campoCantPersonas right + 40.
	title2 center: title center; top: title bottom.
		
	campoCantPersonas addMorph: title.
	campoCantPersonas addMorph: title2.
	body addMorph: campoCantPersonas.
]

{ #category : #adding }
ModificarReservas >> addTablaExcursiones: unViaje [
	"Agrega una tabla con excursiones opcionales de un viaje"
	|label|.
	label := 'Reservar' asMorph.
	tablaExcursiones := Table createColumns: (#(Descripcion 'Costo por persona') asOrderedCollection) extent: ((body width*0.3)@(body height*0.27)) dataSource: (DataSourceExcursionOpcional createCollection: (unViaje colExcursionesOpcionales) object: unViaje).
	
	tablaExcursiones top: masInfo top + 15; left: body left + 40.
	tablaExcursiones borderColor: Color black; borderWidth: 1.
	label bottom: tablaExcursiones top - 10; left: tablaExcursiones left.
	
	body addMorph: tablaExcursiones.
	tablaExcursiones addMorph: label.
	
	tablaExcursiones setClick: [ :obj |
		obj ifNotNil: [
			self borrarInputsReserva.
			self addCampoCantPersonas.
			self addBotonAgregarExcursion.
		].	
	].
]

{ #category : #adding }
ModificarReservas >> addTablaReservas [
	"Agrega una tabla con reservas del contrato"
	|label|.
	label := 'Cancelar' asMorph.
	tablaReservas := Table createColumns: (#(Descripcion 'Costo por persona' Personas) asOrderedCollection) extent: ((body width*0.4)@(body height*0.27)) dataSource: (DataSourceReserva createCollection: (contrato colReservas) object: contrato).
	
	tablaReservas bottom: masInfo bottom - 75; left: body left + 40.
	tablaReservas borderColor: Color black; borderWidth: 1.
	label bottom: tablaReservas top - 10; left: tablaReservas left.
	
	body addMorph: tablaReservas.
	tablaReservas addMorph: label.
	
	tablaReservas setClick: [ :obj |
		obj ifNotNil: [
			self borrarInputsCancelar.
			self addBotonCancelarReserva.
		].	
	].
]

{ #category : #deleting }
ModificarReservas >> borrarInputsCancelar [
	botonCancelarReserva ifNotNil:[
			botonCancelarReserva delete.
		].
]

{ #category : #deleting }
ModificarReservas >> borrarInputsReserva [
	campoCantPersonas ifNotNil: [
			campoCantPersonas delete.
		].
	botonAgregarExcursion ifNotNil:[
			botonAgregarExcursion delete.	
		].
]

{ #category : #initialization }
ModificarReservas >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	super initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
	self addBotonBorrarVentana: 'Atras'.
	self addTitulo: 'Agregar excursiones opcionales (Reservas)'.
	self addTablaExcursiones: (contrato viaje).
	self addTablaReservas.
]

{ #category : #updating }
ModificarReservas >> update: o [
	super update: o.
	self borrarInputsReserva.
]

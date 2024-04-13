"
Vista que muestra menu de modificacion de viaje organizado.

"
Class {
	#name : #ModificarViajeOrganizado,
	#superclass : #ViewViaje,
	#instVars : [
		'botonCambiarExcursiones',
		'botonCambiarFechas'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
ModificarViajeOrganizado >> addBotonCambiarExcursiones [
	botonCambiarExcursiones := Button label: 'Cambiar Excursiones Opcionales'  extent: 200@30.
	botonCambiarExcursiones left: body left + 150; top: body top + 150.	
	
	botonCambiarExcursiones mouseAction: [ 
		self addMorphCentered: (CambiarExcursionesOpcionales createWithSystem: sistema viaje: viaje).
	].
	
	body addMorph: botonCambiarExcursiones.
]

{ #category : #adding }
ModificarViajeOrganizado >> addBotonCambiarFechas [
	botonCambiarFechas := Button label: 'Cambiar Fechas de Salida'  extent: 200@30.
	botonCambiarFechas left: body left + 150; bottom: body bottom - 150.	
	
	botonCambiarFechas mouseAction: [ 
		self addMorphCentered: (CambiarFechasSalida createWithSystem: sistema viaje: viaje).
	].
	
	body addMorph: botonCambiarFechas.
]

{ #category : #adding }
ModificarViajeOrganizado >> addButtons [
	self addBotonCambiarExcursiones.
	self addBotonCambiarFechas.
]

{ #category : #initialization }
ModificarViajeOrganizado >> initializeWithSystem: unSistema viaje: unViaje [
	super initializeWithSystem: unSistema viaje: unViaje.
	self addTitulo: 'Modificar Viaje Organizado'.
	self addBotonBorrarVentana: 'Atras'.
	self addButtons.
	
	
]

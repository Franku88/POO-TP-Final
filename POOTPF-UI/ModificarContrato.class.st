"
Vista que mostrara un menu de modificacion de contrato.
A los contratos se les puede agregar ReservasExcursion dadas las condiciones (se considera una modificacion).
Luego, otro dato modificable unicamente es la fecha seleccionada y si el contrato es flexible a cambio de un costo.


    Instance Variables
	contrato:		<Object>
	botonAgregarExcOp:		<Button>
	botonCambiarFecha:		<Button>

"
Class {
	#name : #ModificarContrato,
	#superclass : #ViewContrato,
	#instVars : [
		'botonAgregarExcOp',
		'botonCambiarFecha'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
ModificarContrato >> addBotonCambiarFecha [
	botonCambiarFecha := Button label: 'Cambiar fecha seleccionada' extent: 160@30.
	
	botonCambiarFecha left: body left + 150; bottom: body bottom - 150.
	
	botonCambiarFecha mouseAction: [  
		(contrato esFlexible) ifTrue: [ 
			self addMorphCentered: (CambiarFecha createWithSystem: sistema cliente: cliente contrato: contrato).
		] ifFalse: [
			self addMessage: '      El contrato no es flexible.',String cr,'No es posible cambiar su fecha.' extent: 200@120.
		].
	].
	
	body addMorph: botonCambiarFecha.
]

{ #category : #adding }
ModificarContrato >> addBotonExcOp [
	botonAgregarExcOp  := Button label: 'Agregar excursion opcional' extent: 160@30.
	
	botonAgregarExcOp left: body left + 150; top: body top + 150.
	
	botonAgregarExcOp mouseAction: [ 
		(contrato viaje esOrganizado) ifTrue: [ 
			self addMorphCentered: (AgregarExcursionOpcional createWithSystem: sistema cliente: cliente contrato: contrato).
		] ifFalse: [
			self addMessage: 'Viaje del contrato no es organizado.',String cr,'No es posible agregar excursiones.' extent: 250@120.	
		].
	].
	body addMorph: botonAgregarExcOp.
	

]

{ #category : #adding }
ModificarContrato >> addButtons [
	self addBotonExcOp.
	self addBotonCambiarFecha.
]

{ #category : #initialization }
ModificarContrato >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	super initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
	self addBotonBorrarVentana: 'Atras'.
	self addButtons.

	
	

	
	
	
	
	
]

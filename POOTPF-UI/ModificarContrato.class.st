"
Vista que mostrara un menu de modificacion de contrato.
A los contratos se les puede agregar ReservasExcursion dadas las condiciones (se considera una modificacion).
Luego, otro dato modificable unicamente es la fecha seleccionada y si el contrato es flexible a cambio de un costo.


    Instance Variables
	contrato:		<Object>

"
Class {
	#name : #ModificarContrato,
	#superclass : #ViewCliente,
	#instVars : [
		'contrato'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #creating }
ModificarContrato class >> createWithSystem: unSistema cliente: unCliente contrato: unContrato [
	|crearContratoW|.
	crearContratoW := self new.
	crearContratoW initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
 	^crearContratoW.
]

{ #category : #initialization }
ModificarContrato >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	self initializeWithSystem: unSistema cliente: unCliente.
	contrato := unContrato.
	contrato addDependent: self.
	self addBotonBorrarVentana: 'Atras'.
	"lo que siga"
]

"
Vistas que usaran/mostraran datos de un Contrato 

    Instance Variables
	contrato:		<Contrato>
	masInfo: 		<ScrolledText>
"
Class {
	#name : #ViewContrato,
	#superclass : #ViewCliente,
	#instVars : [
		'contrato',
		'masInfo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #creating }
ViewContrato class >> createWithSystem: unSistema cliente: unCliente contrato: unContrato [
	|crearViewContratoW|.
	crearViewContratoW := self new.
	crearViewContratoW initializeWithSystem: unSistema cliente: unCliente contrato: unContrato.
 	^crearViewContratoW.
]

{ #category : #adding }
ViewContrato >> addMasInfo [
	masInfo := ScrolledText createExtent: ((body width*0.35)@(body height*0.8)) color: Color transparent title: 'Contrato'.
	masInfo beReadOnly.
	masInfo right: (body right - 20); top: (body top + 45).
	body addMorph: masInfo.
]

{ #category : #initialization }
ViewContrato >> initializeWithSystem: unSistema cliente: unCliente contrato: unContrato [
	self initializeWithSystem: unSistema cliente: unCliente.
	self addMasInfo.
	
	contrato := unContrato.
	contrato addDependent: self.
	self update: contrato.

	
]

{ #category : #updating }
ViewContrato >> update: o [
	super update: o.
	masInfo setText: ''.
	(contrato) ifNotNil: [  
		masInfo setText: (self contratoToString: contrato).
	].

]

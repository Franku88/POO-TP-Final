"
Instance Variables
	cantPersonas:		<Integer>
	excursionOpcional:		<ExcursionOpcional>
"
Class {
	#name : #ReservaExcursion,
	#superclass : #Object,
	#instVars : [
		'excursionOpcional',
		'cantPersonas'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #creating }
ReservaExcursion class >> crear: unaExc cantPersonas: unaCant [
	|unaRes|.
	unaRes := self new.
	unaRes initialize: unaExc cantPersonas: unaCant.
	^unaRes.
]

{ #category : #accessing }
ReservaExcursion >> cantPersonas [
	^ cantPersonas.
]

{ #category : #accessing }
ReservaExcursion >> cantPersonas: unaCant [
	cantPersonas := unaCant.
	self changed.
]

{ #category : #accessing }
ReservaExcursion >> costoExtra [
	^ (cantPersonas * excursionOpcional costoPorPersona)
]

{ #category : #initialization }
ReservaExcursion >> initialize: unaExc cantPersonas: unaCant [
	excursionOpcional := unaExc.
	cantPersonas := unaCant.

]

{ #category : #printing }
ReservaExcursion >> toString [
	|cad|.
	cad := '		Excursion: ',String cr,excursionOpcional toString,String cr,'			Cantidad de Personas: ', cantPersonas asString.
	^cad.
]

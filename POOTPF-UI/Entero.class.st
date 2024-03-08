"
Usado en MenuSelectInt

    Instance Variables
	Valor:		<Integer>
"
Class {
	#name : #Entero,
	#superclass : #Object,
	#instVars : [
		'valor'
	],
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
Entero class >> create: num [
	|ent|.
	ent := self new.
	ent initialize: num.
	^ent.
]

{ #category : #initialization }
Entero >> initialize: num [
	self valor: num
]

{ #category : #accessing }
Entero >> valor [
	^valor.
]

{ #category : #accessing }
Entero >> valor: num [
	valor := num.
	self changed.
]

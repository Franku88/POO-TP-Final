"
Instance Variables
cantPersonas:		<Integer>
costo:		<Double>
"
Class {
	#name : #ExcursionOpcional,
	#superclass : #Excursion,
	#instVars : [
		'costo'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #constructor }
ExcursionOpcional class >> crear: unaDescripcion costo: unCosto [
	"Constructor de ExcursionOpcional"
	|unaExcursionOp|.
	unaExcursionOp := self new .
	unaExcursionOp inicializarDescripcion: unaDescripcion costo: unCosto.
	^unaExcursionOp.
]

{ #category : #accessing }
ExcursionOpcional >> costo [
	^costo.
]

{ #category : #accessing }
ExcursionOpcional >> costo: unCosto [
	costo := unCosto.
	self changed.
]

{ #category : #verifying }
ExcursionOpcional >> esOpcional [
	^true.
]

{ #category : #initialize }
ExcursionOpcional >> inicializarDescripcion: unaDescripcion costo: unCosto [
	self inicializarDescripcion: unaDescripcion.
	costo := unCosto.
]

{ #category : #printing }
ExcursionOpcional >> toString [
	|cadena|.
	cadena := super toString,', Costo por Persona: $',costo asString.
	^cadena.
]

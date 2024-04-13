"
Instance Variables
cantPersonas:		<Integer>
costoPorPersona:		<Double>
"
Class {
	#name : #ExcursionOpcional,
	#superclass : #Actividad,
	#instVars : [
		'costoPorPersona'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #constructor }
ExcursionOpcional class >> crear: unaDescripcion costoPorPersona: unCosto [
	"Constructor de ExcursionOpcional"
	|unaExcursionOp|.
	unaExcursionOp := self new .
	unaExcursionOp inicializarDescripcion: unaDescripcion costoPorPersona: unCosto.
	^unaExcursionOp.
]

{ #category : #accessing }
ExcursionOpcional >> costoPorPersona [
	^costoPorPersona.
]

{ #category : #accessing }
ExcursionOpcional >> costoPorPersona: unCosto [
	costoPorPersona := unCosto.
	self changed.
]

{ #category : #verifying }
ExcursionOpcional >> esOpcional [
	^true.
]

{ #category : #initialize }
ExcursionOpcional >> inicializarDescripcion: unaDescripcion costoPorPersona: unCosto [
	self inicializarDescripcion: unaDescripcion.
	costoPorPersona := unCosto.
]

{ #category : #printing }
ExcursionOpcional >> toString [
	|cadena|.
	cadena := super toString,String cr,'			Costo por Persona: $',costoPorPersona asString.
	^cadena.
]

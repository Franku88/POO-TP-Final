"
Instance Variables
cantPersonas:		<Integer>
costo:		<Double>
"
Class {
	#name : #ExcursionOpcional,
	#superclass : #Excursion,
	#instVars : [
		'cantPersonas',
		'costo'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #constructor }
ExcursionOpcional class >> crear: unaDescripcion costo: unCosto cantPersonas: unaCant [
	"Constructor de ExcursionOpcional"
	|unaExcursionOp|.
	unaExcursionOp := self crear: unaDescripcion.
	unaExcursionOp inicializarCosto: unCosto cantPersonas: unaCant.
	^unaExcursionOp.
]

{ #category : #accessing }
ExcursionOpcional >> cantPersonas [
	^cantPersonas.
]

{ #category : #accessing }
ExcursionOpcional >> cantPersonas: unaCant [
	cantPersonas := unaCant.
]

{ #category : #accessing }
ExcursionOpcional >> costo [
	^costo.
]

{ #category : #accessing }
ExcursionOpcional >> costo: unCosto [
	costo := unCosto.
]

{ #category : #initialization }
ExcursionOpcional >> inicializarCosto: unCosto cantPersonas: unaCant [
	"Inicializa atributos de ExcursionOpcional"
	costo := unCosto.
	cantPersonas := unaCant.
]

{ #category : #printing }
ExcursionOpcional >> toString [
	|cadena|.
	cadena := super toString.
	cadena := cadena,', Personas: ',cantPersonas asString ,', Costo: $',costo asString.
	^cadena.
]

{ #category : #verifying }
ExcursionOpcional >> verificarCantPersonas: unaCant [
	"Verifica que la cantidad de personas de la excursion sea menor o igual a unaCant"
	^(unaCant >= cantPersonas).
]

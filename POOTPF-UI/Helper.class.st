"
Clase que provee funciones utiles.
"
Class {
	#name : #Helper,
	#superclass : #Object,
	#category : #'POOTPF-UI-Components'
}

{ #category : #boolean }
Helper class >> booleanToString: unBoolean [
	|cad|.
	cad := 'No'.
	(unBoolean) ifTrue: [ 
		cad := 'Si'.
	].
	^cad.
]

{ #category : #boolean }
Helper class >> stringIsEmpty: cad [
	^(cad trim) isEmpty.

]

{ #category : #boolean }
Helper class >> stringIsNumeric: string [
	"Retorna verdadero si la cadena ingresada contiene solo digitos"
   ^(string isNotEmpty) and: (string isAllDigits).
]

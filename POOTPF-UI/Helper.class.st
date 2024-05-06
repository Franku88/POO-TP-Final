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

{ #category : #boolean }
Helper class >> stringMMDDAAAA: unString [
	"Retorna verdadero si un string tiene formato MM-DD-AAAA"
	|regex|.
	regex := '^(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])-(19|20)\d{2}$' asRegex.
	^ (regex matches: unString)
	
	
]

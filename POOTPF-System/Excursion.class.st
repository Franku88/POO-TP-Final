"
Instance Variables
descripcion:		<String>
"
Class {
	#name : #Excursion,
	#superclass : #Object,
	#instVars : [
		'descripcion'
	],
	#category : #'POOTPF-System'
}

{ #category : #creating }
Excursion class >> crear: unaDescripcion [
	"Constructor de Excursion"
	|unaExcursion|.
	unaExcursion := self new.
	unaExcursion inicializarDescripcion: unaDescripcion.
	^unaExcursion.
]

{ #category : #accessing }
Excursion >> descripcion [
	^descripcion.
]

{ #category : #accessing }
Excursion >> descripcion: unaDescripcion [
	descripcion := unaDescripcion.
]

{ #category : #initialization }
Excursion >> inicializarDescripcion: unaDescripcion [
	"Inicializa Excursion"
	descripcion := unaDescripcion.
]

{ #category : #printing }
Excursion >> toString [
	|cadena|.
	cadena := 'Descripcion: ',descripcion.
	^cadena.
]

{ #category : #verifying }
Excursion >> verificarCantPersonas: unaCant [
	^false.
]

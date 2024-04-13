"
Instance Variables
descripcion:		<String>
"
Class {
	#name : #Excursion,
	#superclass : #Actividad,
	#instVars : [
		'desc'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #creating }
Excursion class >> crear: unaDescripcion [
	"Constructor de Excursion"
	|unaExcursion|.
	unaExcursion := self new.
	unaExcursion inicializarDescripcion: unaDescripcion.
	^unaExcursion.
]

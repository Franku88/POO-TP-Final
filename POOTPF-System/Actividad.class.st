"
Se realiza durante los viajes Organizados.
Instance Variables
descripcion:		<String>


"
Class {
	#name : #Actividad,
	#superclass : #Object,
	#instVars : [
		'descripcion'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #accessing }
Actividad >> descripcion [
	^descripcion.
]

{ #category : #accessing }
Actividad >> descripcion: unaDescripcion [
	descripcion := unaDescripcion.
]

{ #category : #verifying }
Actividad >> esOpcional [
	^false.
]

{ #category : #initialization }
Actividad >> inicializarDescripcion: unaDescripcion [
	"Inicializa Excursion"
	descripcion := unaDescripcion.
]

{ #category : #comparing }
Actividad >> tieneDescripcion: des [
	^(des = self descripcion).
]

{ #category : #printing }
Actividad >> toString [
	|cadena|.
	cadena := '			Descripcion: ',descripcion.
	^cadena.
]

{ #category : #verifying }
Actividad >> verificarCantPersonas: unaCant [
	^false.
]

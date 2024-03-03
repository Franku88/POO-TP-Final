"
Instance Variables
cantDias:		<Integer>
colExcursiones:		<OrderedCollection>
diaLlegada:		<String>
nombreHotel:		<String>
tipoPension:		<String>
"
Class {
	#name : #Etapa,
	#superclass : #Object,
	#instVars : [
		'diaLlegada',
		'cantDias',
		'nombreHotel',
		'tipoPension',
		'colExcursiones'
	],
	#category : #'POOTPF-System'
}

{ #category : #creating }
Etapa class >> crear: unaCant diaLlegada: unDia nombreHotel: unNombre tipoPension: unTipo colExcursiones: unaCol [
	"Constructor de Etapa"
	|unaEtapa|.
	unaEtapa := self new.
	unaEtapa inicializarCantDias: unaCant diaLlegada: unDia nombreHotel: unNombre tipoPension: unTipo colExcursiones: unaCol.
	^unaEtapa. 
]

{ #category : #accessing }
Etapa >> cantDias [
	^cantDias.
]

{ #category : #accessing }
Etapa >> cantDias: unaCant [
	cantDias := unaCant.
]

{ #category : #accessing }
Etapa >> colExcursiones [
	^colExcursiones.
]

{ #category : #accessing }
Etapa >> colExcursiones: unaCol [
	colExcursiones := unaCol.
]

{ #category : #accessing }
Etapa >> diaLlegada [
	^diaLlegada.
]

{ #category : #accessing }
Etapa >> diaLlegada: unDia [
	diaLlegada := unDia.
]

{ #category : #initialization }
Etapa >> inicializarCantDias: unaCant diaLlegada: unDia nombreHotel: unNombre tipoPension: unTipo colExcursiones: unaCol [
	"Inicializa variables de Etapa"
	cantDias := unaCant.
	nombreHotel := unNombre.
	tipoPension := unTipo.
	diaLlegada := unDia.
	colExcursiones := unaCol.
]

{ #category : #accessing }
Etapa >> nombreHotel [
	^nombreHotel.
]

{ #category : #accessing }
Etapa >> nombreHotel: unNombre [
	nombreHotel := unNombre.
]

{ #category : #accessing }
Etapa >> tipoPension [
	^tipoPension.
]

{ #category : #accessing }
Etapa >> tipoPension: unTipo [
	tipoPension := unTipo.
]

{ #category : #printing }
Etapa >> toString [
	|cadena excursiones|.
	excursiones := self toStringExcursiones.
	cadena := 'Llegada: ',diaLlegada,', Dias: ',cantDias asString,', Hotel: ',nombreHotel,', Tipo de pension: ',tipoPension,', ',String cr,'Excursiones: ',String cr,excursiones.
	^cadena.
]

{ #category : #printing }
Etapa >> toStringExcursiones [
	|cadena|.
	cadena := ''.
	colExcursiones do: [:cadaExc|
			cadena := cadena,cadaExc toString,String cr.
		].
	(cadena = '') ifTrue: [  
		cadena := 'Sin excursiones',String cr.
	].
	^cadena.
]

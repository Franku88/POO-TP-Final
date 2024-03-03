"
Instance Variables
	cupo:		<Integer>
	fecha:		<Date>
"
Class {
	#name : #FechaSalida,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'cupo'
	],
	#category : #'POOTPF-System'
}

{ #category : #creating }
FechaSalida class >> crear: unaFecha cupo: unCupo [
	"Constructor de FechaSalida"
	|unaFechaSalida|.
	unaFechaSalida := self new.
	unaFechaSalida inicializarFecha: unaFecha cupo: unCupo.
	^unaFechaSalida. 
]

{ #category : #accessing }
FechaSalida >> cupo [
	^cupo.
]

{ #category : #accessing }
FechaSalida >> cupo: unCupo [
	cupo := unCupo.
]

{ #category : #accessing }
FechaSalida >> fecha [
	^fecha.
]

{ #category : #accessing }
FechaSalida >> fecha: unaFecha [
	fecha := unaFecha.

]

{ #category : #initialization }
FechaSalida >> inicializarFecha: unaFecha cupo: unCupo [
	"Incializa variables de FechaSalida"
	fecha := unaFecha.
	cupo := unCupo.
]

{ #category : #updating }
FechaSalida >> ocupar: unaCantP [
	"Actualiza el cupo actual restando unaCantP"
	cupo := cupo - unaCantP.
]

{ #category : #verifying }
FechaSalida >> tieneFecha: unaFecha [
	"Verifica si el objeto actual tiene unaFecha"
	^(fecha = unaFecha).
]

{ #category : #verifying }
FechaSalida >> tieneFechaRango: f1 hasta: f2 [
	"Verifica si tiene fecha en el intervalo [f1, f2]"
	|exito|.
	exito := fecha between: f1 and: f2.
	^exito.
]

{ #category : #printing }
FechaSalida >> toString [
	|cadena|.
	cadena := fecha ddmmyyyy,', Cupo: ',cupo asString.
	^cadena.
]

{ #category : #verifying }
FechaSalida >> verificarCupo: cantP [
	"Verifica si hay cupo para cantP"
	^ (cupo >= cantP).
]

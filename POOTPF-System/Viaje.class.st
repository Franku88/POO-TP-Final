"
Instance Variables
costoPorPersona:		<Double>
nombre:		<String>
valorImpuestos:		<Double>
"
Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'costoPorPersona',
		'valorImpuestos'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #creating }
Viaje class >> crear: unNombre costoPorPersona: unCosto valorImpuestos: unValor [
	"Constructor de Viaje"
	|unViaje|.
	unViaje := self new.
	unViaje inicializarNombre: unNombre costoPorPersona: unCosto  valorImpuestos: unValor.
	^unViaje.
]

{ #category : #searching }
Viaje >> buscarFecha: unaFecha [
	^nil.
]

{ #category : #searching }
Viaje >> buscarFechaSalidaConCupo: unaFecha cantPersonas: cantP [
	"Busca y retorna una FechaSalida con cupo para cantP"
	|unaFechaSalida|.
	unaFechaSalida := self buscarFecha: unaFecha.
	(unaFechaSalida notNil) ifTrue: [ 
		(unaFechaSalida verificarCupo: cantP) ifFalse: [
				unaFechaSalida := nil.
			].
	].
	^unaFechaSalida.
]

{ #category : #calculating }
Viaje >> calcularMontoPara: cantP [
	"Calcula el total del viaje para cantP personas"
	|total|.
	total := ((costoPorPersona * cantP) + valorImpuestos) roundTo: 0.01.
	^total. 
]

{ #category : #calculating }
Viaje >> calcularPlusFecha: unaFecha personas: cantPersonas [
	^(-1)
]

{ #category : #accessing }
Viaje >> costoPorPersona [
	^costoPorPersona.
]

{ #category : #accessing }
Viaje >> costoPorPersona: unCosto [
	costoPorPersona := unCosto roundTo: 0.01.
]

{ #category : #updating }
Viaje >> desocupar: fechaSeleccionada personas: cantPersonas [
	"Definido en subclases"
	"Si se encuentra la fecha ingresada, se la desocupa en cantPersonas"
	^false.
]

{ #category : #verifying }
Viaje >> esOrganizado [
	^false.
]

{ #category : #verifying }
Viaje >> esVigente [
	^false
]

{ #category : #accessing }
Viaje >> getColFechasVigentes [
	^ (OrderedCollection new).
]

{ #category : #accessing }
Viaje >> getColFechasVigentesExcepto: unaDate [
	^ (OrderedCollection new).
]

{ #category : #accessing }
Viaje >> getExcursionOpcional: unaDesc [
	^nil.
	
]

{ #category : #initialization }
Viaje >> inicializarNombre: unNombre costoPorPersona: unCosto valorImpuestos: unValor [
	"Inicializa variables de Viaje"
	nombre := unNombre.
	costoPorPersona := unCosto roundTo: 0.01.
	valorImpuestos := unValor.
]

{ #category : #updating }
Viaje >> modificarCosto: unCostoP valorImpuestos: unImpuesto [
	"Modifica atributos de Viaje"
	costoPorPersona := unCostoP.
	valorImpuestos := unImpuesto.
]

{ #category : #accessing }
Viaje >> nombre [
	^nombre.
]

{ #category : #accessing }
Viaje >> nombre: unNombre [
	nombre := unNombre.
]

{ #category : #updating }
Viaje >> ocupar: fechaSeleccionada personas: cantPersonas [
	^false.
]

{ #category : #comparing }
Viaje >> tieneNombre: unNombre [
	^(nombre = unNombre).
]

{ #category : #printing }
Viaje >> toString [
	|cadena|.
	cadena := '	Nombre: ',nombre,String cr,
	'	Costo por persona: $',costoPorPersona asString,String cr,
	'	Impuestos: $',valorImpuestos asString.
	^cadena.
]

{ #category : #accessing }
Viaje >> valorImpuestos [
	^valorImpuestos.
]

{ #category : #accessing }
Viaje >> valorImpuestos: unValor [
 	valorImpuestos := unValor.
]

{ #category : #verifying }
Viaje >> verificarSalidaRango: f1 hasta: f2 [
	^false.
]

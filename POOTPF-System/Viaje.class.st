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
	#category : #'POOTPF-System'
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
	total := (costoPorPersona * cantP) + valorImpuestos.
	^total. 
]

{ #category : #accessing }
Viaje >> costoPorPersona [
	^costoPorPersona.
]

{ #category : #accessing }
Viaje >> costoPorPersona: unCosto [
	costoPorPersona := unCosto.
]

{ #category : #verifying }
Viaje >> esOrganizado [
	^false.
]

{ #category : #initialization }
Viaje >> inicializarNombre: unNombre costoPorPersona: unCosto valorImpuestos: unValor [
	"Inicializa variables de Viaje"
	nombre := unNombre.
	costoPorPersona := unCosto.
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

{ #category : #comparing }
Viaje >> tieneNombre: unNombre [
	^(nombre = unNombre).
]

{ #category : #printing }
Viaje >> toString [
	|cadena|.
	cadena := 'Nombre: ',nombre,', Costo por persona: $',costoPorPersona asString,', Impuestos: $',valorImpuestos asString.
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

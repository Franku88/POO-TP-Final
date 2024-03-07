"
Instance Variables
cantDias:		<Integer>
colEtapas:		<OrderedCollection>
colFechasSalida:		<OrderedCollection>
"
Class {
	#name : #ViajeOrganizado,
	#superclass : #Viaje,
	#instVars : [
		'colFechasSalida',
		'cantDias',
		'colEtapas'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #creating }
ViajeOrganizado class >> crear: unNombre costoPorPersona: unCosto valorImpuestos: unValor cantDias: unaCant colFechasSalida: unaCol colEtapas: otraCol [
	"Constructor de ViajeOrganizado"
	|unViaje|.
	unViaje := self crear: unNombre  costoPorPersona: unCosto valorImpuestos: unValor.
	unViaje inicializarCantDias: unaCant colFechasSalida: unaCol colEtapas: otraCol.
	^unViaje.
]

{ #category : #searching }
ViajeOrganizado >> buscarFecha: unaFecha [
	"busca en colFechasSalida la que tenga unaFecha y la retorna, en caso contrario, retorna nil"
	|unaFechaSalida|.
	unaFechaSalida := colFechasSalida detect: [:cadaFechaSalida| 
			cadaFechaSalida tieneFecha: unaFecha. 
		] ifNone: [ 
			unaFechaSalida := nil.
		].
	^unaFechaSalida.
]

{ #category : #accessing }
ViajeOrganizado >> cantDias [
	^cantDias.
]

{ #category : #accessing }
ViajeOrganizado >> cantDias: unaCant [
	cantDias := unaCant.
]

{ #category : #accessing }
ViajeOrganizado >> colEtapas [
	^colEtapas.
]

{ #category : #accessing }
ViajeOrganizado >> colEtapas: unaCol [
	colEtapas := unaCol.
]

{ #category : #accessing }
ViajeOrganizado >> colFechasSalida [
	^colFechasSalida.
]

{ #category : #accessing }
ViajeOrganizado >> colFechasSalida: unaCol [
	colFechasSalida := unaCol.
]

{ #category : #verifying }
ViajeOrganizado >> esOrganizado [
	^true.
]

{ #category : #initialization }
ViajeOrganizado >> inicializarCantDias: unaCant colFechasSalida: unaCol colEtapas: otraCol [
	"Inicializa variables de ViajeOrganizado"
	cantDias := unaCant.
	colFechasSalida := unaCol.
	colEtapas := otraCol.
]

{ #category : #verifying }
ViajeOrganizado >> tieneFecha: unaFecha [
	"Retorna verdadero si fechaSalida tiene unaFecha"
	|exito unaFechaSalida|.
	unaFechaSalida := colFechasSalida detect: [:cadaFechaSalida|
			cadaFechaSalida tieneFecha: unaFecha.	  
		] ifNone: [
			unaFechaSalida := nil.
		].
	exito := unaFechaSalida notNil.
	^exito.
]

{ #category : #accessing }
ViajeOrganizado >> toString [
	|cadena salidas etapas|.
	cadena := super toString.
	salidas := self toStringSalidas.
	etapas := self toStringEtapas.
	cadena := '----- ',cadena,', Dias de viaje: ',cantDias asString,', ',String cr,'Salidas: ',String cr,salidas,String cr,' Etapas: ',String cr, etapas, ' -----',String cr.
	^cadena.	
]

{ #category : #accessing }
ViajeOrganizado >> toStringEtapas [
	|cadena|.
	cadena := ''.
	colEtapas do: [:cadaEtapa|  
			cadena := cadena,cadaEtapa toString,String cr.
		].
	(cadena = '') ifTrue: [  
		cadena := 'Sin etapas',String cr.
	].
	^cadena.
]

{ #category : #accessing }
ViajeOrganizado >> toStringSalidas [
	|cadena|.
	cadena := ''.
	colFechasSalida do: [:cadaFechaSalida|  
			cadena := cadena,cadaFechaSalida toString,String cr.
		].
	(cadena = '') ifTrue: [  
		cadena := 'Sin fechas de salida',String cr.
	].
	^cadena.
]

{ #category : #verifying }
ViajeOrganizado >> verificarSalidaRango: f1 hasta: f2 [
	"Retorna verdadero si el viaje tiene fecha entre el intervalo [f1, f2]"
	|unaFechaSalida|.
	unaFechaSalida := colFechasSalida detect: [:cadaFechaSalida|
			cadaFechaSalida tieneFechaRango: f1 hasta: f2.
		] ifNone: [
			unaFechaSalida := nil.
		].
	^(unaFechaSalida notNil).
]

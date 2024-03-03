"
Instance Variables
cantCuotas:		<Integer>
cantPersonas:		<Integer>
fechaContrato:		<Date>
fechaProxVencimiento:		<Date>
fechaSeleccionada:		<Date>
numero:		<Integer>
viaje:		<Viaje>
colExcursiones:		<OrderedCollection>
cantCuotasPagadas:		<Integer>
esEfectivo: 		<Boolean>
"
Class {
	#name : #Contrato,
	#superclass : #Object,
	#instVars : [
		'numero',
		'fechaContrato',
		'viaje',
		'fechaSeleccionada',
		'cantPersonas',
		'cantCuotas',
		'fechaProxVencimiento',
		'colExcursiones',
		'cantCuotasPagadas',
		'esEfectivo'
	],
	#category : #'POOTPF-System'
}

{ #category : #creating }
Contrato class >> crear: unNumero viaje: unViaje cantPersonas: unaCant cantCuotas: otraCant fechaSeleccionada: unaFecha [ 
	"Constructor de Contrato"
	|unContrato|.
	unContrato := self new.
	unContrato inicializarNumero: unNumero viaje: unViaje cantPersonas: unaCant cantCuotas: otraCant fechaSeleccionada: unaFecha.
	^unContrato.
]

{ #category : #updating }
Contrato >> agregarExcursion: unaExc [
	"Agrega unaExc a colExcursiones si es posible"
	|exito|.
	exito := self puedeAgregarExcursion.
	(exito) ifTrue: [  
			exito := viaje esOrganizado.
			(exito) ifTrue: [  
					exito := unaExc verificarCantPersonas: cantPersonas.
					(exito) ifTrue: [  
							colExcursiones add: unaExc.
						].
				].
		].
	^exito.
]

{ #category : #updating }
Contrato >> bajar [
	"Baja del Contrato actual si es posible, retorna monto a reembolsar, retorna -1 si no se realiza baja"
	|reembolso unMonto|.
	reembolso := -1.
	(esEfectivo) ifFalse: [  
			unMonto := self calcularMontoTotal.
			reembolso := self calcularReembolso: unMonto.
		].
	^reembolso.
]

{ #category : #calculating }
Contrato >> calcularCuotas: cantC [
	"Calcula el monto a cobrar de cantC cuotas. Si hay menos cuotas faltantes que cantC, retorna -1"
	|unMonto exito|.
	unMonto := -1.
	exito := cantC <= (cantCuotas - cantCuotasPagadas).
	(exito) ifTrue: [  
			unMonto := ((self calcularMontoTotal)/cantCuotas)*cantC.
		].
	^unMonto.
]

{ #category : #calculating }
Contrato >> calcularExtraExcursiones [
	"Calcula el total de extras por excursiones opcionales"
	|extra|.
	extra := 0.
	colExcursiones do: [:cadaExc|  
			extra := extra + (cadaExc costo).
		].
	^extra.
]

{ #category : #calculating }
Contrato >> calcularMontoTotal [
	"Realiza el calculo del monto total a pagar del contrato"
	|unMonto extra|.
	unMonto := viaje calcularMontoPara: cantPersonas.
	extra := self calcularExtraExcursiones.
	unMonto := unMonto + extra.
	^unMonto.
]

{ #category : #calculating }
Contrato >> calcularReembolso: unMonto [
	"Calcula reembolso a realizar dependiendo el caso"
	|reembolso|.
	reembolso := -1.
	(fechaSeleccionada >= ((Date today) addMonths: 3)) ifTrue: [  
			reembolso := unMonto * 0.75.
		] ifFalse: [
			(fechaSeleccionada > (Date today addMonths: 2)) ifTrue: [
				reembolso := unMonto * 0.5.
			] ifFalse: [
				reembolso := unMonto * 0.25.
			].	
		].
	^reembolso.
]

{ #category : #accessing }
Contrato >> cantCuotas [
	^cantCuotas.
]

{ #category : #accessing }
Contrato >> cantCuotas: unaCant [
	cantCuotas := unaCant.
]

{ #category : #accessing }
Contrato >> cantCuotasPagadas [
	^cantCuotasPagadas.
]

{ #category : #accessing }
Contrato >> cantCuotasPagadas: unaCant [
	cantCuotasPagadas := unaCant.
]

{ #category : #accessing }
Contrato >> cantPersonas [
	^cantPersonas.
]

{ #category : #accessing }
Contrato >> cantPersonas: unaCant [
	cantPersonas := unaCant.
]

{ #category : #accessing }
Contrato >> colExcursiones [
	^colExcursiones.
]

{ #category : #accessing }
Contrato >> colExcursiones: unaCol [
	colExcursiones := unaCol.
]

{ #category : #updating }
Contrato >> efectivizar [
	"Efectiviza el contrato actual si fuese el caso"
	esEfectivo := Date today >= fechaSeleccionada.
	^esEfectivo.
]

{ #category : #accessing }
Contrato >> esEfectivo [
	^esEfectivo.
]

{ #category : #accessing }
Contrato >> esEfectivo: unBooleano [
	esEfectivo := unBooleano.
]

{ #category : #verifying }
Contrato >> esFlexible [
	^false.
]

{ #category : #accessing }
Contrato >> fechaContrato [
	^fechaContrato.
]

{ #category : #accessing }
Contrato >> fechaContrato: unaFecha [
	fechaContrato := unaFecha.
]

{ #category : #accessing }
Contrato >> fechaProxVencimiento [
	^fechaProxVencimiento.
]

{ #category : #accessing }
Contrato >> fechaProxVencimiento: unaFecha [
	fechaProxVencimiento := unaFecha.
]

{ #category : #accessing }
Contrato >> fechaSeleccionada [
	^fechaSeleccionada.
]

{ #category : #accessing }
Contrato >> fechaSeleccionada: unaFecha [
	fechaSeleccionada := unaFecha.
]

{ #category : #initialization }
Contrato >> inicializarNumero: unNumero viaje: unViaje cantPersonas: unaCant cantCuotas: otraCant fechaSeleccionada: unaFecha [ 
	"Inicializa variables de Contrato"
	numero := unNumero.
	viaje := unViaje.
	cantPersonas := unaCant.
	cantCuotas := otraCant.
	fechaSeleccionada := unaFecha.
	"fechaContrato es la fecha actual y fechaProxVencimiento es la fecha actual + 30 dias"
	fechaContrato := Date today.
	fechaProxVencimiento := (Date today) addDays: 30.
	"Inicializa colExcursiones vacia, sin cuotas pagadas y no efectivo"
	colExcursiones := OrderedCollection new.
	cantCuotasPagadas := 0.
	esEfectivo := false.
]

{ #category : #accessing }
Contrato >> numero [
	^numero.
]

{ #category : #accessing }
Contrato >> numero: unNumero [
	numero := unNumero.
]

{ #category : #updating }
Contrato >> pagar: cantC [
	"Actualiza las cuotas pagadas y fechaProxVencimiento si es posible"
	|exito|.
	exito := (cantCuotas - cantCuotasPagadas) >= cantC.
	(exito) ifTrue: [  
			fechaProxVencimiento := fechaProxVencimiento addDays: (cantC*30).
			cantCuotasPagadas := cantCuotasPagadas + cantC.
		].
	^exito.
]

{ #category : #verifying }
Contrato >> porVencer [
	"Retorna verdadero si el contrato vencera en menos de 7 dias"
	|exito|.
	exito := ((Date today) addDays: 7) > fechaProxVencimiento.
	^exito.
]

{ #category : #verifying }
Contrato >> puedeAgregarExcursion [
	"Retorna verdadero si esta dentro del plazo para agregar excursiones opcionales"
	|esPosible|.
	esPosible := ((Date today) addDays: 7) < fechaSeleccionada.
	^esPosible.
]

{ #category : #verifying }
Contrato >> tieneNumero: unNum [
	"Verifica si numero del Contrato es igual a unNum"
	^ (numero = unNum).
]

{ #category : #verifying }
Contrato >> tieneViajeConNombre: unNombre [
	"Retorna verdadero si viaje de Contrato tiene unNombre"
	^(viaje tieneNombre: unNombre)
]

{ #category : #printing }
Contrato >> toString [
	|cadena excursiones|.
	excursiones := self toStringExcursiones.
	cadena := 'Numero: ',numero asString,', Fecha de contrato: ',fechaContrato ddmmyyyy,', ',String cr,'Viaje: ',String cr,(viaje toString),'Fecha seleccionada: ',fechaSeleccionada ddmmyyyy,', Personas: ',cantPersonas asString,', Cuotas: ',cantCuotas asString,', Proximo vencimiento: ',fechaProxVencimiento ddmmyyyy,', ',String cr,'Excursiones opcionales: ',String cr,'',excursiones,'Cuotas pagadas: ',cantCuotasPagadas asString,', Efectivo: ',esEfectivo asString.
	^cadena
]

{ #category : #printing }
Contrato >> toStringExcursiones [
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

{ #category : #accessing }
Contrato >> viaje [
	^viaje.
]

{ #category : #accessing }
Contrato >> viaje: unViaje [
	viaje := unViaje.
]
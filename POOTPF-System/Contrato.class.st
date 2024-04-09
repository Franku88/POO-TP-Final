"
Instance Variables
cantCuotas:		<Integer>
cantPersonas:		<Integer>
fechaContrato:		<Date>
fechaProxVencimiento:		<Date>
fechaSeleccionada:		<Date>
numero:		<Integer>
viaje:		<Viaje>
colReservas:		<OrderedCollection>
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
		'cantCuotasPagadas',
		'esEfectivo',
		'colReservas'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #creating }
Contrato class >> crear: unNumero viaje: unViaje cantPersonas: unaCant cantCuotas: otraCant fechaSeleccionada: unaFecha [ 
	"Constructor de Contrato"
	|unContrato|.
	unContrato := self new.
	unContrato inicializarNumero: unNumero viaje: unViaje cantPersonas: unaCant cantCuotas: otraCant fechaSeleccionada: unaFecha.
	^unContrato.
]

{ #category : #adding }
Contrato >> agregarReserva: unaRes [
	colReservas add: unaRes.
	self changed.
]

{ #category : #updating }
Contrato >> agregarReserva: unaExc cantPersonas: unaCant [
	"Agrega unaExc a colReservas si es posible"
	|exito|.
	exito := self puedeAgregarExcursion.
	(exito) ifTrue: [  
			exito := viaje esOrganizado.
			(exito) ifTrue: [
					self agregarReserva: (ReservaExcursion crear: unaExc cantPersonas: unaCant).
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
			unMonto := self calcularPagado.
			reembolso := self calcularReembolso: unMonto.
			viaje desocupar: fechaSeleccionada personas: cantPersonas.
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
			unMonto := ((self calcularMonto)/cantCuotas)*cantC.
		].
	^unMonto.
]

{ #category : #calculating }
Contrato >> calcularExtraReservas [
	"Calcula el total de extras por excursiones opcionales"
	|extra|.
	extra := 0.
	colReservas do: [:cadaRes|  
			extra := extra + (cadaRes costoExtra).
		].
	^extra.
]

{ #category : #calculating }
Contrato >> calcularMonto [
	"Realiza el calculo del monto total a pagar del contrato sin excursiones"
	|unMonto |.
	unMonto := viaje calcularMontoPara: cantPersonas.
	^unMonto.
]

{ #category : #calculating }
Contrato >> calcularMontoTotal [
	"Realiza el calculo del monto total a pagar del contrato con reservas pagadas"
	|unMonto extra|.
	unMonto := viaje calcularMontoPara: cantPersonas.
	extra := self calcularExtraReservas.
	unMonto := unMonto + extra.
	^unMonto.
]

{ #category : #calculating }
Contrato >> calcularPagado [
	^((self calcularMonto/self cantCuotas)*(self cantCuotasPagadas) asFloat truncateTo: 0.01)
]

{ #category : #calculating }
Contrato >> calcularReembolso: unMonto [
	"Calcula reembolso a realizar dependiendo el caso"
	|reembolso|.
	reembolso := -1.
	(cantCuotasPagadas > 0) ifTrue:[
		(fechaSeleccionada >= ((Date today) addMonths: 3)) ifTrue: [  
			reembolso := unMonto * 0.75.
		] ifFalse: [
			(fechaSeleccionada > (Date today addMonths: 2)) ifTrue: [
				reembolso := unMonto * 0.5.
			] ifFalse: [
				reembolso := unMonto * 0.25.
			].	
		].
	] ifFalse:[
		reembolso := 0.
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
	self changed.
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
Contrato >> colReservas [
	^colReservas
]

{ #category : #accessing }
Contrato >> colReservas: unaCol [
	colReservas := unaCol.
]

{ #category : #updating }
Contrato >> efectivizar [
	"Efectiviza el contrato actual si fuese el caso"
	(self esEfectivo) ifFalse: [ 
			self esEfectivo: (Date today >= fechaSeleccionada).
		].
	^esEfectivo.
]

{ #category : #accessing }
Contrato >> esEfectivo [
	^esEfectivo.
]

{ #category : #accessing }
Contrato >> esEfectivo: unBooleano [
	esEfectivo := unBooleano.
	self changed.
]

{ #category : #verifying }
Contrato >> esFlexible [
	^false.
]

{ #category : #verifying }
Contrato >> esVigente [
	^ (self fechaSeleccionada > Date today).
]

{ #category : #accessing }
Contrato >> fechaContrato [
	^fechaContrato.
]

{ #category : #accessing }
Contrato >> fechaContrato: unaFecha [
	fechaContrato := unaFecha.
	self changed.
]

{ #category : #accessing }
Contrato >> fechaProxVencimiento [
	^fechaProxVencimiento.
]

{ #category : #accessing }
Contrato >> fechaProxVencimiento: unaFecha [
	fechaProxVencimiento := unaFecha.
	self changed.
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
	colReservas := OrderedCollection new.
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
	self changed.
]

{ #category : #updating }
Contrato >> pagar: cantC [
	"Actualiza las cuotas pagadas y fechaProxVencimiento si es posible"
	|exito|.
	exito := (cantCuotas - cantCuotasPagadas) >= cantC.
	(exito) ifTrue: [  
			self fechaProxVencimiento: (fechaProxVencimiento addDays: (cantC*30)).
			self cantCuotasPagadas: cantCuotasPagadas + cantC.
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
	^(viaje tieneNombre:  unNombre)
]

{ #category : #printing }
Contrato >> toString [
	|cadena reservas efec|.
	efec := 'No'.
	(self esEfectivo) ifTrue: [efec:= 'Si'].
	reservas := self toStringReservas.
	cadena := '	- Numero: ',numero asString,', Fecha de contrato: ',fechaContrato ddmmyyyy,', ',String cr,
	'	Viaje: ',String cr,(viaje toString),
	'	Fecha seleccionada: ',fechaSeleccionada ddmmyyyy,', Personas: ',cantPersonas asString,', Cuotas: ',cantCuotas asString,
	', Proximo vencimiento: ',fechaProxVencimiento ddmmyyyy,', ',String cr,
	'	Reservas: ',String cr,'',reservas,
	'	Cuotas pagadas: ',cantCuotasPagadas asString,
	', Es efectivo: ',efec, String cr.
	^cadena
]

{ #category : #printing }
Contrato >> toStringReservas [
	|cadena|.
	cadena := ''.
	colReservas do: [ :cadaRes |
			cadena := cadena,cadaRes toString,String cr.
		].
	(cadena = '') ifTrue: [  
		cadena := '		Sin reservas',String cr.
	].
	^cadena.
]

{ #category : #calculating }
Contrato >> valorCuota [
	^(self calcularMonto/cantCuotas) asFloat truncateTo: 0.01.
]

{ #category : #accessing }
Contrato >> viaje [
	^viaje.
]

{ #category : #accessing }
Contrato >> viaje: unViaje [
	viaje := unViaje.
	self changed.
]

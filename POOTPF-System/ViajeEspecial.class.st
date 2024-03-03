"
Instance Variables
ciudad:		<String>
fechaRegreso:		<Date>
fechaSalida:		<FechaSalida>
"
Class {
	#name : #ViajeEspecial,
	#superclass : #Viaje,
	#instVars : [
		'ciudad',
		'fechaSalida',
		'fechaRegreso'
	],
	#category : #'POOTPF-System'
}

{ #category : #creating }
ViajeEspecial class >> crear: unNombre costoPorPersona: unCosto valorImpuestos: unValor ciudad: unaCiudad fechaSalida: unaFechaSalida fechaRegreso: unaFecha [
	"Constructor de ViajeEspecial"
	|unViaje|.
	unViaje := self crear: unNombre costoPorPersona: unCosto valorImpuestos: unValor.
	unViaje inicializarCiudad: unaCiudad fechaSalida: unaFechaSalida fechaRegreso: unaFecha.
	^unViaje.
]

{ #category : #searching }
ViajeEspecial >> buscarFecha: unaFecha [
	"Retorna fechaSalida si tiene unaFecha, en caso contrario, retorna nil"
	|unaFechaSalida|.
	(fechaSalida tieneFecha: unaFecha) ifTrue: [
			 unaFechaSalida := fechaSalida.
		] ifFalse: [  
			unaFechaSalida := nil.
		].
	^unaFechaSalida.
]

{ #category : #accessing }
ViajeEspecial >> ciudad [
	^ciudad.
]

{ #category : #accessing }
ViajeEspecial >> ciudad: unaCiudad [
	ciudad := unaCiudad.
]

{ #category : #accessing }
ViajeEspecial >> fechaRegreso [
	^fechaRegreso.
]

{ #category : #accessing }
ViajeEspecial >> fechaRegreso: unaFecha [
	fechaRegreso := unaFecha.
]

{ #category : #accessing }
ViajeEspecial >> fechaSalida [
	^fechaSalida.
]

{ #category : #accessing }
ViajeEspecial >> fechaSalida: unaFecha [
	fechaSalida := unaFecha.
]

{ #category : #initialization }
ViajeEspecial >> inicializarCiudad: unaCiudad fechaSalida: unaFechaSalida fechaRegreso: unaFecha [
	"Inicializa variables de ViajeEspecial"
	ciudad := unaCiudad.
	fechaSalida := unaFechaSalida.
	fechaRegreso := unaFecha.
]

{ #category : #verifying }
ViajeEspecial >> tieneFecha: unaFecha [
	"Retorna verdadero si fechaSalida tiene unaFecha"
	|exito|.
	exito := fechaSalida tieneFecha: unaFecha.
	^exito.
]

{ #category : #printing }
ViajeEspecial >> toString [ 
	|cadena|.
	cadena := super toString.
	cadena := '----- ',cadena,', Ciudad: ',ciudad,', Salida: ',fechaSalida toString,', Regreso: ',fechaRegreso ddmmyyyy,' -----', String cr.
	^cadena.
]

{ #category : #verifying }
ViajeEspecial >> verificarSalidaRango: f1 hasta: f2 [
	"Retorna verdadero si el viaje tiene fecha entre el intervalo [f1, f2]"
	|exito|.
	exito := fechaSalida tieneFechaRango: f1 hasta: f2.
	^exito.
]
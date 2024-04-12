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
	#category : #'POOTPF-System-System'
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

{ #category : #calculating }
ViajeEspecial >> calcularPlusFecha: unaFecha personas: cantPersonas [
	|unPlus|
	unPlus := super calcularPlusFecha: unaFecha personas: cantPersonas.
	((fechaSalida tieneFecha: unaFecha) & (fechaSalida verificarCupo: cantPersonas)) ifTrue: [
			unPlus := fechaSalida calcularPlusPara: cantPersonas.
		].
	^unPlus.
]

{ #category : #updating }
ViajeEspecial >> cambiarCupo: unaFechaSalida cupo: unCupo [
	|exito|.
	exito := self fechaSalida = unaFechaSalida.
	exito ifTrue: [
			self fechaSalida cupo: unCupo.
			self changed.
		].
	^exito.
]

{ #category : #updating }
ViajeEspecial >> cambiarFechaRegreso: unaFecha [
	|exito|.
	exito := unaFecha > self fechaSalida fecha.
	exito ifTrue: [
			self fechaRegreso: unaFecha.
		].
	^exito.
]

{ #category : #accessing }
ViajeEspecial >> ciudad [
	^ciudad.
]

{ #category : #accessing }
ViajeEspecial >> ciudad: unaCiudad [
	ciudad := unaCiudad.
	self changed.
]

{ #category : #updating }
ViajeEspecial >> desocupar: fechaSeleccionada personas: cantPersonas [
	"Si se encuentra la fecha ingresada, se la desocupa en cantPersonas"
	|res|.
	res := fechaSalida tieneFecha: fechaSeleccionada.
	(res) ifTrue: [
			fechaSalida desocupar: cantPersonas.
		].
	^res.
	
]

{ #category : #verifying }
ViajeEspecial >> esVigente [
	^(self fechaSalida esVigente).
]

{ #category : #accessing }
ViajeEspecial >> fechaRegreso [
	^fechaRegreso.
]

{ #category : #accessing }
ViajeEspecial >> fechaRegreso: unaFecha [
	fechaRegreso := unaFecha.
	self changed.
]

{ #category : #accessing }
ViajeEspecial >> fechaSalida [
	^fechaSalida.
]

{ #category : #accessing }
ViajeEspecial >> fechaSalida: unaFecha [
	fechaSalida := unaFecha.
	self changed.
]

{ #category : #accessing }
ViajeEspecial >> getColFechasVigentes [
	|col|.
	col := OrderedCollection new.
	(self fechaSalida tieneCupo) ifTrue: [ 
		col add: self fechaSalida.
	].
	^col.
]

{ #category : #accessing }
ViajeEspecial >> getColFechasVigentesExcepto: unaDate [
	|col|.
	col := OrderedCollection new.
	((self fechaSalida tieneCupo) & (self fechaSalida tieneFecha: unaDate) not) ifTrue: [ 
		col add: self fechaSalida.
	].
	^col.
]

{ #category : #initialization }
ViajeEspecial >> inicializarCiudad: unaCiudad fechaSalida: unaFechaSalida fechaRegreso: unaFecha [
	"Inicializa variables de ViajeEspecial"
	ciudad := unaCiudad.
	fechaSalida := unaFechaSalida.
	fechaRegreso := unaFecha.
]

{ #category : #updating }
ViajeEspecial >> ocupar: fechaSeleccionada personas: cantPersonas [
	"Si se encuentra la fecha ingresada, se la ocupa en cantPersonas"
	|res|.
	res := (fechaSalida tieneFecha: fechaSeleccionada) & (fechaSalida verificarCupo: cantPersonas).
	(res) ifTrue: [
			fechaSalida ocupar: cantPersonas.
		].
	^res.
	
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
	cadena := cadena,String cr,String cr,'	Ciudad: ',self ciudad,String cr,String cr,
		'	Salida: ',fechaSalida toString,String cr,String cr,
		'	Regreso: ',fechaRegreso ddmmyyyy,String cr.
	^cadena.
]

{ #category : #verifying }
ViajeEspecial >> verificarSalidaRango: f1 hasta: f2 [
	"Retorna verdadero si el viaje tiene fecha entre el intervalo [f1, f2]"
	|exito|.
	exito := fechaSalida tieneFechaRango: f1 hasta: f2.
	^exito.
]

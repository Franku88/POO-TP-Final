"
Instance Variables
cantDias:		<Integer>
colEtapas:		<OrderedCollection>
colFechasSalida:		<OrderedCollection>
colExcursionesOpcionales: 	<OrderedCollection>
"
Class {
	#name : #ViajeOrganizado,
	#superclass : #Viaje,
	#instVars : [
		'colFechasSalida',
		'cantDias',
		'colEtapas',
		'colExcursionesOpcionales'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #creating }
ViajeOrganizado class >> crear: unNombre costoPorPersona: unCosto valorImpuestos: unValor cantDias: unaCant colFechasSalida: unaCol colEtapas: otraCol colExcursionesOpcionales: otraColMas [
	"Constructor de ViajeOrganizado"
	|unViaje|.
	unViaje := self crear: unNombre  costoPorPersona: unCosto valorImpuestos: unValor.
	unViaje inicializarCantDias: unaCant colFechasSalida: unaCol colEtapas: otraCol colExcursionesOpcionales: otraColMas.
	^unViaje.
]

{ #category : #accessing }
ViajeOrganizado >> agregarExcursionOpcional: unaExc [
	colExcursionesOpcionales add: unaExc.
	self changed.
]

{ #category : #searching }
ViajeOrganizado >> buscarExcursionConDescripcion: unaDesc [
	|unaExc|.
	unaExc := colExcursionesOpcionales detect: [:cadaExc|
			cadaExc tieneDescripcion: unaDesc.			
		] ifNone: [
			nil.
		].
	^unaExc.
	
	
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

{ #category : #calculating }
ViajeOrganizado >> calcularPlusFecha: unaFecha personas: cantPersonas [
	|unPlus unaFechaSalida|
	unPlus := super calcularPlusFecha: unaFecha personas: cantPersonas.
	unaFechaSalida := colFechasSalida detect: [:cadaFecha|
			(cadaFecha tieneFecha: unaFecha) & (cadaFecha verificarCupo: cantPersonas)
		] ifNone: [
			nil
		].
	(unaFechaSalida) ifNotNil: [
			unPlus := unaFechaSalida calcularPlusPara: cantPersonas.
		].
	^unPlus.
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
ViajeOrganizado >> colExcursionesOpcionales [
	^colExcursionesOpcionales.
]

{ #category : #accessing }
ViajeOrganizado >> colExcursionesOpcionales: unaCol [
	colExcursionesOpcionales := unaCol.
	self changed.
]

{ #category : #accessing }
ViajeOrganizado >> colFechasSalida [
	^colFechasSalida.
]

{ #category : #accessing }
ViajeOrganizado >> colFechasSalida: unaCol [
	colFechasSalida := unaCol.
]

{ #category : #updating }
ViajeOrganizado >> desocupar: fechaSeleccionada personas: cantPersonas [
	"Si se encuentra la fecha ingresada, se la desocupa en cantPersonas"
	|fechaEncontrada res|.
	fechaEncontrada := colFechasSalida detect: [:cadaFecha |  
			cadaFecha tieneFecha: fechaSeleccionada.
		] ifNone:[
			nil.
		].
	res := fechaEncontrada isNotNil.
	(res) ifTrue: [
			fechaEncontrada desocupar: cantPersonas.
		].
	^res.
]

{ #category : #verifying }
ViajeOrganizado >> esOrganizado [
	^true.
]

{ #category : #verifying }
ViajeOrganizado >> esVigente [
	^ (colFechasSalida anySatisfy: [ :f | f esVigente]).
	
]

{ #category : #accessing }
ViajeOrganizado >> getColFechasVigentes [
	^ ((self colFechasSalida) select: [: cadaFecha | cadaFecha esVigente & cadaFecha tieneCupo]).
]

{ #category : #accessing }
ViajeOrganizado >> getColFechasVigentesExcepto: unaDate [
	^ ((self colFechasSalida) select: [: cadaFecha | 
		(cadaFecha tieneFecha: unaDate) not & cadaFecha esVigente & cadaFecha tieneCupo
		]).
]

{ #category : #accessing }
ViajeOrganizado >> getExcursionOpcional: unaDesc [
	"Retorna ExcursionOpcional con desc, busca en colExcursionesOpcionales"
	|exc|
	exc := colExcursionesOpcionales detect: [:cadaExc| 
			cadaExc tieneDescripcion: unaDesc.
		] ifNone: [
			nil
		].
	^exc.

]

{ #category : #initialization }
ViajeOrganizado >> inicializarCantDias: unaCant colFechasSalida: unaCol colEtapas: otraCol [
	"Inicializa variables de ViajeOrganizado"
	cantDias := unaCant.
	colFechasSalida := unaCol.
	colEtapas := otraCol.
	colExcursionesOpcionales := OrderedCollection new.
]

{ #category : #initialization }
ViajeOrganizado >> inicializarCantDias: unaCant colFechasSalida: unaCol colEtapas: otraCol colExcursionesOpcionales: otraColMas [
	"Inicializa variables de ViajeOrganizado"
	cantDias := unaCant.
	colFechasSalida := unaCol.
	colEtapas := otraCol.
	colExcursionesOpcionales := otraColMas.
]

{ #category : #updating }
ViajeOrganizado >> ocupar: fechaSeleccionada personas: cantPersonas [
	"Si se encuentra la fecha ingresada, se la ocupa en cantPersonas"
	|fechaEncontrada res|.
	fechaEncontrada := colFechasSalida detect: [:cadaFecha |  
			(cadaFecha tieneFecha: fechaSeleccionada) & (cadaFecha verificarCupo: cantPersonas).
		] ifNone:[
			nil.
		].
	res := fechaEncontrada isNotNil.
	(res) ifTrue: [
			fechaEncontrada ocupar: cantPersonas.
		].	
	^res.
]

{ #category : #updating }
ViajeOrganizado >> quitarExcursionOpcional: unaExc [
	|exito encontrado|.
	encontrado := colExcursionesOpcionales detect: [:cadaExc|
			cadaExc = unaExc.
		] ifNone: [
			nil.
		].
	exito := encontrado isNotNil.
	exito ifTrue: [
			colExcursionesOpcionales remove: encontrado.
		].
	self changed.
	^exito.
	
]

{ #category : #updating }
ViajeOrganizado >> quitarFechaSalida: unaFecha [
	"unaFecha = FechaSalida"
	|exito encontrado|.
	encontrado := colFechasSalida detect: [:cadaFecha|
			cadaFecha = unaFecha.
		] ifNone: [
			nil.
		].
	exito := encontrado isNotNil.
	exito ifTrue: [
			colFechasSalida remove: encontrado.
		].
	self changed.
	^exito.
	
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
	|cadena salidas etapas excs|.
	cadena := super toString.
	salidas := self toStringSalidas.
	etapas := self toStringEtapas.
	excs := self toStringExcursionesOpcionales.
	cadena := cadena,String cr,String cr,'	Dias de viaje: ',cantDias asString,String cr,String cr,
						'	Salidas: ',String cr,salidas,String cr,
						'	Etapas: ',String cr,etapas,
						'	Excursiones Opcionales: ',String cr, excs,String cr.
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
ViajeOrganizado >> toStringExcursionesOpcionales [
	|cadena|.
	cadena := ''.
	colExcursionesOpcionales  do: [ :cadaExc |
			cadena := cadena,cadaExc toString,String cr,String cr.
		].
	(cadena = '') ifTrue: [  
		cadena := '		Sin excursiones opcionales',String cr.
	].
	^cadena.
]

{ #category : #accessing }
ViajeOrganizado >> toStringSalidas [
	|cadena|.
	cadena := ''.
	colFechasSalida do: [:cadaFechaSalida|  
			cadena := cadena,'	',cadaFechaSalida toString,String cr.
		].
	(cadena = '') ifTrue: [  
		cadena := 'Sin fechas de salida'.
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

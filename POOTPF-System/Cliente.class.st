"
Instance Variables
apellido:		<String>
ciudad:		<String>
colContratos:		<OrderedCollection>
datosContacto:		<String>
dni:		<Integer>
esFrecuente:		<Boolean>
millas:		<Double>
dinero :		<Double>
preferencias:		<String>
"
Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'apellido',
		'dni',
		'ciudad',
		'datosContacto',
		'colContratos',
		'preferencias',
		'esFrecuente',
		'millas',
		'dinero'
	],
	#category : #'POOTPF-System-System'
}

{ #category : #creating }
Cliente class >> crear: unDni apellido: unApellido ciudad: unaCiudad datosContacto: unosDatos preferencias: unasPreferencias [
	|cli|.
	cli := self new.
	cli inicializarDni: unDni apellido: unApellido ciudad: unaCiudad datosContacto: unosDatos preferencias: unasPreferencias.
	^cli
]

{ #category : #updating }
Cliente >> actualizarFrecuencia [
	"Verifica si el cliente tiene algun contrato vigente con viaje organizado en menos de un anio,
	en cualquier caso, modifica su variable esFrecuente"
	|unCon|.
	unCon := colContratos detect: [:cadaContrato| 
			(cadaContrato esVigente) & (cadaContrato viaje esOrganizado) & ((cadaContrato fechaContrato addMonths: 12) > Date today).
		] ifNone: [		
			nil.
		].
	self esFrecuente: (unCon isNotNil).
]

{ #category : #'adding-removing' }
Cliente >> addContrato: unContrato [
	colContratos add: unContrato.
	self changed.
]

{ #category : #updating }
Cliente >> agregarReservaAContratoConNumero: unNum excursionOpcional: unaExc cantPersonas: unaCant [
	"Agrega unaExc a colReservas de Contrato con unNum si es posible"
	|unContrato exito|.
	unContrato := self buscarContratoConNumero: unNum.
	exito := unContrato notNil.
	(exito) ifTrue: [  
			exito := unContrato agregarReserva: unaExc cantPersonas: unaCant.
			(exito) ifTrue: [
					self cobrar: (unaExc costoPorPersona * unaCant). 
				].
		].
	^exito.
]

{ #category : #accessing }
Cliente >> apellido [
	^apellido.
]

{ #category : #accessing }
Cliente >> apellido: unApellido [
	apellido := unApellido.
	self changed.
]

{ #category : #updating }
Cliente >> bajar [
	"Elimina todo lo referido al cliente, sin reembolsos ya que el cliente mismo sera eliminado junto con sus datos (dinero, datos personales, etc)"
	colContratos do: [:cadaContrato|
			cadaContrato eliminar.
		].
	(colContratos isNotEmpty) ifTrue: [
			colContratos := OrderedCollection new.	
		].
	self changed.
]

{ #category : #updating }
Cliente >> bajarContratoConNumero: unNum [
	"Da de baja un Contrato con unNum y realiza reembolsos correspondientes si fuese el caso"
	|unContrato exito unValor|.
	unContrato := self buscarContratoConNumero: unNum.
	exito := unContrato notNil.
	(exito) ifTrue: [  
			unValor := unContrato bajar.
			exito := unValor >= 0.
			(exito) ifTrue: [  
					self reembolsar: unValor.
					self cancelarReservasDeContrato: unContrato.
					self borrarContrato: unContrato.
					self actualizarFrecuencia.
				].
		].
	^exito.
]

{ #category : #updating }
Cliente >> bajarContratosConViaje: unNombre [
	"Da de baja todos los contratos que referencien a viaje con unNombre, retorna verdadero si se bajo algun contrato"
	|bajado exito unValor colContratosBajados|.
	colContratosBajados := OrderedCollection new.
	bajado := false.
	exito := false.
	colContratos do: [:cadaContrato|  
			exito := cadaContrato tieneViajeConNombre: unNombre.
			(exito) ifTrue: [  
					unValor := cadaContrato bajar.
					(unValor >= 0) ifTrue: [  
							self reembolsar: unValor.
						] ifFalse: [
							cadaContrato eliminar.
						].
					colContratosBajados add: cadaContrato.
					bajado := true.
				].
		].
	(bajado) ifTrue: [  
			colContratos removeAll: colContratosBajados.
			self actualizarFrecuencia.
		].
	^bajado.
]

{ #category : #'adding-removing' }
Cliente >> borrarContrato: unContrato [
	colContratos remove: unContrato.
	self changed.
]

{ #category : #searching }
Cliente >> buscarContratoConNumero: unNum [
	"Busca y retorna un contrat con unNum de colContratos, en caso contrario, retorna nil"
	|unContrato|.
	unContrato := colContratos detect: [:cadaContrato|
			cadaContrato tieneNumero: unNum.
		] ifNone: [ 
			unContrato := nil.
		].
	^unContrato.
]

{ #category : #updating }
Cliente >> cancelarReservaAContratoConNumero: unNum unaReserva: unaRes [
	"Quita de colReservas a contrato con unNum y reembolsa si es posible"
	|unContrato exito|.
	unContrato := self buscarContratoConNumero: unNum.
	exito := unContrato notNil.
	(exito) ifTrue: [  
			exito := unContrato cancelarReserva: unaRes.
			(exito) ifTrue: [
					self sumarDinero: (unaRes costoExtra). 
				].
		].
	^exito.
]

{ #category : #updating }
Cliente >> cancelarReservasDeContrato: unContrato [
	(unContrato colReservas) do: [:cadaReserva|
			self sumarDinero: (cadaReserva costoExtra).
		].
	(unContrato colReservas isNotEmpty) ifTrue: [
			unContrato colReservas: (OrderedCollection new).	
		].
	
	

]

{ #category : #accessing }
Cliente >> ciudad [
	^ciudad.
]

{ #category : #accessing }
Cliente >> ciudad: unaCiudad [
	ciudad := unaCiudad.
	self changed.
]

{ #category : #updating }
Cliente >> cobrar: unMonto [
	"Cobra unMonto al dinero del Cliente, retorna falso si no tiene fondos suficientes"
	|exito|.
	exito := (dinero >= unMonto).
	(exito) ifTrue: [  
			self dinero: ((dinero - unMonto) roundTo: 0.01).
		].
	^exito.
		
]

{ #category : #accessing }
Cliente >> colContratos [
	^colContratos.
]

{ #category : #accessing }
Cliente >> colContratos: unaCol [
	colContratos := unaCol.
	self changed.
]

{ #category : #accessing }
Cliente >> datosContacto [
	^datosContacto.
]

{ #category : #accessing }
Cliente >> datosContacto: unosDatos [
	datosContacto := unosDatos.
	self changed.	
]

{ #category : #accessing }
Cliente >> dinero [
	^dinero.
]

{ #category : #accessing }
Cliente >> dinero: unValor [
	dinero := unValor roundTo: 0.01.
	self changed.
]

{ #category : #accessing }
Cliente >> dni [
	^dni.
]

{ #category : #accessing }
Cliente >> dni: unDni [
	dni := unDni.
	self changed.
]

{ #category : #updating }
Cliente >> efectivizarContratoConNumero: unNum [
	"Realiza la efectivizacion del contrato con unNum"
	|unContrato exito|.
	unContrato := self buscarContratoConNumero: unNum.
	exito := unContrato notNil.
	(exito) ifTrue: [  
			exito := unContrato efectivizar.
			(exito & esFrecuente) ifTrue: [  
					self sumarMillas: 100.
					self changed.
				].
		].
	^exito.
]

{ #category : #updating }
Cliente >> efectivizarContratos [
	"Efectiviz, si es posible, contratos del cliente"
	colContratos do: [:cadaContrato |  
			cadaContrato efectivizar.
		].
]

{ #category : #accessing }
Cliente >> esFrecuente [
	"Si contrato un viaje organizado en menos de un año"
	^esFrecuente.
]

{ #category : #accessing }
Cliente >> esFrecuente: booleano [
	esFrecuente := booleano.
	self changed.
]

{ #category : #accessing }
Cliente >> esFrecuenteString [
	|cad|.
	cad := 'No'.
	(self esFrecuente) ifTrue: [ 
		cad := 'Si'.	
	].
	^cad.
]

{ #category : #'adding-removing' }
Cliente >> generarContrato: unNum viaje: unViaje fechaSalida: unaFechaSalida cantPasajeros: cantP cantCuotas: cantC esFlexible: esFlex [
	"Metodo que crea y agrega un Contrato a la coleccion de contratos de Cliente"
	|unContrato exito|.
	"Verifica que no exista contrato con unNum"
	unContrato := self buscarContratoConNumero: unNum.
	exito := unContrato isNil.
	(exito) ifTrue: [ 
			unaFechaSalida ocupar: cantP.			
			(esFlex) ifTrue: [ 
					unContrato := ContratoFlexible crear: unNum viaje: unViaje cantPersonas: cantP 					cantCuotas: cantC fechaSeleccionada: (unaFechaSalida fecha).
				] ifFalse: [
					unContrato := Contrato crear: unNum viaje: unViaje cantPersonas: cantP 
					cantCuotas: cantC fechaSeleccionada: (unaFechaSalida fecha).
				].
			esFrecuente := unViaje esOrganizado.
			colContratos add: unContrato.
			self changed.
		].
	^exito.
]

{ #category : #initialization }
Cliente >> inicializarDni: unDni apellido: unApellido ciudad: unaCiudad datosContacto: unosDatos preferencias: unasPreferencias [
	"Inicializa datos de un cliente"
	dni := unDni.
	apellido := unApellido.
	ciudad := unaCiudad.
	datosContacto := unosDatos.
	preferencias := unasPreferencias.
	"colContratos inicia vacio, esFrecuente falso hasta que se cumpla la condicion, millas y dinero en 0"
	self colContratos: OrderedCollection new.
	self esFrecuente: false.
	self millas: 0.
	self dinero: 0.
	
]

{ #category : #accessing }
Cliente >> millas [
	^millas.
]

{ #category : #accessing }
Cliente >> millas: unasMillas [
	millas := unasMillas roundTo: 0.01.
	self changed.
]

{ #category : #updating }
Cliente >> modificarContratoConNumero: unNum fechaSeleccionada: unaFecha [
	"Modifica fechaSeleccionada de contrato con unNum cobrando unPlus"
	|unContrato exito unPlus|.
	unContrato := self buscarContratoConNumero: unNum.
	exito := unContrato notNil.
	(exito) ifTrue: [  
		exito := unContrato esFlexible.
		(exito) ifTrue: [  
			"Se realiza un calculo dependiendo de fecha y cupo restante"
			unPlus := unContrato calcularPlusFecha: unaFecha.
			exito := self cobrar: unPlus.				
			(exito) ifTrue: [  
					exito := unContrato modificarFechaSeleccionada: unaFecha.
					(exito) ifFalse: [  
							self sumarDinero: unPlus.
						].
				].
			].
		].
	^exito.

]

{ #category : #updating }
Cliente >> pagarCuotas: unNum cuotasAPagar: cantC [
	"Realiza el pago de cantC cuotas del contrato con unNum"
	|unContrato exito unMonto|.
	unContrato := self buscarContratoConNumero: unNum.
	exito := unContrato notNil.
	(exito) ifTrue: [
		 	unMonto := unContrato calcularCuotas: cantC.
			exito := unMonto > 0.
			(exito) ifTrue: [  
					exito := self cobrar: unMonto.
					(exito) ifTrue: [
							unContrato pagar: cantC.	
						].
				]. 
		].
	^exito.

]

{ #category : #accessing }
Cliente >> preferencias [
	^preferencias.
]

{ #category : #accessing }
Cliente >> preferencias: unasPreferencias [
	preferencias := unasPreferencias.
	self changed.
]

{ #category : #updating }
Cliente >> reembolsar: unValor [
	"Realiza un reembolso de unValor de millas o dinero, dependiendo el caso"
	(esFrecuente) ifTrue: [  
			self sumarMillas: unValor.
		] ifFalse: [
			self sumarDinero: unValor.
		].

]

{ #category : #updating }
Cliente >> sumarDinero: unValor [
	"Aumenta el dinero del Cliente en unValor"
	self dinero: ((dinero + unValor) roundTo: 0.01).


]

{ #category : #updating }
Cliente >> sumarMillas: unValor [
	"Adiciona millas al Cliente"
	self millas: ((millas + unValor) roundTo: 0.01).

]

{ #category : #searching }
Cliente >> tieneContratoConViajeYFecha: unViaje fechaSalida: unaFechaSalida [
	|encontrado|.
	encontrado := colContratos detect: [:cadaContrato|
			cadaContrato tieneViaje: unViaje fechaSalida: unaFechaSalida.
		] ifNone: [
			nil.
		].
	^(encontrado isNotNil)
]

{ #category : #verifying }
Cliente >> tieneContratoPorVencer [
	"Retorna verdadero si el cliente tiene un contrato por vencer"
	|unContrato|.
	unContrato := colContratos detect: [:cadaContrato|
			cadaContrato porVencer.
		] ifNone: [
			unContrato := nil
		].
	^unContrato notNil.
]

{ #category : #verifying }
Cliente >> tieneDni: unDni [
	^(dni = unDni).
]

{ #category : #printing }
Cliente >> toString [
	"Usado para debug"
	|cadena contratos|.
	contratos := self toStringContratos.
	cadena := '----- Apellido: ',apellido,', DNI: ',dni asString,', Contacto: ',datosContacto,String cr,
	'Contratos: ',String cr,contratos,
	'	Frecuente: ',self esFrecuenteString,
	', Millas: ',millas asString,
	', Dinero: $',(dinero printShowingDecimalPlaces: 2),String cr.
	^cadena.
]

{ #category : #printing }
Cliente >> toStringContratos [
	|cadena|.
	cadena := ''.
	colContratos do: [:cadaContrato| 
			cadena := cadena,cadaContrato toString,String cr.
		].
	(cadena = '') ifTrue: [  
			cadena := 'Sin contratos',String cr.
		].
	^cadena.
]

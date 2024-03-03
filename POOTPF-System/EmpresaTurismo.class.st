"
Instance Variables
colClientes:		<OrderedCollection>
colViajes:		<OrderedCollection>
"
Class {
	#name : #EmpresaTurismo,
	#superclass : #Object,
	#instVars : [
		'colClientes',
		'colViajes'
	],
	#category : #'POOTPF-System'
}

{ #category : #constructor }
EmpresaTurismo class >> crear [
	"Constructor de EmpresaTurismo"
	|unaEmpresa|.
	unaEmpresa := self new.
	unaEmpresa inicializar.
	^unaEmpresa.
]

{ #category : #updating }
EmpresaTurismo >> agregarExcursionAContrato: unDni numeroContrato: unNum excursionOpcional: unaExc [
	"Agrega unaExc a colExcursiones del Contrato con unNum del cliente con unDni si fuera posible"
	|unCliente exito|.
	unCliente := self buscarClienteConDni: unDni.
	exito := unCliente notNil.
	(exito) ifTrue: [  
			exito := unCliente agregarExcursionAContratoConNumero: unNum excursionOpcional: unaExc.
		].
	^exito.
]

{ #category : #updating }
EmpresaTurismo >> bajarContrato: unDni numeroContrato: unNum [
	"Da de baja un contrato con unNum del cliente con unDni y realiza reembolsos correspondientes si fuese el caso"
	|unCliente exito|.
	unCliente := self buscarClienteConDni: unDni.
	exito := unCliente notNil.
	(exito) ifTrue: [  
			exito := unCliente bajarContratoConNumero: unNum.
		].
	^exito.
]

{ #category : #updating }
EmpresaTurismo >> bajarContratosConViaje: unNombre [
	"Baja contratos con viaje que tenga unNombre, retorna verdadero si se bajo algun Contrato"
	|bajado exito|.
	bajado := false.
	exito := false.
	colClientes do: [:cadaCliente|
			exito := cadaCliente bajarContratosConViaje: unNombre.
			(exito) ifTrue: [  
				bajado := true.
				].
		].
	^bajado.
]

{ #category : #updating }
EmpresaTurismo >> bajarViajeConNombre: unNombre [
	"Da de baja un viaje con unNombre si es posible"
	|unViaje exito|.
	unViaje := self buscarViajeConNombre: unNombre.
	exito := unViaje notNil.
	(exito) ifTrue: [  
			self bajarContratosConViaje: unNombre.
			colViajes remove: unViaje.
		].
	^exito.
]

{ #category : #searching }
EmpresaTurismo >> buscarClienteConDni: unDni [
	"Busca Cliente en colClientes que tenga unDni y lo retorna, en caso contrario, retorna nil"
	|unCliente|.
	unCliente := colClientes detect: [:cadaCliente|
			cadaCliente tieneDni: unDni.
		] ifNone: [
			unCliente := nil. 
		].
	^unCliente.
]

{ #category : #searching }
EmpresaTurismo >> buscarViajeConNombre: unNombre [
	"Busca y retorna un viaje en colViajes con unNombre, en caso contrario, retorna nil"
	|unViaje|.
	unViaje := colViajes detect: [:cadaViaje| 
			cadaViaje tieneNombre: unNombre. 
		] ifNone: [ 
			 unViaje := nil.
		].
	^unViaje.
	
]

{ #category : #accessing }
EmpresaTurismo >> colClientes [
	^colClientes.
]

{ #category : #accessing }
EmpresaTurismo >> colClientes: unaCol [
	colClientes := unaCol.
]

{ #category : #accessing }
EmpresaTurismo >> colViajes [
	^colViajes.
]

{ #category : #accessing }
EmpresaTurismo >> colViajes: unaCol [
	colViajes := unaCol.
]

{ #category : #updating }
EmpresaTurismo >> efectivizarContrato: unDni numeroContrato: unNum [
	"Realiza la efectivizacion de un contrato con unNum del cliente con unDni"
	|unCliente exito|.
	unCliente := self buscarClienteConDni: unDni.
	exito := unCliente notNil.
	(exito) ifTrue: [  
		exito := unCliente efectivizarContratoConNumero: unNum.
		].
	^exito.
]

{ #category : #adding }
EmpresaTurismo >> generarContrato: unDni numContrato: unNum nombreViaje: unNombre fechaSeleccionada: unaFecha cantPersonas: cantP cantCuotas: cantC esFlexible: esFlex [
	"Genera un contrato y lo agrega a colContratos del cliente con unDni, si se cumplen todas las condiciones"
	|unCliente unViaje unaFechaSalida exito|.
	unCliente := self buscarClienteConDni: unDni.
	exito := unCliente notNil.
	(exito) ifTrue: [  
			unViaje := self buscarViajeConNombre: unNombre.
			exito := unViaje notNil.
			(exito) ifTrue: [  
				unaFechaSalida := unViaje buscarFechaSalidaConCupo: unaFecha cantPersonas: cantP.
				exito := unaFechaSalida notNil.
				(exito) ifTrue: [  
						unCliente generarContrato: unNum viaje: unViaje fechaSalida: unaFechaSalida cantPasajeros: cantP cantCuotas: cantC esFlexible: esFlex. 
					].
				].
		].
	^exito.
]

{ #category : #updating }
EmpresaTurismo >> generarViajeEspecial: unNombre costoPorPersona: costP valorImpuestos: unImpuesto ciudad: unaCiudad fechaSalida: unaFechaSalida fechaRegreso: unaFechaRegreso [
	"Genera un ViajeEspecial y lo agrega a colViajes si es posible"
	|unViaje exito|.
	unViaje := self buscarViajeConNombre: unNombre.
	exito := unViaje isNil.
	(exito) ifTrue: [  
			unViaje := ViajeEspecial crear: unNombre costoPorPersona: costP valorImpuestos: unImpuesto ciudad: unaCiudad fechaSalida: unaFechaSalida fechaRegreso: unaFechaRegreso.
			colViajes add: unViaje.
		].
	^exito.
]

{ #category : #updating }
EmpresaTurismo >> generarViajeOrganizado: unNombre costoPorPersona: costP valorImpuestos: unImpuesto fechasSalida: unasFechasSalida cantDias: unaCant etapas: unasEtapas [
	"Genera un ViajeOrganizado y lo agrega a colViajes si es posible"
	|unViaje exito|.
	unViaje := self buscarViajeConNombre: unNombre.
	exito := unViaje isNil.
	(exito) ifTrue: [  
			unViaje := ViajeOrganizado crear: unNombre costoPorPersona: costP valorImpuestos: unImpuesto cantDias: unaCant colFechasSalida: unasFechasSalida colEtapas: unasEtapas.
			colViajes add: unViaje.
		].
	^exito.
]

{ #category : #initialization }
EmpresaTurismo >> inicializar [
	"Inicializa EmpresaTurismo, con ambas colecciones vacias"
	colClientes := OrderedCollection new.
	colViajes := OrderedCollection new.
]

{ #category : #printing }
EmpresaTurismo >> inicioDelDia [
	|textoRetorno textoClientes|.
	textoRetorno := 'Clientes con contratos a vencer: ',String cr.
	textoClientes := ''.
	colClientes do: [:cadaCliente|
			 (cadaCliente tieneContratoPorVencer) ifTrue: [  
					textoClientes := textoClientes,cadaCliente toString,String cr.
				].
		].
	(textoClientes = '') ifTrue:[
			textoRetorno := 'No se encontraron clientes con contratos por vencer'.
		] ifFalse: [
			textoRetorno := textoRetorno,textoClientes.
		].
	^textoRetorno.
]

{ #category : #updating }
EmpresaTurismo >> modificarContrato: unDni numeroContrato: unNum fechaSeleccionada: unaFecha [
	"Modifica datos del contrato si fuera posible. En este caso solo actualiza fechaSeleccionada"
	|unCliente exito|.
	unCliente := self buscarClienteConDni: unDni.
	exito := unCliente notNil.
	(exito) ifTrue: [  
			exito := unCliente modificarContratoConNumero: unNum fechaSeleccionada: unaFecha.
		].
	^exito.
]

{ #category : #updating }
EmpresaTurismo >> modificarViaje: unNombre costoPorPersona: unCostoP valorImpuestos: unImpuesto [
	"Modifica Viaje con unNombre si es posible, cambia su costoPorPersona y valorImpuestos"
	|unViaje exito|.
	unViaje := self buscarViajeConNombre: unNombre.
	exito := unViaje notNil.
	(exito) ifTrue: [  
			unViaje modificarCosto: unCostoP valorImpuestos: unImpuesto.
		].
	^exito.
]

{ #category : #updating }
EmpresaTurismo >> pagarCuotasContrato: unDni numContrato: unNum cuotasAPagar: cantC [
	"Realiza el pago de cantC cuotas de un contrato con unNum del cliente con uDni"
	|unCliente exito|.
	unCliente := self buscarClienteConDni: unDni.
	exito := unCliente notNil.
	(exito) ifTrue: [  
			exito := unCliente pagarCuotas: unNum cuotasAPagar: cantC.
		].
	^exito.
]

{ #category : #printing }
EmpresaTurismo >> toString [
	"Imprime todos los viajes y clientes de la EmpresaTurismo"
	|unaCadena|.
	unaCadena := self toStringViajes.
	unaCadena := unaCadena,String cr, self toStringClientes.
	^unaCadena.
]

{ #category : #printing }
EmpresaTurismo >> toStringCliente: unDni [
	"Retorna una cadena con los datos del cliente con unDni si es encontrado"
	|unCliente cadena|.
	unCliente := self buscarClienteConDni: unDni.
	(unCliente notNil) ifTrue: [  
			cadena := unCliente toString.
		] ifFalse: [
			cadena := 'No se encuentra cliente con DNI ',unDni,String cr.
		].
	^cadena.
]

{ #category : #printing }
EmpresaTurismo >> toStringClientes [
	"Genera cadena con todos los clientes"
	|unaCadena|.
	unaCadena := ''.
	colClientes do: [:cadaCliente|
		unaCadena := unaCadena,(cadaCliente toString),String cr.
		].
	(unaCadena = '') ifTrue: [  
		unaCadena := 'Sin clientes',String cr.
	] ifFalse: [
		unaCadena := '--- Clientes ---',String cr,unaCadena.
	].
	^unaCadena.
]

{ #category : #printing }
EmpresaTurismo >> toStringViaje: unNombre [
	"Retorna una cadena con los datos del viaje con unNombre si es encontrado"
	|unViaje cadena|.
	unViaje := self buscarViajeConNombre: unNombre.
	(unViaje notNil) ifTrue: [  
			cadena := unViaje toString.
		] ifFalse: [
			cadena := 'No se encuentra viaje con nombre ',unNombre,String cr.
		].
	^cadena.
]

{ #category : #printing }
EmpresaTurismo >> toStringViajes [
	"Genera cadena con todos los viajes"
	|unaCadena|.
	unaCadena := ''.
	colViajes do: [:cadaViaje|
		unaCadena := unaCadena,cadaViaje toString,String cr.
		].
	(unaCadena = '') ifTrue: [  
		unaCadena := 'Sin viajes',String cr.
	] ifFalse: [
		unaCadena := '--- Viajes ---',String cr,unaCadena.
	].
	^unaCadena.
]

{ #category : #printing }
EmpresaTurismo >> verInfoViajes: f1 hasta: f2 [
	"Retorna un String con informacion sobre todos los viajes disponibles con fechas en el intervalo [f1, f2]"
	|retorno info|.
	info := ''.
	colViajes do: [:cadaViaje|
			(cadaViaje verificarSalidaRango: f1 hasta: f2) ifTrue: [  
					info := info , cadaViaje toString, String cr.
				].
		].
	(info = '') ifTrue: [  
			retorno := 'Sin viajes disponibles entre ',f1 ddmmyyyy,' y ',f2 ddmmyyyy, '.',String cr.
		] ifFalse: [
			retorno := 'Viajes disponibles entre ',f1 ddmmyyyy,' y ',f2 ddmmyyyy,':',String cr,info.
		].
	^retorno.
]

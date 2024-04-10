"
Clase para realizar test de EmpresaTurismo
"
Class {
	#name : #TestEmpresa,
	#superclass : #Object,
	#category : #'POOTPF-System-Testing'
}

{ #category : #testing }
TestEmpresa class >> cargaInicial: unaEmpresaTurismo [
	"Realiza carga de datos viajes y clientes a unaEmpresaTurismo"
	|colClientes colViajes|.
	colViajes := self crearColViajes.
	colClientes := self crearColClientes: colViajes.
	unaEmpresaTurismo colViajes: colViajes.
	unaEmpresaTurismo colClientes: colClientes.
]

{ #category : #testing }
TestEmpresa class >> crearColClientes: colViajes [
	"Crea y retorna una coleccion de clientes, con los viajes de colViajes, de manera que queden enlazados a la mismas instancias de la empresa"
	|colClientes unCliente unContrato unViaje|.
	colClientes := OrderedCollection new.
	
	"Creo cliente"
	unCliente := Cliente crear: "32391392"1 apellido: 'Casillas' ciudad: 'San Martin De los Andes' datosContacto: '299120201, casillas@gmail.com' preferencias: 'Ninguna'.
	unCliente dinero: 50000.
	"Creo contrato para cliente"
	unViaje := colViajes detect: [:viaje| viaje nombre = 'Bahia Blanca'].
	unContrato := Contrato crear: 1 viaje: unViaje cantPersonas: 2 cantCuotas: 3 fechaSeleccionada: (Date year: 2024 month: 9 day: 29).
	unContrato fechaContrato: (Date year: 2023 month: 07 day: 30).
	unContrato fechaProxVencimiento: (Date year: 2024 month: 09 day: 04).
	"Agrego nuevo contrato"
	unCliente addContrato: unContrato.
	"Creo contrato para cliente"
	unViaje := colViajes detect: [:viaje| viaje nombre = 'Bolivia'].
	unContrato := Contrato crear: 7 viaje: unViaje cantPersonas: 5 cantCuotas: 10 fechaSeleccionada: (Date year: 2024 month: 7 day: 31).
	unContrato fechaContrato: (Date year: 2023 month: 7 day: 10).
	unContrato fechaProxVencimiento: (Date year: 2023 month: 08 day: 19).
	"Agrego cliente creado"
	colClientes add: unCliente.
	unCliente addContrato: unContrato.
	
	"Creo cliente"
	unCliente := Cliente crear: "43021021"2 apellido: 'Benitez' ciudad: 'Neuquen' datosContacto: '299401300, benitez@gmail.com' preferencias: 'Ninguna'.
	unCliente dinero: 100000.
	"Creo contrato para cliente"
	unViaje := colViajes detect: [:viaje| viaje nombre = 'Bolivia'].
	unContrato := Contrato crear: 2 viaje: unViaje cantPersonas: 5 cantCuotas: 1 fechaSeleccionada: ((Date year: 2024 month: 1 day: 24)).
	unContrato fechaContrato: (Date year: 2023 month: 07 day: 20).
	unContrato fechaProxVencimiento: (Date year: 2023 month: 08 day: 19).
	"Agrego nuevo contrato"
	unCliente addContrato: unContrato.
	"Creo contrato para cliente"
	unViaje := colViajes detect: [:viaje| viaje nombre = 'Alemania'].
	unContrato := ContratoFlexible crear: 8 viaje: unViaje cantPersonas: 2 cantCuotas: 3 fechaSeleccionada: (Date year: 2023 month: 12 day: 20).
	unContrato fechaContrato: (Date year: 2023 month: 2 day: 1).
	unContrato fechaProxVencimiento: (Date year: 2023 month: 3 day: 22).
	unContrato colReservas: ({ReservaExcursion crear: (unViaje getExcursionOpcional: 'Visita a las tres pinacotecas') cantPersonas: 2} asOrderedCollection).
	"Agrego nuevo contrato"
	unCliente addContrato: unContrato.
	"Agrego cliente creado"
	colClientes add: unCliente.
	
	"Creo cliente"
	unCliente := Cliente crear: "43910202"3 apellido: 'Zuñiga' ciudad: 'Cinco Saltos' datosContacto: '299319292' preferencias: 'Ninguna'.
	unCliente dinero: 1299122.
	"Creo contrato para cliente"
	unViaje := colViajes detect: [:viaje| viaje nombre = 'Bahia Blanca'].
	unContrato := Contrato crear: 3 viaje: unViaje cantPersonas: 2 cantCuotas: 3 fechaSeleccionada: (Date year: 2024 month: 9 day: 29).
	unContrato fechaContrato: (Date year: 2023 month: 07 day: 29).
	unContrato fechaProxVencimiento: (Date year: 2023 month: 9 day: 3).
	"Agrego nuevo contrato"
	unCliente addContrato: unContrato.
	"Agrego cliente creado"
	colClientes add: unCliente.
	
	"Creo cliente"
	unCliente := Cliente crear: "2319292"4 apellido: 'Boretto' ciudad: 'Plottier' datosContacto: '29964128' preferencias: 'Ninguna'.
	unCliente dinero: 10000.
	"Creo contrato para cliente"
	unViaje := colViajes detect: [:viaje| viaje nombre = 'Corea del Norte'].
	unContrato := Contrato crear: 4 viaje: unViaje cantPersonas: 10 cantCuotas: 6 fechaSeleccionada: (Date year: 2024 month: 3 day: 12).
	unContrato fechaContrato: (Date year: 2023 month: 6 day: 6).
	unContrato fechaProxVencimiento: (Date year: 2023 month: 8 day: 4).
	unContrato cantCuotasPagadas: 1.
	"Agrego nuevo contrato"
	unCliente addContrato: unContrato.
	"Agrego cliente creado"
	colClientes add: unCliente.
	
	"Creo cliente"
	unCliente := Cliente crear: "42919292"5 apellido: 'Garcia' ciudad: 'Las Grutas' datosContacto: 'garcia@gmail.com' preferencias: 'Ninguna'.
	unCliente dinero: 100200.
	unCliente esFrecuente: true.
	"Creo contrato para cliente"
	unViaje := colViajes detect: [:viaje| viaje nombre = 'Bolivia'].
	unContrato := Contrato crear: 5 viaje: unViaje cantPersonas: 5 cantCuotas: 1 fechaSeleccionada: (Date year: 2024 month: 3 day: 15).
	unContrato fechaContrato: (Date year: 2023 month: 7 day: 31).
	unContrato fechaProxVencimiento: (Date year: 2023 month: 8 day: 30).

	"Agrego nuevo contrato"
	unCliente addContrato: unContrato.
	"Agrego cliente creado"
	colClientes add: unCliente.
	
	"Creo cliente"
	unCliente := Cliente crear: "3922098"6 apellido: 'Solorza' ciudad: 'Villa Regina' datosContacto: '2994939' preferencias: 'Ninguna'.
	unCliente dinero: 10500.
	unCliente esFrecuente: true.
	"Creo contrato para cliente"
	unViaje := colViajes detect: [:viaje| viaje nombre = 'Alemania'].
	unContrato := ContratoFlexible crear: 6 viaje: unViaje cantPersonas: 10 cantCuotas: 4 fechaSeleccionada: (Date year: 2024 month: 3 day: 12).
	unContrato fechaContrato: (Date year: 2023 month: 7 day: 23).
	unContrato fechaProxVencimiento: (Date year: 2023 month: 8 day: 22).
	unContrato colReservas: ({ReservaExcursion crear: (unViaje getExcursionOpcional: 'Visita a las tres pinacotecas') cantPersonas: 2} asOrderedCollection).
	"Agrego nuevo contrato"
	unCliente addContrato: unContrato.
	"Agrego cliente creado"
	colClientes add: unCliente.
	
	^colClientes.
]

{ #category : #testing }
TestEmpresa class >> crearColViajes [
	"Crea y retorna una coleccion de viajes"
	|colViajes colFechasSalida colEtapas|.
	colViajes := OrderedCollection new.
	
	colViajes add: (ViajeEspecial crear: 'Viaje de compras' costoPorPersona: 10000 valorImpuestos: 2500 ciudad: 'Buenos Aires' fechaSalida: (FechaSalida crear: (Date year: 2024 month: 8 day: 5) cupo: 20) fechaRegreso: (Date year: 2024 month: 08 day: 08)).
	
	colViajes add: (ViajeEspecial crear: 'Bahia Blanca' costoPorPersona: 9000 valorImpuestos: 1900 ciudad: 'Buenos Aires' fechaSalida: (FechaSalida crear: (Date year: 2024 month: 9 day: 29) cupo: 15) fechaRegreso: (Date year: 2024 month: 10 day: 14)).

	colViajes add: (ViajeEspecial crear: 'Corea del Norte' costoPorPersona: 12220 valorImpuestos: 2300 ciudad: 'Corea del Norte' fechaSalida: (FechaSalida crear: (Date year: 2024 month: 3 day: 12) cupo: 34) fechaRegreso: (Date year: 2024 month: 4 day: 01)).

	colFechasSalida := { (FechaSalida crear: (Date year: 2024 month: 8 day: 15) cupo: 22). (FechaSalida crear: (Date year: 2024 month: 4 day: 20) cupo: 20). (FechaSalida crear: (Date year: 2024 month: 2 day: 2) cupo: 29). (FechaSalida crear: (Date year: 2024 month: 10 day: 12) cupo: 11)} asOrderedCollection.
	colEtapas := {Etapa crear: 1 diaLlegada: 'día 1 - Estambul' nombreHotel: 'Hotel Grand Plaza' tipoPension: 'Alojamiento y desayuno' colExcursiones: ({Excursion crear: 'Visita a la basílica de Santa Sofía'. Excursion crear: 'Visita al Palacio de Topkapi'} asOrderedCollection). 
	Etapa crear: 1 diaLlegada: 'dia 2 - Santorini' nombreHotel: 'Ocean View Resort' tipoPension: 'Completa' colExcursiones: ({Excursion crear: 'Recorrido de la isla'} asOrderedCollection). 
	Etapa crear: 1 diaLlegada: 'dia 3 - Atenas' nombreHotel: 'Sunset Paradise Inn' tipoPension: 'Completa' colExcursiones: ({Excursion crear: 'Visita al Museo de la Acrópolis'} asOrderedCollection)} asOrderedCollection.
	colViajes add: (ViajeOrganizado crear: 'Turquia y Grecia' costoPorPersona: 12000 valorImpuestos: 5000 cantDias: 3 colFechasSalida: colFechasSalida colEtapas: colEtapas colExcursionesOpcionales: ({ExcursionOpcional crear:'Viaje en ' costoPorPersona: 200} asOrderedCollection)).
	
	colFechasSalida := { (FechaSalida crear: (Date year: 2024 month: 3 day: 15) cupo: 40). (FechaSalida crear: (Date year: 2024 month: 1 day: 24) cupo: 34). (FechaSalida crear: (Date year: 2024 month: 7 day: 31) cupo: 10)} asOrderedCollection.
	colEtapas := {Etapa crear: 1 diaLlegada: 'día 1' nombreHotel: 'Hotel Sarmiento' tipoPension: 'Alojamiento y desayuno' colExcursiones: ({Excursion crear: 'Visita a Casa de Gobierno'. Excursion crear: 'Visita al museo'. Excursion crear: 'Paseo por la ciudad'} asOrderedCollection). 
	Etapa crear: 1 diaLlegada: 'dia 2' nombreHotel: 'Hotel Pequeña Plaza' tipoPension: 'Media' colExcursiones: ({Excursion crear: 'Expedicion en la jungla'} asOrderedCollection). 
	Etapa crear: 1 diaLlegada: 'dia 3' nombreHotel: 'Hotel Paraiso' tipoPension: 'Completa' colExcursiones: ({Excursion crear: 'Paseo en canoa'} asOrderedCollection)} asOrderedCollection.
	colViajes add: (ViajeOrganizado crear: 'Bolivia' costoPorPersona: 7000 valorImpuestos: 1300 cantDias: 3 colFechasSalida: colFechasSalida colEtapas: colEtapas colExcursionesOpcionales: ({ExcursionOpcional crear: 'Viaje en barco' costoPorPersona: 400. ExcursionOpcional crear: 'Partido de golf' costoPorPersona: 500.} asOrderedCollection)).

	colFechasSalida := { (FechaSalida crear: (Date year: 2024 month: 3 day: 12) cupo: 10). (FechaSalida crear: (Date year: 2023 month: 12 day: 20) cupo: 10). (FechaSalida crear: (Date year: 2024 month: 5 day: 5) cupo: 10)} asOrderedCollection.
	colEtapas := {Etapa crear: 1 diaLlegada: 'día 1 - Berlin' nombreHotel: 'Hotel Grand Plaza' tipoPension: 'Media' colExcursiones: ({Excursion crear: 'Viaje en bus turístico'.} asOrderedCollection).
	Etapa crear: 1 diaLlegada: 'dia 2 - Munich' nombreHotel: 'Ocean View Resort' tipoPension: 'Alojamiento y desayuno' colExcursiones: ({Excursion crear: 'Recorrido del Palacio de Nymphenburg'. Excursion crear: 'Visita al Jardín Inglés'} asOrderedCollection). 
	Etapa crear: 1 diaLlegada: 'dia 3 - Hamburgo' nombreHotel: 'Sunset Paradise Inn' tipoPension: 'Completa' colExcursiones: ({Excursion crear: 'Visita a Iglesia de San Miguel'} asOrderedCollection)} asOrderedCollection.
	colViajes add: (ViajeOrganizado crear: 'Alemania' costoPorPersona: 1100 valorImpuestos: 300 cantDias: 3 colFechasSalida: colFechasSalida colEtapas: colEtapas colExcursionesOpcionales: ({ExcursionOpcional crear: 'Visita a las tres pinacotecas' costoPorPersona: 600} asOrderedCollection)).

	^colViajes.

]

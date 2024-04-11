"
Desarrollo del TP Obligatorio Final de la materia Programacion Orientada a Objetos.
En este package se encuentra toda clase referida al Sistema del trabajo.

El trabajo se ejecuta con el metodo 'ejecutar' de la clase Faibondi.
('Faibondi ejecutar' en el playground).

Estudiantes:
Benitez, Franco Fabian	FAI-3169		fabian.benitez@est.fi.uncoma.edu.ar
Zuñiga, Jamiro Tomas 		FAI-3429		jamiro.zuniga@est.fi.uncoma.edu.ar
"
Class {
	#name : #ManifestPOOTPFSystem,
	#superclass : #PackageManifest,
	#category : #'POOTPF-System-Manifest'
}

{ #category : #'code-critics' }
ManifestPOOTPFSystem class >> ruleAssignmentInIfTrueRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Cliente #generarContrato:viaje:fechaSalida:cantPasajeros:cantCuotas:esFlexible: #false)) #'2024-04-08T19:59:23.807-03:00') #(#(#RGMethodDefinition #(#Contrato #calcularReembolso: #false)) #'2024-04-09T22:00:47.52-03:00') )
]

{ #category : #'code-critics' }
ManifestPOOTPFSystem class >> ruleCollectionProtocolRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#EmpresaTurismo #getColContratos #false)) #'2024-03-08T07:23:42.632-03:00') #(#(#RGMethodDefinition #(#Cliente #bajarContratosConViaje: #false)) #'2024-04-11T00:49:44.916-03:00') )
]

{ #category : #'code-critics' }
ManifestPOOTPFSystem class >> ruleExcessiveArgumentsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Cliente #inicializarDni:apellido:ciudad:datosContacto:preferencias: #false)) #'2024-03-06T04:02:19.91-03:00') #(#(#RGMethodDefinition #(#EmpresaTurismo #generarViajeOrganizado:costoPorPersona:valorImpuestos:fechasSalida:cantDias:etapas:excursionesOpcionales: #false)) #'2024-04-10T00:45:15.882-03:00') #(#(#RGMethodDefinition #(#'ViajeOrganizado class' #crear:costoPorPersona:valorImpuestos:cantDias:colFechasSalida:colEtapas:colExcursionesOpcionales: #true)) #'2024-04-10T00:46:50.732-03:00') )
]

{ #category : #'code-critics' }
ManifestPOOTPFSystem class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'TestEmpresa class' #crearColClientes: #true)) #'2024-03-06T04:02:15.238-03:00') )
]

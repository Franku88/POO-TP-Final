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
ManifestPOOTPFSystem class >> ruleExcessiveArgumentsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Cliente #inicializarDni:apellido:ciudad:datosContacto:preferencias: #false)) #'2024-03-06T04:02:19.91-03:00') )
]

{ #category : #'code-critics' }
ManifestPOOTPFSystem class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'TestEmpresa class' #crearColClientes: #true)) #'2024-03-06T04:02:15.238-03:00') )
]

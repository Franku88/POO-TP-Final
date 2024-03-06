"
Desarrollo del TP Obligatorio Final de la materia Programacion Orientada a Objetos.
En este package se encuentra toda clase referida a la UI del trabajo.

El trabajo se ejecuta con el metodo 'ejecutar' de la clase Faibondi.
('Faibondi ejecutar' en el playground).

Estudiantes:
Benitez, Franco Fabian	FAI-3169		fabian.benitez@est.fi.uncoma.edu.ar
Zuñiga, Jamiro Tomas 		FAI-3429		jamiro.zuniga@est.fi.uncoma.edu.ar
"
Class {
	#name : #ManifestPOOTPFUI,
	#superclass : #PackageManifest,
	#category : #'POOTPF-UI-Manifest'
}

{ #category : #'code-critics' }
ManifestPOOTPFUI class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#VerContratos #contratoToString: #false)) #'2024-03-06T03:53:14.484-03:00') )
]

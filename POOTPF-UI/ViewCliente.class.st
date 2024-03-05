"
Ventanas que mostraran datos de un cliente.
Instance Variables
cliente:		<Cliente>
"
Class {
	#name : #ViewCliente,
	#superclass : #Ventana,
	#instVars : [
		'cliente'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #strings }
ViewCliente >> clienteToStringPerfil [
	^self clienteToStringPerfil: cliente
]

{ #category : #strings }
ViewCliente >> clienteToStringPerfil: unCliente [
	"Convierte a unCliente en una cadena para posicionar dentro del contenedor de perfil"
	|string rta|.	
	string := 'DNI: ',String cr,'        ', (unCliente dni asString), String cr.
	string := string, 'Apellido: ',String cr,'        ', (unCliente apellido asString), String cr.
	string := string, 'Ciudad: ',String cr,'        ', (unCliente ciudad asString), String cr.
	string := string, 'Contacto: ',String cr,'        ', (unCliente datosContacto asString), String cr.
	"rta segun boolean esFrecuente"
	rta := 'No'.
	(cliente esFrecuente) ifTrue: [rta := 'Si'.].
	string := string, 'Frecuente: ',String cr,'        ',rta, String cr.
	string := string, 'Millas: ',String cr,'        ', (unCliente millas asString), String cr.
	string := string, 'Dinero: ',String cr,'         $', (unCliente dinero asString), String cr.
	string := string, 'Preferencias: ',String cr,'        ', (unCliente preferencias asString).
	^string.
]

{ #category : #initialization }
ViewCliente >> initializeWithSystem: unSistema cliente: unCliente [
	self initialize.
	"Inicializo sistema y ususario ingresado"
	self initializeWithSystem: unSistema.
	cliente := unCliente.
	"Las ViewCliente son dependientes del Cliente encontrado"
	cliente addDependent: self.
]

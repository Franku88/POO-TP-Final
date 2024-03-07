"
Ventanas que mostraran datos de un cliente.

Instance Variables
cliente:		<Cliente>
headerCliente: 	<ScrolledText>
"
Class {
	#name : #ViewCliente,
	#superclass : #Ventana,
	#instVars : [
		'cliente',
		'headerCliente'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
ViewCliente class >> createWithSystem: unSistema cliente: unCliente [
	|clienteW|.
	clienteW := self new.
	clienteW initializeWithSystem: unSistema cliente: unCliente.
 	^clienteW.
]

{ #category : #adding }
ViewCliente >> addHeaderCliente [
	headerCliente := ScrolledText createExtent: 150@90 color: (tema container) title: 'Cliente'.
	headerCliente beReadOnly.
	headerCliente center: header center.
	headerCliente left: header left + 150.
	headerCliente setText: ('  DNI: ',(cliente dni asString),String cr,'  Apellido: ',cliente apellido,String cr,'  Dinero: $',((cliente dinero) asFloat truncateTo: 0.01) asString).
	header addMorph: headerCliente.
]

{ #category : #strings }
ViewCliente >> clienteToStringPerfil [
	^self clienteToStringPerfil: cliente
]

{ #category : #strings }
ViewCliente >> clienteToStringPerfil: unCliente [
	"Convierte a unCliente en una cadena para posicionar dentro del contenedor de perfil"
	|string rta|.	
	string := '    DNI: ',String cr,'            ', (unCliente dni asString), String cr.
	string := string, '    Apellido: ',String cr,'            ', (unCliente apellido asString), String cr.
	string := string, '    Ciudad: ',String cr,'            ', (unCliente ciudad asString), String cr.
	string := string, '    Contacto: ',String cr,'            ', (unCliente datosContacto asString), String cr.
	"rta segun boolean esFrecuente"
	rta := 'No'.
	(cliente esFrecuente) ifTrue: [rta := 'Si'.].
	string := string, '    Frecuente: ',String cr,'            ',rta, String cr.
	string := string, '    Millas: ',String cr,'            ', (unCliente millas asString), String cr.
	string := string, '    Dinero: ',String cr,'             $', (unCliente dinero asString), String cr.
	string := string, '    Preferencias: ',String cr,'            ', (unCliente preferencias asString).
	^string.
]

{ #category : #initialization }
ViewCliente >> initializeWithSystem: unSistema cliente: unCliente [
	"Inicializo sistema y usuario ingresado"
	self initialize.
	self initializeWithSystem: unSistema.
	cliente := unCliente.
	"Todas las ViewCliente mostraran al Cliente actual en el header"
	self addHeaderCliente.
	"Las ViewCliente son dependientes del Cliente encontrado"
	cliente addDependent: self.
]

{ #category : #updating }
ViewCliente >> update: anObject [
	headerCliente setText: '  DNI: ',(cliente dni asString),String cr,'  Apellido: ',cliente apellido,String cr,'  Dinero: $',((cliente dinero)asFloat truncateTo: 0.01) asString.
]

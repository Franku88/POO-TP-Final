"
Ventanas que mostraran/usaran datos de un cliente.

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

{ #category : #initialization }
ViewCliente >> initializeWithSystem: unSistema cliente: unCliente [
	"Inicializo sistema y usuario ingresado"
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

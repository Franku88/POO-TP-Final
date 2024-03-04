"
Vista que muestra datos de un cliente
	cliente:		<Cliente>
"
Class {
	#name : #PerfilCliente,
	#superclass : #Ventana,
	#instVars : [
		'cliente',
		'botonVerContratos',
		'botonIngresarDinero'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
PerfilCliente class >> createWithSystem: unSistema cliente: unCliente [
	|perfilW|.
	perfilW := self new.
	perfilW initializeWithSystem: unSistema cliente: unCliente.
 	^perfilW.
]

{ #category : #adding }
PerfilCliente >> addButtons [

]

{ #category : #strings }
PerfilCliente >> clienteToStringPerfil [
	"Convierte a cliente en una cadena para posicionar dentro del contenedor de perfil"
	|string rta|.	
	string := 'DNI: ',String cr,'   ', (cliente dni asString), String cr.
	string := string, 'Apellido: ',String cr,'   ', (cliente apellido asString), String cr.
	string := string, 'Ciudad: ',String cr,'   ', (cliente ciudad asString), String cr.
	string := string, 'Contacto: ',String cr,'   ', (cliente datosContacto asString), String cr.
	"rta segun boolean esFrecuente"
	rta := 'No'.
	(cliente esFrecuente) ifTrue: [rta := 'Si'.].
	string := string, 'Frecuente: ',String cr,'   ',rta, String cr.
	string := string, 'Millas: ',String cr,'   ', (cliente millas asString), String cr.
	string := string, 'Dinero: ',String cr,'   ', (cliente dinero asString), String cr.
	string := string, 'Preferencias: ',String cr,'   ', (cliente preferencias asString).
	^string.
	
]

{ #category : #initialization }
PerfilCliente >> initializeWithSystem: unSistema cliente: unCliente [
	|datosCliente|.
	self initialize.
	"Inicializo sistema y ususario encontrado"
	sistema := unSistema.
	cliente := unCliente.
	"Agrego boton para salir del perfil"
	self addBotonAtras: 'Salir'.
	"Agrego contenedor"
	self addContenedor: 280@400.
	contenedor left: body left + 40.
	"Agrego datos del cliente al contenedor"
	datosCliente := (self clienteToStringPerfil) asTextMorph.
	contenedor addMorphCentered: datosCliente.
	datosCliente top: contenedor top + 20.
	datosCliente left: contenedor left + 20.
	"Agrego titulo sobre contenedor"
	self addTitulo: 'Cliente'.
	titulo center: contenedor center.
	titulo bottom: contenedor top - 10.
	"Agrego botones"
	self addButtons.
	
]

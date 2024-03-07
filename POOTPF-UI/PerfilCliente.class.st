"
Vista que muestra datos de un cliente.
Instance Variables
	botonVerContratos: 	<Button>
	botonIngresarDinero: 	<Button>
	datosCliente: 		<ScrolledText>
	
"
Class {
	#name : #PerfilCliente,
	#superclass : #ViewCliente,
	#instVars : [
		'botonVerContratos',
		'botonIngresarDinero',
		'datosCliente'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #creating }
PerfilCliente class >> createWithSystem: unSistema cliente: unCliente [
	|clienteW|.
	clienteW := self new.
	clienteW initializeWithSystem: unSistema cliente: unCliente.
 	^clienteW.
]

{ #category : #adding }
PerfilCliente >> addButtons [
	"Crea botones"
	botonVerContratos := Button label: 'Ver contratos' extent: 160@30.
	botonIngresarDinero := Button label: 'Ingresar dinero' extent: 160@30.
	"Posiciona"
	botonVerContratos center: (body center)*(1.5).
	botonVerContratos top: body top + 150.
	botonIngresarDinero center: (body center)*(1.5).
	botonIngresarDinero bottom: body bottom - 150.
	"Da funcion"
	botonVerContratos mouseAction: [
		self addMorphCentered: (VerContratos createWithSystem: sistema cliente: cliente).
		].
	botonIngresarDinero mouseAction: [
		self addMessageIngresarDinero.
	].
	"Agrega"
	body addMorph: botonVerContratos.
	body addMorph: botonIngresarDinero.
]

{ #category : #adding }
PerfilCliente >> addDatosCliente [
	"Agrega datos centrados al contenedor"
	datosCliente := ScrolledText createExtent: 280@350 color: (tema container) title: 'Datos Personales'.
	datosCliente beReadOnly.
	datosCliente setText: (self clienteToStringPerfil: cliente).
	datosCliente center: body center; left: body left + 80.
	body addMorph: datosCliente.

]

{ #category : #adding }
PerfilCliente >> addMessageIngresarDinero [
	"Accion del boton ingresarDinero"
	self addMessageInput: '¿Cuanto dinero desea ingresar?' actionAceptar: [ :fInput :popUp|
		(fInput) ifNil: [ 
			body addMessage: 'Ingrese un valor numerico'.
		] ifNotNil: [ 
			(Helper stringIsNumeric: fInput) ifFalse:[
				self addMessage: 'Ingrese un valor numerico'.
			] ifTrue: [
				cliente sumarDinero: fInput asInteger.
				self addMessage: 'Usted ha ingresado $',fInput.
				popUp delete.
			].
		].
	].
]

{ #category : #initialization }
PerfilCliente >> initializeWithSystem: unSistema cliente: unCliente [
	super initializeWithSystem: unSistema cliente: unCliente.
	"Agrega Morphs"
	self addBotonBorrarVentana: 'Salir'.
	self addDatosCliente.
	self addButtons.
]

{ #category : #updating }
PerfilCliente >> update: unCliente [
	super update: unCliente.
	unCliente ifNotNil:  [  
		datosCliente setText: (self clienteToStringPerfil: unCliente).
	].
]

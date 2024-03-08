"
Menu de ingreso de cliente.
Instance Variables
	botonIngreso:		<Button>
	botonRegistro:		<Button>
	campoDni:		<TextField>
"
Class {
	#name : #ClienteLogIn,
	#superclass : #Ventana,
	#instVars : [
		'campoDni',
		'botonIngreso',
		'botonRegistro'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
ClienteLogIn >> addButtons [
	botonIngreso := Button label: 'Ingresar' extent: 80@30.
	botonRegistro := Button label: 'Registrar' extent: 80@30.

	botonIngreso left: contenedor left + 15.
	botonIngreso bottom: contenedor bottom - 15.
	botonRegistro right: contenedor right - 15.
	botonRegistro bottom: contenedor bottom - 15.
	
	botonIngreso mouseAction: [ 
		"Verifica que el input no este vacio"
		(campoDni isEmpty) ifTrue: [
			self addMessage: 'No se ha ingresado DNI'.
			] ifFalse: [
				"Verifica que el input sea numerico"
				(Helper stringIsNumeric:  (campoDni input)) ifTrue: [ 
					|unCliente|.
					unCliente := sistema buscarClienteConDni: ((campoDni input) asInteger).
					(unCliente) ifNotNil: [ 
						"Creo view de perfilCliente con el cliente encontrado"
						self addMorphCentered: (PerfilCliente createWithSystem: sistema cliente: unCliente).
					] ifNil: [
						self addMessage: 'No existe cliente con DNI ',(campoDni input).
					].
				] ifFalse: [
					self addMessage: 'Ingrese un valor numerico'.
				].
				campoDni clear.
			].
	].

	"botonRegistro mouseAction: [  ]."
	
	contenedor addMorph: botonIngreso.
	contenedor addMorph: botonRegistro.


]

{ #category : #adding }
ClienteLogIn >> addCampoDni [
	|label|.
	"Creo morphs"
	campoDni := TextField createTransparentExtent: 130@50 borderColor: Color black.
	label := 'DNI' asMorph.
	label color: Color black.
	"Posiciono morphs"
	campoDni center: (contenedor center).
	campoDni top: contenedor top + 40; textColor: Color black.
	label top: campoDni top - 20.
	label left: campoDni left.
	"Agrego morphs"
	contenedor addMorph: label.
	contenedor addMorph: campoDni.

]

{ #category : #initialization }
ClienteLogIn >> initializeWithSystem: sis [
	"super para aplicar las config de superclase"
	super initializeWithSystem: sis.
	"Agrega boton de back"
	self addBotonBorrarVentana: 'Volver'.
	"Agrega contenedor de TextField y botones"
	self addContenedor: 210@130.
	"contenedor del campo de registro/ingreso"
	self addCampoDni.
	"botones de ingreso y registro"
	self addButtons.
]

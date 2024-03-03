"
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
	botonIngreso := Button text: 'Ingresar' extent: 80@30.
	botonIngreso mouseAction: [ 
		(campoDni isEmpty) ifTrue: [
			self addPopUp: 'No se ha ingresado DNI'.
			] ifFalse: [
				(Helper stringIsNumeric:  (campoDni input)) ifTrue: [ 
					self addPopUp: 'Lindo numero'.
				] ifFalse: [
					self addPopUp: 'Eso no es un numero :C'.
				].
			].
	].
	botonIngreso left: contenedor left + 15.
	botonIngreso bottom: contenedor bottom - 15.
	contenedor addMorph: botonIngreso.
	
	botonRegistro := Button text: 'Registrar' extent: 80@30.
	"botonRegistro mouseAction: [  ]."
	botonRegistro right: contenedor right - 15.
	botonRegistro bottom: contenedor bottom - 15.	
	contenedor addMorph: botonRegistro.
]

{ #category : #adding }
ClienteLogIn >> addCampoDni [
	|label|.
	"Creo campoDni"
	campoDni := TextField createTransparentExtent: 130@50 borderColor: Color black.
	campoDni center: (contenedor center).
	campoDni top: contenedor top + 40; textColor: Color black.
	
	"Creo etiqueta del campo y posiciono en contenedor segun campo"
	label := 'DNI' asMorph.
	label color: Color black.
	label top: campoDni top - 20.
	label left: campoDni left.
	"Agrego campo y etiqueta al contenedor"
	contenedor addMorph: label.
	contenedor addMorph: campoDni.

]

{ #category : #initialization }
ClienteLogIn >> initialize [
	"super para aplicar las config de superclase"
	super initialize.
	"Agrega boton de back"
	self addBotonAtras: 'Volver'.
	"Agrega contenedor de TextField y botones"
	self addContenedor: 210@130.
	"contenedor del campo de registro/ingreso"
	self addCampoDni.
	"botones de ingreso y registro"
	self addButtons.
]

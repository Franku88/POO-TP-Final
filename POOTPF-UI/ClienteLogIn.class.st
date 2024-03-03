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
ClienteLogIn >> addCampoDni [
	|label|.
	"Creo campoDni"
	campoDni := TextField createTransparentExtent: 100@50 borderColor: Color black.
	campoDni center: (contenedor center).
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
	self addContenedor: 200@100.
	"contenedor del campo de registro/ingreso"
	self addCampoDni.
]

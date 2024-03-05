"
Vista que muestra datos de un cliente.
Instance Variables
	botonVerContratos: 	<Button>
	botonIngresarDinero: 	<Button>
	datosCliente: 		<TextMorph>
	
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

{ #category : #initialization }
PerfilCliente class >> createWithSystem: unSistema cliente: unCliente [
	|perfilW|.
	perfilW := self new.
	perfilW initializeWithSystem: unSistema cliente: unCliente.
 	^perfilW.
]

{ #category : #adding }
PerfilCliente >> addButtons [
	"Crea botones"
	botonVerContratos := Button text: 'Ver contratos' extent: 160@30.
	botonIngresarDinero := Button text: 'Ingresar dinero' extent: 160@30.
	"Posiciona"
	botonVerContratos center: (body center)*(1.5).
	botonVerContratos top: contenedor top+100.
	botonIngresarDinero center: (body center)*(1.5).
	botonIngresarDinero bottom: contenedor bottom - 100.
	"Da funcion"
	botonVerContratos mouseAction: [
		self addMorphCentered: (VerContratos createWithSystem: sistema cliente: cliente). 
		].
	
	botonIngresarDinero mouseAction: [
		self addPopUpIngresarDinero.
	].

	"Agrega"
	body addMorph: botonVerContratos. 
	body addMorph: botonIngresarDinero. 
	
	
	
]

{ #category : #adding }
PerfilCliente >> addDatosCliente [
	"Agrega datos centrados al contenedor"
	datosCliente := TextMorph new.
	datosCliente contents: (self clienteToStringPerfil: cliente).
	contenedor addMorphCentered: datosCliente.

]

{ #category : #adding }
PerfilCliente >> addPopUpIngresarDinero [
	"Agrega un popup al body con un campo de texto, se ingresa por parametro el titulo a mostrar, su 	dimension y el accionar del boton aceptar, por defecto, el boton cancelar eliminara el popup"
		|popup textM txtField bAceptar bCancelar|
		"Creo morphs de la ventana emergente"
		popup := Morph new.
		textM := '¿Cuanto dinero desea ingresar?' asMorph.
		txtField := TextField createTransparentExtent: 100@30 borderColor: Color black.
		bAceptar := Button text: 'Aceptar'.
		bCancelar := Button text: 'Cancelar'.
	
		"Posiciono ventana y contenidos"
		popup extent: 250@135; center: body center.
		popup color: tema container; borderWidth: 2; borderColor: Color black.
		textM center: popup center; top: popup top + 20.
		txtField center: popup center.
		bAceptar right: popup left + ((popup right - popup left)/2) - 10; bottom: popup bottom - 15.
		bCancelar left: popup left + ((popup right - popup left)/2) + 10; bottom: popup bottom - 15.	
	
		"Funciones de botones"	
		bAceptar mouseAction: [  
			(txtField input) ifNil: [ 
				body addMessage: 'Ingrese un valor numerico'.
			] ifNotNil: [ 
				(Helper stringIsNumeric: txtField input) ifFalse:[
					self addMessage: 'Ingrese un valor numerico'.
				] ifTrue: [
					cliente sumarDinero: (txtField input) asInteger.
					self addMessage: 'Usted ha ingresado $',(txtField input).
					popup delete.
				].
			].
		].
		bCancelar mouseAction: [  
			popup delete.
		].
	
		"Agrego morphs"
		popup addMorph: textM.
		popup addMorph: txtField.
		popup addMorph: bAceptar.
		popup addMorph: bCancelar.
		body addMorph: popup. 
]

{ #category : #initialization }
PerfilCliente >> initializeWithSystem: unSistema cliente: unCliente [
	super initializeWithSystem: unSistema cliente: unCliente.
	"Agrega Morphs"
	self addBotonBorrarVentana: 'Salir'.
	self addContenedor: 280@400.
	self addDatosCliente.
	self addTitulo: 'Cliente'.
	self addButtons.
	"Posiciono"
	contenedor left: body left + 40.
	datosCliente top: contenedor top + 20.
	datosCliente left: contenedor left + 20.
	titulo center: contenedor center.
	titulo bottom: contenedor top - 10.
]

{ #category : #updating }
PerfilCliente >> update: unCliente [
	unCliente ifNotNil:  [  
		datosCliente contents: (self clienteToStringPerfil: unCliente).
	].
]

"
Vista que muestra datos de un cliente
	cliente:		<Cliente>
	botonVerContratos: 	<Button>
	botonIngresarDinero: 	<Button>
	datosCliente: 		<TextMorph>
	
"
Class {
	#name : #PerfilCliente,
	#superclass : #Ventana,
	#instVars : [
		'cliente',
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
	botonVerContratos mouseAction: [].
	
	botonIngresarDinero mouseAction: [
		self addPopUpIngresarDinero.
	].

	"Agrega"
	body addMorph: botonVerContratos. 
	body addMorph: botonIngresarDinero. 
	
	
	
]

{ #category : #adding }
PerfilCliente >> addDatosCliente [
	datosCliente := TextMorph new.
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
		popup color: tema containerBorder; borderWidth: 2; borderColor: Color black.
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

{ #category : #strings }
PerfilCliente >> clienteToStringPerfil [
	^self clienteToStringPerfil: cliente
	
]

{ #category : #strings }
PerfilCliente >> clienteToStringPerfil: unCliente [
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
PerfilCliente >> initializeWithSystem: unSistema cliente: unCliente [
	self initialize.
	"Inicializo sistema y ususario encontrado"
	sistema := unSistema.
	cliente := unCliente.
	"Agrega Morphs"
	self addBotonAtras: 'Salir'.
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
	"Agrego dependientes y actualizo"
	cliente addDependent: self.
	self update: cliente.
]

{ #category : #updating }
PerfilCliente >> update: unObjeto [
	"En este caso, ingresa por parametro un objeto de la clase cliente"
	unObjeto ifNotNil: [
		datosCliente contents: (self clienteToStringPerfil: unObjeto). 	
	].
]

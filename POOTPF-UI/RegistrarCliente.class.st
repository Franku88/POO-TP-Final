"
Vista que permite realizar el registro de un cliente nuevo al sistema.

Instance Variables
campoDni:			<TextField>
campoApellido:	<TextField>
campoContacto:		<TextField>
campoPreferencias:		<TextField>

"
Class {
	#name : #RegistrarCliente,
	#superclass : #Ventana,
	#instVars : [
		'campoDni',
		'campoApellido',
		'campoContacto',
		'campoCiudad',
		'campoPreferencias',
		'botonRegistrar'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
RegistrarCliente >> addBotonRegistrar [
	botonRegistrar := Button label: 'Registrar'.
	"campoContacto borderWidth: 1; borderColor: Color black.	"
		
	botonRegistrar center: contenedor center + (0@155).
	botonRegistrar mouseAction: [ 
		|dniString|.
		dniString := campoDni input.
		(Helper stringIsNumeric: dniString) ifTrue: [  
			(sistema buscarClienteConDni: dniString asInteger) ifNil: [
				(campoApellido isEmpty | campoCiudad isEmpty | campoContacto isEmpty | campoPreferencias isEmpty) ifTrue:[
					self addMessage: 'Todos los campos son obligatorios'.
				] ifFalse: [
					sistema agregarCliente: (Cliente crear: (dniString asInteger) apellido: (campoApellido input)  ciudad: (campoCiudad input) datosContacto: (campoContacto input) preferencias: (campoPreferencias input)).
					self addMessage: 'Cliente registrado con exito.'.	
					campoDni clear.
					campoApellido clear.
					campoCiudad clear.
					campoContacto clear.
					campoPreferencias clear.	
				].
			] ifNotNil: [  
				self addMessage: 'DNI ya registrado.'.
				campoDni clear.
			] .
		] ifFalse: [  
			self addMessage: 'DNI ingresado no es numerico.'.
			campoDni clear.
		].
	].
	body addMorph: botonRegistrar.
	
	
	

]

{ #category : #adding }
RegistrarCliente >> addCampoApellido [
	|label|.
	campoApellido := TextField createTransparentExtent: 130@30 ghostText: 'ej: Perez'.
	campoApellido borderWidth: 1; borderColor: Color black.
	label := 'Apellido' asMorph.
	
	campoApellido center: contenedor center - (0@93).
	label center: campoApellido center - (0@20).
	
	body addMorph: campoApellido.
	body addMorph: label.
]

{ #category : #adding }
RegistrarCliente >> addCampoCiudad [
	|label|.
	campoCiudad := TextField createTransparentExtent: 200@30 ghostText: 'ej: Manuel Alberti'.
	campoCiudad borderWidth: 1; borderColor: Color black.
	label := 'Ciudad' asMorph.
	
	campoCiudad center: contenedor center - (0@31).
	label center: campoCiudad center - (0@20).
	
	body addMorph: campoCiudad.
	body addMorph: label.
]

{ #category : #adding }
RegistrarCliente >> addCampoContacto [
	|label|.
	campoContacto := TextField createTransparentExtent: 200@30 ghostText: 'ej: 1145655654, usuario@mail.com'.
	campoContacto borderWidth: 1; borderColor: Color black.
	label := 'Contacto' asMorph.
	
	campoContacto center: contenedor center + (0@31).
	label center: campoContacto center - (0@20).
	
	body addMorph: campoContacto.
	body addMorph: label.
	
	

]

{ #category : #adding }
RegistrarCliente >> addCampoDni [
	|label|.
	campoDni := TextField createTransparentExtent: 130@30 ghostText: 'ej: 01234567'.
	campoDni borderWidth: 1; borderColor: Color black.
	label := 'DNI' asMorph.
	
	campoDni center: contenedor center - (0@155).
	label center: campoDni center - (0@20).
	
	body addMorph: campoDni.
	body addMorph: label.
	
	
]

{ #category : #adding }
RegistrarCliente >> addCampoPreferencias [
	|label|.
	campoPreferencias := TextField createTransparentExtent: 230@30 ghostText: 'ej: Sin preferencias, llamar a celular, etc.'.
	campoPreferencias borderWidth: 1; borderColor: Color black.
	label := 'Preferencias' asMorph.
	
	campoPreferencias center: contenedor center + (0@93).
	label center: campoPreferencias center - (0@20).
	
	body addMorph: campoPreferencias.
	body addMorph: label.
]

{ #category : #adding }
RegistrarCliente >> addCampos [
	self addCampoDni.
	self addCampoApellido.
	self addCampoCiudad.
	self addCampoContacto.
	self addCampoPreferencias.
	
	

]

{ #category : #initialization }
RegistrarCliente >> initializeWithSystem: sis [
	super initializeWithSystem: sis.
	self addBotonBorrarVentana: 'Atras'.
	self addContenedor: 260@380.
	self addTitulo: 'Registrar cliente'.
	titulo bottom: contenedor top - 20.
	self addCampos.
	self addBotonRegistrar.
	
]

"
Instance Variables
sistema:		<EmpresaTurismo>
tema:		<Theme>
header:	<Morph>
body:		<Morph>
logo: 	 	<Form>
titulo: 	<String>
"
Class {
	#name : #Ventana,
	#superclass : #BorderedMorph,
	#instVars : [
		'sistema',
		'tema',
		'header',
		'body',
		'botonBorrarVentana',
		'contenedor',
		'logo',
		'titulo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #creating }
Ventana class >> createWithSystem: sis [
	|window|.
	window := self new.
	window initializeWithSystem: sis.
 	^window.
]

{ #category : #adding }
Ventana >> addBody [
	"Body agregado luego del header, ya que sus dimensiones estan relacionadas"
	body := Morph new.
	body color: tema background.
	"Dejo lugar para header"
	body position: (0@(header height)).
	body extent: 800@(600 - (header height)); borderWidth: 1; borderColor: Color black.
	self addMorph: body.
]

{ #category : #adding }
Ventana >> addBotonBorrarVentana: etiqueta [
	botonBorrarVentana := Button label: etiqueta extent: 80@30.
	botonBorrarVentana center: header center.
	botonBorrarVentana left: header left+30.
	botonBorrarVentana mouseAction: [ 
		self delete 
	].
	header addMorph: botonBorrarVentana.
]

{ #category : #adding }
Ventana >> addContenedor: dim [
	contenedor := Morph new.
	contenedor extent: dim.
	contenedor center: body center.
	contenedor color: tema container; borderWidth: 1; borderColor: tema containerBorder.
	body addMorph: contenedor.
	
]

{ #category : #adding }
Ventana >> addHeader [
	"Primero se agrega el header a la ventana, luego el body"
	header := Morph new.
	header color: tema header; extent: 800@110; borderWidth: 1; borderColor: Color black.
	"Posiciono logo"
	logo center: header center.
	logo right: header right-20.	
	header addMorph: logo.
	self addMorph: header.
	
]

{ #category : #adding }
Ventana >> addMessage: text [
	self addMessage: text extent: 200@100.
]

{ #category : #adding }
Ventana >> addMessage: text extent: dim [
	|popup textM button|.
	"Creo ventana de emergente"
	popup := Morph new.
	popup extent: dim; center: body center; color: tema container; borderWidth: 2; borderColor: Color black.
	"Creo texto del popup y lo agrego"
	textM := text asTextMorph.
	textM center: popup center; top: popup top + 20.
	popup addMorph: textM.
	"Creo boton de confirmar y lo agrego"
	button := Button label: 'OK'.
	button center: popup center; bottom: popup bottom - 20.
	button mouseAction: [  
		popup delete.	
	].
	popup addMorph: button.
	"Agrego popup al body"
	self addMorph: popup.
	

]

{ #category : #adding }
Ventana >> addMessageConfirm: text actionConfirm: unBloque [
	"Bloque ingresado debe poder recibir una variable popup (:popup|)"
	self addMessageConfirm: text actionConfirm: unBloque extent:  200@100.
]

{ #category : #adding }
Ventana >> addMessageConfirm: text actionConfirm: unBloque extent: dim [
	"Agrega un popup al body, se ingresa por parametro el titulo a mostrar, su dimension y el accionar del boton aceptar, por defecto, el boton cancelar eliminara el popup"
	"unBloque debe recibir el popup para eliminarlo si fuera necesario"
	|popup textM bAceptar bCancelar|
	"Creo morphs de la ventana emergente"
	popup := Morph new.
	textM := text asTextMorph.
	bAceptar := Button label: 'Si'.
	bCancelar := Button label: 'No'.
	
	"Posiciono ventana y contenidos"
	popup extent: dim; center: body center.
	popup color: tema container; borderWidth: 2; borderColor: Color black.
	textM center: popup center; top: popup top + 20.

	bAceptar right: popup left + ((popup right - popup left)/2) - 10; bottom: popup bottom - 15.
	bCancelar left: popup left + ((popup right - popup left)/2) + 10; bottom: popup bottom - 15.	
	
	"Funciones de botones"	
	bAceptar mouseAction: [unBloque value: popup.].
	bCancelar mouseAction: [popup delete.].

	"Agrego morphs"
	popup addMorph: textM.
	popup addMorph: bAceptar.
	popup addMorph: bCancelar.
	body addMorph: popup.
	
]

{ #category : #adding }
Ventana >> addMessageInput: mensaje actionAceptar: unBloque [
	self addMessageInput: mensaje actionAceptar: unBloque  extent: 250@135.
]

{ #category : #adding }
Ventana >> addMessageInput: mensaje actionAceptar: unBloque extent: dim [
	"Agrega un popup al body con un campo de texto, se ingresa por parametro el titulo a mostrar, su dimension y el accionar del boton aceptar, por defecto, el boton cancelar eliminara el popup"
	"unBloque debe recibir dos parametros, primero (txtField input) y segundo (popup), popup para eliminarlo si fuera necesario e input para ejecutar accion con el contenido ingresado por el usuario"
	|popup textM txtField bAceptar bCancelar|
	"Creo morphs de la ventana emergente"
	popup := Morph new.
	textM := mensaje asTextMorph.
	txtField := TextField createTransparentExtent: 100@30 borderColor: Color black.
	bAceptar := Button label: 'Aceptar'.
	bCancelar := Button label: 'Cerrar'.
	
	"Posiciono ventana y contenidos"
	popup extent: dim; center: body center.
	popup color: tema container; borderWidth: 2; borderColor: Color black.
	textM center: popup center; top: popup top + 20.
	txtField center: popup center.
	bAceptar right: popup left + ((popup right - popup left)/2) - 10; bottom: popup bottom - 15.
	bCancelar left: popup left + ((popup right - popup left)/2) + 10; bottom: popup bottom - 15.	
	
	"Funciones de botones"	
	bAceptar mouseAction: [unBloque value: (txtField input) value: popup. txtField clear].
	bCancelar mouseAction: [popup delete.].

	"Agrego morphs"
	popup addMorph: textM.
	popup addMorph: txtField.
	popup addMorph: bAceptar.
	popup addMorph: bCancelar.
	body addMorph: popup.
	

]

{ #category : #adding }
Ventana >> addTitulo: unString [
	titulo := unString asMorph.
	titulo center: (body center).
	titulo top: (body top*1.125); color: Color black.
	body addMorph: titulo.
	
	
]

{ #category : #deleting }
Ventana >> botonBorrarVentana [
	^botonBorrarVentana
]

{ #category : #strings }
Ventana >> clienteToStringPerfil: unCliente [
	"Convierte a unCliente en una cadena para posicionar dentro del contenedor de perfil"
	|string rta|.	
	string := '    DNI: ',String cr,'            ', (unCliente dni asString), String cr.
	string := string, '    Apellido: ',String cr,'            ', (unCliente apellido asString), String cr.
	string := string, '    Ciudad: ',String cr,'            ', (unCliente ciudad asString), String cr.
	string := string, '    Contacto: ',String cr,'            ', (unCliente datosContacto asString), String cr.
	"rta segun boolean esFrecuente"
	rta := 'No'.
	(unCliente esFrecuente) ifTrue: [rta := 'Si'.].
	string := string, '    Frecuente: ',String cr,'            ',rta, String cr.
	string := string, '    Millas: ',String cr,'            ', (unCliente millas asString), String cr.
	string := string, '    Dinero: ',String cr,'             $', (unCliente dinero asString), String cr.
	string := string, '    Preferencias: ',String cr,'            ', (unCliente preferencias asString).
	^string.
]

{ #category : #strings }
Ventana >> contratoToString: unContrato [
	|cadena cadenaRes|.
	cadenaRes := ''.
	(unContrato colReservas) do: [ :cadaRes |
			cadenaRes := cadenaRes,(cadaRes toString),String cr.
	].
	(cadenaRes = '') ifTrue: [
		cadenaRes := '		Sin Reservas',String cr.
	].
	
	cadena := 'Numero: ',unContrato numero asString,String cr,
	'Fecha de contrato: ', unContrato fechaContrato ddmmyyyy,String cr,
	'Viaje: ',String cr,(self viajeToString: unContrato viaje),String cr,
	'Fecha seleccionada: ',unContrato fechaSeleccionada ddmmyyyy,String cr,
	'Cantidad de personas: ',unContrato cantPersonas asString,String cr,
	'Cuotas: ',unContrato cantCuotas asString,String cr,
	'Cuotas pagadas: ',unContrato cantCuotasPagadas asString,String cr,
	'Valor de cuota: $',(unContrato valorCuota) asString,String cr,
	'Proximo vencimiento: ',unContrato fechaProxVencimiento ddmmyyyy,String cr,
	'Reservas: ',String cr,cadenaRes,
	'Es Efectivo: ',(Helper booleanToString: unContrato esEfectivo),String cr,
	'Es Flexible: ',(Helper booleanToString: unContrato esFlexible).
	^cadena
]

{ #category : #initialization }
Ventana >> initialize [
	"Inicializa ventana sin sistema"
	super initialize.
	tema := Theme new default.
	logo := tema logo.
	self extent: 800@600.
	self color: Color transparent.
	self addHeader.
	self addBody.

	
]

{ #category : #initialization }
Ventana >> initializeWithSystem: sis [
	"Inicializacion con sistema"
	self initialize.
	sistema := sis.
	
	
]

{ #category : #strings }
Ventana >> viajeToString: unViaje [
	|cadena|.
	cadena := '		Nombre: ', unViaje nombre,String cr,
	'		Costo por persona: $', unViaje costoPorPersona asString,String cr,
	'		Impuestos: $', unViaje valorImpuestos asString.
	^cadena.
]

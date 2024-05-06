"
Vista para crear viaje especial
<Instance Variables>
campoNombre:				<TextField>
campoCostoPP: 			<TextField>
campoImpuestos:			<TextField>
campoCiudad: 			<TextField>
campoFechaSalida:		<TextField>
campoCupo: 				<TextField>
campoFechaRegreso:		<TextField>
botonCrearViaje:		<Button>
"
Class {
	#name : #CrearViajeEspecial,
	#superclass : #Ventana,
	#instVars : [
		'campoNombre',
		'campoCostoPP',
		'campoImpuestos',
		'campoCiudad',
		'campoFechaSalida',
		'campoCupo',
		'campoFechaRegreso',
		'botonCrearViaje'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
CrearViajeEspecial >> addAviso [
	|aviso|.
	aviso := ScrolledText createExtent: 160@100 color: (tema container) title: 'Aviso'.
	aviso left: contenedor right + 50.
	aviso top: contenedor top.
	aviso beReadOnly; hScrollbarShowNever; vScrollbarShowNever.

	aviso setText: 'Podra modificar solamente
 el cupo y fecha de regreso
    luego de crear el viaje'.
	
	body addMorph: aviso.
]

{ #category : #adding }
CrearViajeEspecial >> addBotonCrearViaje [
	botonCrearViaje := Button label: 'Crear Viaje'.
	botonCrearViaje center: contenedor center + (0@217).
	"Helper stringIsNumeric: cupoString"
	botonCrearViaje mouseAction: [
			(campoNombre isEmpty | campoCostoPP isEmpty | campoImpuestos isEmpty | campoCiudad isEmpty | campoFechaSalida isEmpty | campoCupo isEmpty | campoFechaRegreso isEmpty) ifTrue: [
					self addMessage: 'Todos los campos son obligatorios' extent: 220@100.
				] ifFalse: [
					((Helper stringIsNumeric: (campoCostoPP input)) &
					(Helper stringIsNumeric: (campoImpuestos input)) &
					(Helper stringIsNumeric: (campoCupo input))) ifTrue: [
							(sistema buscarViajeConNombre: (campoNombre input)) ifNil: [
								|stringSalida stringRegreso|.
								stringSalida := campoFechaSalida input.
								stringRegreso := campoFechaRegreso input.
								((Helper stringMMDDAAAA: stringSalida) & (Helper stringMMDDAAAA: stringRegreso)) ifTrue: [
									|fechaSalida fechaRegreso|.
									fechaSalida := Date fromString: stringSalida.
									fechaRegreso := Date fromString: stringRegreso.
									((fechaSalida < fechaRegreso) & (fechaSalida > (Date today))) ifTrue: [
											sistema generarViajeEspecial: (campoNombre input) costoPorPersona: (campoCostoPP input asInteger)  valorImpuestos: (campoImpuestos input asInteger) ciudad: (campoCiudad input) fechaSalida: (FechaSalida crear: fechaSalida cupo: (campoCupo input asInteger)) fechaRegreso: (fechaRegreso).
											self addMessage: 'Viaje Especial creado con exito.'.	
											campoNombre clear.
											campoCostoPP clear.
											campoImpuestos clear.
											campoCiudad clear.
											campoFechaSalida clear.
											campoCupo clear.
											campoFechaRegreso clear.
										] ifFalse: [
											self addMessage: '  Fecha salida debe ser antes
 que fecha regreso y despues de hoy.' extent: 200@120.
										].
								] ifFalse: [
									self addMessage: '  Fecha salida o Fecha regreso 
 no tienen formato MM-DD-AAAA' extent: 200@120.
								].
							] ifNotNil: [  
								self addMessage: 'Ya existe un viaje con ese nombre'.
								campoNombre clear.
							].
						] ifFalse: [
							self addMessage: 'Costo por persona, impuestos y 
    cupo deben ser numericos.' extent: 200@120.
							campoCostoPP clear.
							campoImpuestos clear.
							campoCupo clear.
						].
				].
		].
	self addMorph: botonCrearViaje. 
]

{ #category : #adding }
CrearViajeEspecial >> addCampoCiudad [
	|label|.
	campoCiudad := TextField createTransparentExtent: 150@30 ghostText: 'ej: Cordoba'.
	campoCiudad borderWidth: 1; borderColor: Color black.
	label := 'Ciudad' asMorph.
	
	campoCiudad center: contenedor center + (0@31).
	label center: campoCiudad center - (0@20).
	
	body addMorph: campoCiudad.
	body addMorph: label.
]

{ #category : #adding }
CrearViajeEspecial >> addCampoCostoPP [
	|label|.
	campoCostoPP := TextField createTransparentExtent: 120@30 ghostText: 'ej: 5000'.
	campoCostoPP borderWidth: 1; borderColor: Color black.
	label := 'Costo por Persona' asMorph.
	
	campoCostoPP center: contenedor center - (0@93).
	label center: campoCostoPP center - (0@20).
	
	body addMorph: campoCostoPP.
	body addMorph: label.
]

{ #category : #adding }
CrearViajeEspecial >> addCampoCupo [
	|label|.
	campoCupo := TextField createTransparentExtent: 90@30 ghostText: '10'.
	campoCupo borderWidth: 1; borderColor: Color black.
	label := 'Cupo' asMorph.
	
	campoCupo center: contenedor center + (65@93).
	label center: campoCupo center - (0@20).
	
	body addMorph: campoCupo.
	body addMorph: label.
]

{ #category : #adding }
CrearViajeEspecial >> addCampoFechaRegreso [
	|label|.
	campoFechaRegreso := TextField createTransparentExtent: 90@30 ghostText: 'MM-DD-AAAA'.
	campoFechaRegreso borderWidth: 1; borderColor: Color black.
	label := 'Fecha de Regreso' asMorph.
	
	campoFechaRegreso center: contenedor center + (0@155).
	label center: campoFechaRegreso center - (0@20).
	
	body addMorph: campoFechaRegreso.
	body addMorph: label.
]

{ #category : #adding }
CrearViajeEspecial >> addCampoFechaSalida [
	|label|.
	campoFechaSalida := TextField createTransparentExtent: 90@30 ghostText: 'MM-DD-AAAA'.
	campoFechaSalida borderWidth: 1; borderColor: Color black.
	label := 'Fecha de Salida' asMorph.
	
	campoFechaSalida center: contenedor center + (-65@93).
	label center: campoFechaSalida center - (0@20).
	
	body addMorph: campoFechaSalida.
	body addMorph: label.
]

{ #category : #adding }
CrearViajeEspecial >> addCampoImpuestos [
	|label|.
	campoImpuestos := TextField createTransparentExtent: 120@30 ghostText: 'ej: 1500'.
	campoImpuestos borderWidth: 1; borderColor: Color black.
	label := 'Impuestos' asMorph.
	
	campoImpuestos center: contenedor center - (0@31).
	label center: campoImpuestos center - (0@20).
	
	body addMorph: campoImpuestos.
	body addMorph: label.
]

{ #category : #adding }
CrearViajeEspecial >> addCampoNombre [
	|label|.
	campoNombre := TextField createTransparentExtent: 200@30 ghostText: 'ej: Viaje a Cordoba'.
	campoNombre borderWidth: 1; borderColor: Color black.
	label := 'Nombre' asMorph.
	
	campoNombre center: contenedor center - (0@155).
	label center: campoNombre center - (0@20).
	
	body addMorph: campoNombre.
	body addMorph: label.
]

{ #category : #adding }
CrearViajeEspecial >> addCampos [
	"Separación de 0@62 entre cada campo"
	self addCampoNombre.
	self addCampoCostoPP. 			
	self addCampoImpuestos.
	self addCampoCiudad.
	self addCampoFechaSalida.
	self addCampoCupo.
	self addCampoFechaRegreso.
]

{ #category : #initialization }
CrearViajeEspecial >> initializeWithSystem: sis [
	super initializeWithSystem: sis.
	self addBotonBorrarVentana: 'Volver'.
	self addContenedor: 260@380.
	self addAviso.
	self addTitulo: 'Creando Viaje Especial'.
	titulo bottom: contenedor top - 20.
	self addCampos.
	self addBotonCrearViaje.
	
]

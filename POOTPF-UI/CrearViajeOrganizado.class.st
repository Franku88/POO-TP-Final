"
Vista para crear viaje organizado
<Instance Variables>
"
Class {
	#name : #CrearViajeOrganizado,
	#superclass : #CrearViaje,
	#instVars : [
		'campoCantDias',
		'botonContinuarEtapas',
		'botonAgregarEtapa',
		'colEtapas',
		'contenedorEtapa',
		'diaLlegada',
		'campoCantDiasEtapa',
		'campoNombreHotel',
		'campoTipoPension',
		'campoExcursiones'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
CrearViajeOrganizado >> addAviso [
	|aviso|.
	aviso := ScrolledText createExtent: 160@200 color: (tema container) title: 'Aviso'.
	aviso right: body right - 20.
	aviso top: body top + 50.
	aviso beReadOnly; hScrollbarShowNever; vScrollbarShowNever.
	aviso setText: '       Fechas de Salida y
Excursiones Opcionales se 
 ingresan al modificar viaje.

Ingresa las excursiones de
 cada etapa separadas por
	  una "," (coma).
  Ejemplo: exc1,exc2,exc3.
'.
	body addMorph: aviso.
]

{ #category : #adding }
CrearViajeOrganizado >> addBotonAgregarEtapa [
	botonAgregarEtapa := Button label: 'Agregar Etapa' extent: 120@30.
	botonAgregarEtapa center: contenedorEtapa center + (0@130).
	
	botonAgregarEtapa mouseAction: [
			"Controlar valores y el caso en que sea la ultima etapa"
			(campoCantDiasEtapa isEmpty | campoNombreHotel isEmpty | campoTipoPension isEmpty) ifTrue: [
					self addMessage: 'Los campos no pueden estar vacios'.
				] ifFalse: [
					(Helper stringIsNumeric: (campoCantDiasEtapa input)) ifTrue: [
							|colExc|.
							colExc := OrderedCollection new.
							((campoExcursiones input) findTokens: ',') do: [:cadaString|
									colExc add: (Excursion crear: cadaString).
								].
							colEtapas add: (Etapa crear: (campoCantDiasEtapa input asInteger) diaLlegada: (diaLlegada) nombreHotel: (campoNombreHotel input) tipoPension: (campoTipoPension input) colExcursiones: colExc).
							contenedorEtapa delete.
							(diaLlegada < (campoCantDias input asInteger)) ifTrue: [ 
									"Agrega otra etapa"
									self addContenedorEtapa: (diaLlegada + (campoCantDiasEtapa input asInteger)) 
								] ifFalse: [
									"No agrega más y termina de crear viaje"
									self addBotonCrearViaje.
								].
						] ifFalse: [
							self addMessage: 'Cantidad de Dias de Etapa
   debe ser numerico' extent: 200@120.
						].
				].

		].
	contenedorEtapa addMorph: botonAgregarEtapa.

]

{ #category : #adding }
CrearViajeOrganizado >> addBotonContinuarEtapas [
	botonContinuarEtapas := Button label: 'Continuar con Etapas' extent: 150@30.
	botonContinuarEtapas center: contenedor center + (0@130).
	
	botonContinuarEtapas mouseAction: [
			"Agregar comprobación de datos"
			(campoNombre isEmpty | campoCostoPP isEmpty | campoImpuestos isEmpty | campoCantDias isEmpty) ifTrue: [
					self addMessage: 'Los campos no deben estar vacios'.
				] ifFalse: [
					((Helper stringIsNumeric: (campoCostoPP input)) &
					(Helper stringIsNumeric: (campoImpuestos input)) &
					(Helper stringIsNumeric: (campoCantDias input))) ifTrue: [
						(campoCantDias input asInteger > 0) ifTrue: [
								(sistema buscarViajeConNombre: (campoNombre input)) ifNil: [
										self addContenedorEtapa: 1.
										campoNombre beReadOnly.
										campoCostoPP beReadOnly.
										campoImpuestos beReadOnly.
										campoCantDias beReadOnly.
										botonContinuarEtapas delete.
									] ifNotNil: [
										self addMessage: '   Ya existe un viaje 
con nombre ingresado' extent: 180@115.
									]	
							] ifFalse: [
								self addMessage: 'Cantidad de dias debe ser mayor a 0'.
							].
						] ifFalse: [
							self addMessage: '	Costo por Persona, Impuestos 
y Cantidad de Dias deben ser numericos.' extent: 250@120.
						].
				].
			].
	self addMorph: botonContinuarEtapas.
]

{ #category : #adding }
CrearViajeOrganizado >> addBotonCrearViaje [
	botonCrearViaje  := Button label: 'Crear Viaje'.
	botonCrearViaje center: contenedor center + (0@155).
	"Helper stringIsNumeric: cupoString"
	botonCrearViaje mouseAction: [
			(campoNombre isEmpty | campoCostoPP isEmpty | campoImpuestos isEmpty | campoCantDias isEmpty) ifTrue: [
					self addMessage: 'Todos los campos son obligatorios' extent: 220@100.
				] ifFalse: [
					((Helper stringIsNumeric: (campoCostoPP input)) &
					(Helper stringIsNumeric: (campoImpuestos input)) &
					(Helper stringIsNumeric: (campoCantDias input))) ifTrue: [
							(sistema buscarViajeConNombre: (campoNombre input)) ifNil: [
									"sistema generarViajeEspecial: (campoNombre input) costoPorPersona: (campoCostoPP input asInteger)  valorImpuestos: (campoImpuestos input asInteger) ciudad: (campoCiudad input) fechaSalida: (FechaSalida crear: fechaSalida cupo: (campoCupo input asInteger)) fechaRegreso: (fechaRegreso)."
									self addMessage: 'Viaje Especial creado con exito.'.	
									contenedor delete.
									self addContenedorViaje.
							] ifNotNil: [  
								self addMessage: 'Ya existe un viaje con ese nombre'.
								campoNombre clear.
							].
						] ifFalse: [
							self addMessage: 'Costo por persona, impuestos y 
    dias deben ser numericos.' extent: 200@120.
							campoCostoPP clear.
							campoImpuestos clear.
							campoCantDias clear.
						].
				].
		].
	contenedor addMorph: botonCrearViaje.
]

{ #category : #adding }
CrearViajeOrganizado >> addCampoCantDias [
	|label|.
	campoCantDias := TextField createTransparentExtent: 80@30 ghostText: '5'.
	campoCantDias borderWidth: 1; borderColor: Color black.
	label := 'Cantidad de Dias' asMorph.
	
	campoCantDias center: contenedor center + (0@31).
	label center: campoCantDias center - (0@20).
	
	body addMorph: campoCantDias.
	body addMorph: label.
]

{ #category : #adding }
CrearViajeOrganizado >> addCampoCantDiasEtapa [
	|label|.
	campoCantDiasEtapa := TextField createTransparentExtent: 80@30 ghostText: ''.
	campoCantDiasEtapa borderWidth: 1; borderColor: Color black.
	label := 'Cantidad de Dias de Etapa' asMorph.
	
	campoCantDiasEtapa center: contenedorEtapa center - (0@122).
	label center: campoCantDiasEtapa center - (0@20).
	
	contenedorEtapa addMorph: campoCantDiasEtapa.
	contenedorEtapa addMorph: label.
]

{ #category : #adding }
CrearViajeOrganizado >> addCampoExcursiones [
	|label|.
	campoExcursiones := TextField createTransparentExtent: 200@30 ghostText: 'exc1,exc2,exc3,...,excN'.
	campoExcursiones borderWidth: 1; borderColor: Color black.
	label := 'Excursiones' asMorph.
	
	campoExcursiones center: contenedorEtapa center + (0@64).
	label center: campoExcursiones center - (0@20).
	
	contenedorEtapa addMorph: campoExcursiones.
	contenedorEtapa addMorph: label.

]

{ #category : #adding }
CrearViajeOrganizado >> addCampoNombreHotel [
	|label|.
	campoNombreHotel := TextField createTransparentExtent: 120@30 ghostText: ''.
	campoNombreHotel borderWidth: 1; borderColor: Color black.
	label := 'Nombre de Hotel' asMorph.
	
	campoNombreHotel center: contenedorEtapa center - (0@60).
	label center: campoNombreHotel center - (0@20).
	
	contenedorEtapa addMorph: campoNombreHotel.
	contenedorEtapa addMorph: label.
]

{ #category : #adding }
CrearViajeOrganizado >> addCampoTipoPension [
	|label|.
	campoTipoPension := TextField createTransparentExtent: 120@30 ghostText: ''.
	campoTipoPension borderWidth: 1; borderColor: Color black.
	label := 'Tipo de Pension' asMorph.
	
	campoTipoPension center: contenedorEtapa center + (0@2).
	label center: campoTipoPension center - (0@20).
	
	contenedorEtapa addMorph: campoTipoPension.
	contenedorEtapa addMorph: label.
]

{ #category : #adding }
CrearViajeOrganizado >> addCampos [
	"Separación de 0@62 entre cada campo"
	self addCampoNombre.
	self addCampoCostoPP. 			
	self addCampoImpuestos.
	self addCampoCantDias.
]

{ #category : #adding }
CrearViajeOrganizado >> addCamposEtapa [
	self addCampoCantDiasEtapa.
	self addCampoNombreHotel.
	self addCampoTipoPension.
	self addCampoExcursiones.

]

{ #category : #adding }
CrearViajeOrganizado >> addContenedorEtapa: dia [
	|numEtapa|.
	diaLlegada := dia.
	contenedorEtapa := Morph new.
	contenedorEtapa extent: 260@380.
	contenedorEtapa top: contenedor top; left: contenedor right + 20.
	contenedorEtapa color: tema container; borderWidth: 1; borderColor: tema containerBorder.
	body addMorph: contenedorEtapa.
	
	numEtapa := ('Etapa ', (colEtapas size + 1) asString) asMorph.
	numEtapa center: contenedorEtapa center;top: contenedorEtapa top + 10.
	
	contenedorEtapa addMorph: numEtapa.
	
	self addCamposEtapa.
	self addBotonAgregarEtapa.

]

{ #category : #adding }
CrearViajeOrganizado >> addContenedorViaje [
	self addContenedor: 240@380.
	contenedor center: body center; left: body left + 20.
	self addAviso.
	self addTitulo: 'Creando Viaje Organizado'.
	titulo bottom: contenedor top - 20.
	self addCampos.
	self addBotonContinuarEtapas.
	colEtapas := OrderedCollection new.
]

{ #category : #initialization }
CrearViajeOrganizado >> initializeWithSystem: sis [
	super initializeWithSystem: sis.
	self addBotonBorrarVentana: 'Volver'.
	self addAviso.
	self addContenedorViaje.
]

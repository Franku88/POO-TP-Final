"
Vista que mostrara una tabla con todos los viajes del sistema.

Instance Variables
tablaViajes:		<Table>
masInfo:		<ScrolledText>
botonCrear:			<Button>
botonModificar: 	<Button>
botonCancelar:		<Button>
ddMin:			<TextField>
ddMax: 		<TextField>
mmMin: 		<TextField>
mmMax: 		<TextField>
yyyyMin:		<TextField>
yyyyMax:		<TextField>

"
Class {
	#name : #VerViajes,
	#superclass : #Ventana,
	#instVars : [
		'tablaViajes',
		'masInfo',
		'botonCrear',
		'botonModificar',
		'botonCancelar',
		'botonBuscar',
		'ddMin',
		'ddMax',
		'mmMin',
		'mmMax',
		'yyyyMin',
		'yyyyMax'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
VerViajes >> addButtons [
	"FALTA AGREGAR Y DAR FUNCIONES A BOTONES DE CREAR, MODIFICAR Y CANCELAR VIAJES"
	botonCrear := Button label: 'Crear' extent: 80@30 .
	botonModificar := Button label: 'Modificar' color: tema container extent: 80@30. 
	botonCancelar := Button label: 'Cancelar' color: tema container extent: 80@30.
	
	botonCrear left: tablaViajes left; top: tablaViajes bottom + 50.
	botonModificar center: tablaViajes center; top: tablaViajes bottom + 50.
	botonCancelar right: tablaViajes right; top: tablaViajes bottom + 50.

	botonCrear mouseAction: [  
		self addMessage: 'FALTA IMPLEMENTAR'.
	].

	botonModificar mouseAction: [
		(tablaViajes selectedElement) ifNotNil: [
			(tablaViajes selectedElement esOrganizado) ifTrue: [
					self addMorphCentered: (ModificarViajeOrganizado createWithSystem: sistema viaje: (tablaViajes selectedElement)).	
				] ifFalse: [
					self addMorphCentered: (ModificarViajeEspecial createWithSystem: sistema viaje: (tablaViajes selectedElement))
				].
			] ifNil: [
				self addMessage: ('Seleccione un viaje de',String cr,'la tabla para modificarlo.') extent: 180@120.
			].
		tablaViajes deselectAll.
	].

	botonCancelar mouseAction: [ 
		(tablaViajes selectedElement) ifNotNil: [
			self addMessageConfirm: ('¿Esta seguro? Se cancelaran todos',String cr,'	los contratos de dicho viaje.') actionConfirm: [:popup|
						(sistema bajarViajeConNombre: (tablaViajes selectedElement nombre)) ifTrue: [
								self addMessage: 'Viaje cancelado con extio' extent: 170@100.
							] ifFalse: [
								self addMessage: 'Hubo un error al cancelar viaje (No se encontro)'.
							].
							popup delete.
							tablaViajes deselectAll.
					] extent: 220@120.
		] ifNil: [
			self addMessage: ('Seleccione un viaje de',String cr,'la tabla para cancelarlo.') extent: 180@120.
		].
	].

	body addMorph: botonCrear .
	body addMorph: botonModificar.
	body addMorph: botonCancelar.
]

{ #category : #adding }
VerViajes >> addCamposFechas [
	|labelDesde labelHasta|.
	labelDesde := 'Desde:	' asTextMorph.
	ddMin := TextField createTransparentExtent: 30@30 ghostText: 'dd'.
	mmMin := TextField createTransparentExtent: 30@30 ghostText: 'mm'.
	yyyyMin := TextField createTransparentExtent: 40@30 ghostText: 'yyyy'.
	labelHasta := '	Hasta:	' asTextMorph.
	ddMax := TextField createTransparentExtent: 30@30 ghostText: 'dd'.
	mmMax := TextField createTransparentExtent: 30@30 ghostText: 'mm'.
	yyyyMax := TextField createTransparentExtent: 40@30 ghostText: 'yyyy'.
	botonBuscar := Button label: 'Buscar' extent: 60@30.
	
	ddMin borderWidth: 1; borderColor: Color black; maxLength: 2.
	mmMin borderWidth: 1; borderColor: Color black; maxLength: 2.
	yyyyMin borderWidth: 1; borderColor: Color black; maxLength: 4.
	ddMax borderWidth: 1; borderColor: Color black; maxLength: 2.
	mmMax borderWidth: 1; borderColor: Color black; maxLength: 2.
	yyyyMax borderWidth: 1; borderColor: Color black; maxLength: 4.

	labelDesde center: titulo center; left: masInfo left.
	ddMin center: labelDesde center; left: labelDesde right.
	mmMin center: ddMin center; left: ddMin right.
	yyyyMin center: mmMin center; left: mmMin right.
	labelHasta center: yyyyMin center; left: yyyyMin right.
	ddMax center: labelHasta center; left: labelHasta right.
	mmMax center: ddMax center; left: ddMax right.
	yyyyMax center: mmMax center; left: mmMax right.
	
	botonBuscar center: yyyyMax center; left: yyyyMax right + 10.
	
	botonBuscar mouseAction: [
		|viajesFilt camposVacios|.
		camposVacios := ((ddMin input),(ddMax input),(ddMax input),(mmMin input),(mmMax input),(yyyyMin input),(yyyyMax input)) = ''.
		(camposVacios) ifTrue: [
				"En el caso de que esten vacios, muestra todos los viajes"
				tablaViajes dataSource: (DataSourceViaje createCollection: sistema colViajes) . 
			] ifFalse: [
				((ddMin input isAllDigits) & (ddMax input isAllDigits) & (mmMin input isAllDigits) & 
(mmMax input isAllDigits) & (yyyyMin input isAllDigits) & (yyyyMax input isAllDigits)) ifTrue: [  
			viajesFilt := sistema obtenerViajes: (Date year: (yyyyMin input asInteger) month: (mmMin input asInteger) day: (ddMin input asInteger)) hasta: (Date year: (yyyyMax input asInteger) month: (mmMax input asInteger) day: (ddMax input asInteger)).
			tablaViajes dataSource: (DataSourceViaje createCollection: viajesFilt).
					] ifFalse: [
						self addMessage: 'Ingresar digitos en campos de fecha' extent: 250@100.
					].
			].
			tablaViajes deselectAll.
		].

	body addMorph: labelDesde.
	body addMorph: ddMin.
	body addMorph: mmMin.
	body addMorph: yyyyMin.
	body addMorph: labelHasta.
	body addMorph: ddMax.
	body addMorph: mmMax.
	body addMorph: yyyyMax.
	body addMorph: botonBuscar.

]

{ #category : #adding }
VerViajes >> addMasInfo [
	masInfo := ScrolledText createExtent: 400@400 color: (tema container) title: 'Mas informacion'.
	masInfo ghostText: 'Selecciona un viaje de la tabla...'.
	masInfo right: body right - 20.
	masInfo top: tablaViajes top.
	body addMorph: masInfo.
]

{ #category : #adding }
VerViajes >> addTablaViajes [
	"Agrega una tabla de datos de clientes actuales"
	tablaViajes  := Table createColumns: (#(Nombre 'Costo por Persona' Impuestos) asOrderedCollection) extent: (body width*(0.4))@(body height*(0.6)) dataSource: (DataSourceViaje createCollection: (sistema colViajes) object: sistema).
	tablaViajes borderColor: Color black; borderWidth: 1.
	
	tablaViajes top: body top + 60; left: body left + 20.
	
	body addMorph: tablaViajes.
]

{ #category : #initialization }
VerViajes >> initializeWithSystem: unSistema [
	super initializeWithSystem: unSistema .
	self addBotonBorrarVentana: 'Atras'.
	self addTablaViajes.
	self addTitulo: 'Viajes'.
	titulo top: body top + 20; left: tablaViajes left.
	self addMasInfo.
	self addButtons.
	self addCamposFechas.
	
	tablaViajes addDependent: self.
	self update: tablaViajes.
]

{ #category : #updating }
VerViajes >> update: o [
	super update: o.
	(tablaViajes selectedElement) ifNotNil: [ 
		masInfo setText: (tablaViajes selectedElement) toString.
	] ifNil: [
		masInfo setText: ''.
	].
	
]

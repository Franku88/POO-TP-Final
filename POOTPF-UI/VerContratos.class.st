"
Vista que muestra los contratos de un cliente.
    Instance Variables
	botonCancelar:		<Button>
	botonCrearContrato:		<Button>
	botonModificar:		<Button>
	botonPagar:		<Button>
	masInfo:		<ScrolledText>
	tablaContratos:		<Table>
"
Class {
	#name : #VerContratos,
	#superclass : #ViewCliente,
	#instVars : [
		'tablaContratos',
		'masInfo',
		'botonPagar',
		'botonModificar',
		'botonCancelar',
		'botonCrearContrato'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #creating }
VerContratos class >> createWithSystem: unSistema cliente: unCliente [
	|clienteW|.
	clienteW := self new.
	clienteW initializeWithSystem: unSistema cliente: unCliente.
 	^clienteW.
]

{ #category : #adding }
VerContratos >> addButtons [
	"botonPagar botonModificar botonCancelar botonCrearContrato"
	botonPagar := Button label: 'Pagar' color: (tema container) extent: 80@30.
	botonModificar := Button label: 'Modificar' color: (tema container) extent: 80@30.
	botonCancelar := Button label: 'Cancelar' color: (tema container) extent: 80@30.
	botonCrearContrato := Button label: 'Crear Contrato' extent: 100@30.
	
	"Posiciono morphs"
	botonPagar top: tablaContratos bottom + 30; left: tablaContratos left.
	botonModificar top: tablaContratos bottom + 30; left: botonPagar right + 15.
	botonCancelar top: tablaContratos bottom + 30; left: botonModificar right + 15.
	botonCrearContrato top: masInfo bottom + 30; right: masInfo right.
	
	"Pagar listo"
	botonPagar mouseAction: [
		(tablaContratos selectedElement) ifNil: [ 
			self addMessage: 'Seleccione el contrato a pagar.'.	
		] ifNotNil: [
			self addMessagePagar.
		].
	].
	botonModificar mouseAction: [
		(tablaContratos selectedElement) ifNil: [ 
			self addMessage: 'Seleccione el contrato a modificar.'.	
		] ifNotNil: [
			self addMorphCentered:  (ModificarContrato createWithSystem: sistema cliente: cliente contrato: (tablaContratos selectedElement)).
		].
	].
	"Cancelar listo"
	botonCancelar mouseAction: [
		(tablaContratos selectedElement) ifNil: [ 
			self addMessage: 'Seleccione el contrato a cancelar.'.	
		] ifNotNil: [
			self addMessageCancelar.
		].
	].
	botonCrearContrato mouseAction: [
			self addMorphCentered:  (CrearContrato createWithSystem: sistema cliente: cliente).
	].
	
	"Agrego morphs"
	body addMorph: botonPagar.
	body addMorph: botonModificar.
	body addMorph: botonCancelar.
	body addMorph: botonCrearContrato.
]

{ #category : #adding }
VerContratos >> addMasInfo [
	masInfo := ScrolledText createExtent: ((body width*0.3)@(body height*0.7)) color: Color transparent title: 'Más información'.
	masInfo beReadOnly.
	masInfo ghostText: 'Seleccione un contrato en la tabla...'.
	masInfo right: (body right - 20); top: (body top + 45).
	body addMorph: masInfo.
]

{ #category : #adding }
VerContratos >> addMessageCancelar [
	"Implementado con changed puesto que la cancelacion deselecciona un elemento pero no modifca el indice de la Table"
	self addMessageConfirm: '¿Esta seguro?' actionConfirm: [:popUp |
		((tablaContratos selectedElement) esEfectivo) ifTrue:[
			self addMessage: 'No es posible cancelar el contrato seleccionado'.
		] ifFalse:[
			(cliente bajarContratoConNumero: ((tablaContratos selectedElement) numero)) ifTrue: [
				(cliente esFrecuente) ifTrue: [
					self addMessage: ('Contrato cancelado con exito.',String cr,'Se han reembolsado ',((tablaContratos selectedElement) calcularReembolso:((tablaContratos selectedElement) calcularPagado)) asString, ' Millas') extent: 200@130.
				] ifFalse: [
				self addMessage: ('Contrato cancelado con exito.',String cr,'Se han reembolsado $',((tablaContratos selectedElement) calcularReembolso:((tablaContratos selectedElement) calcularPagado)) asString) extent: 200@130.
				].
				"Como es eliminado de la tabla, entonces no queda ninguno seleccionado"
				tablaContratos selectedElement: nil.
				popUp delete.
			].
		].	
	].
]

{ #category : #adding }
VerContratos >> addMessagePagar [
	"Pago de cuotas de un contrato seleccionado en la tabla"
	((tablaContratos selectedElement) cantCuotasPagadas = (tablaContratos selectedElement) cantCuotas) 
	ifFalse:[
		self addMessageInput: '¿Cuantas cuotas desea pagar?' actionAceptar: [ :fInput :popUp|
			(fInput) ifNil: [ 
				body addMessage: 'Ingrese un valor numerico'.
			] ifNotNil: [ 
				(Helper stringIsNumeric: fInput) ifFalse:[
					self addMessage: 'Ingrese un valor numerico'.
				] ifTrue: [
					(cliente pagarCuotas: ((tablaContratos selectedElement) numero) 
					cuotasAPagar: (fInput asInteger)) 
					ifTrue:[
						self addMessage: 'Contrato abonado con exito'.
						popUp delete.
					] ifFalse: [
						self addMessage: 'Cantidad invalida o dinero insuficiente.' extent: 230@100.
					].
				].
			].
		].
	] ifTrue: [ 
		self addMessage: 'Contrato sin cuotas pendientes.'.
	].
	
]

{ #category : #adding }
VerContratos >> addTablaContratos [
	"Agrega una tabla de contratos del cliente actual"
	cliente ifNotNil: [
		tablaContratos := Table createColumns: (#(Numero Contratado Fecha Personas Cuotas Efectivo Vigente) asOrderedCollection) extent: (body width*(0.6))@(body height*(0.7)) dataSource: (DataSourceContrato createCollection: cliente colContratos object: cliente).
		tablaContratos top: body top + 45; left: body left + 20.
		tablaContratos borderColor: Color black; borderWidth: 1; allowDeselection.
		body addMorph: tablaContratos.
	].
]

{ #category : #adding }
VerContratos >> addTitulo: cad [
	super addTitulo: cad.
	titulo bottom: tablaContratos top - 10; left: tablaContratos left + 5.
]

{ #category : #strings }
VerContratos >> contratoToString [
	^self contratoToString: (tablaContratos selectedElement).
]

{ #category : #strings }
VerContratos >> contratoToString: unContrato [
	|cadena cadenaExc|.
	cadenaExc := ''.
	(unContrato colExcursiones) do: [:cadaExc|
			cadenaExc := '		',cadenaExc,cadaExc toString,String cr.
	].
	(cadenaExc = '') ifTrue: [
		cadenaExc := '		Sin excursiones',String cr.
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
	'Excursiones opcionales: ',String cr,cadenaExc,
	'Es Efectivo: ',(Helper booleanToString: unContrato esEfectivo),String cr,
	'Es Flexible: ',(Helper booleanToString: unContrato esFlexible).
	^cadena
]

{ #category : #initialization }
VerContratos >> initializeWithSystem: unSistema cliente: unCliente [
	super initializeWithSystem: unSistema cliente: unCliente.
	"Agrega Morphs"
	self addBotonBorrarVentana: 'Atras'.
	self addTablaContratos.
	self addTitulo: 'Mis contratos'.
	tablaContratos addDependent: self.
	self addMasInfo.
	self addButtons.

	

]

{ #category : #updating }
VerContratos >> update: anObject [
	super update: anObject.
	masInfo setText: ''.
	(tablaContratos selectedElement) ifNotNil: [  
		masInfo setText: (self contratoToString).
	].
	
]

{ #category : #strings }
VerContratos >> viajeToString: unViaje [
	|cadena|.
	cadena := '		Nombre: ', unViaje nombre,String cr,
	'		Costo por persona: $', unViaje costoPorPersona asString,String cr,
	'		Impuestos: $', unViaje valorImpuestos asString.
	^cadena.
]

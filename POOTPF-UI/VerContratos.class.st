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
			((tablaContratos selectedElement esEfectivo) | (tablaContratos selectedElement esVigente) not) ifTrue: [
				self addMessage: 'No es posible modificar el contrato.',String cr,'(Es Efectivo o Fecha no vigente)' extent: 210@120.
			] ifFalse: [
				self addMorphCentered:  (ModificarContrato createWithSystem: sistema cliente: cliente contrato: (tablaContratos selectedElement)).
			].
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
	|contrato|.
	contrato := tablaContratos selectedElement.
	((contrato esEfectivo) | (contrato esVigente) not) ifTrue: [
		self addMessage: 'No es posible cancelar el contrato.',String cr,'(Es Efectivo o Fecha no vigente)' extent: 210@120.
	] ifFalse: [
		self addMessageConfirm: '¿Esta seguro?' actionConfirm: [ :popUp |
			(cliente bajarContratoConNumero: (contrato numero)) ifTrue: [
				(cliente esFrecuente) ifTrue: [
					self addMessage: ('Contrato cancelado con exito.',String cr,'Se han reembolsado ',(contrato calcularReembolso: (contrato calcularPagado)) asString, ' Millas') extent: 210@120.
				] ifFalse: [
					self addMessage: ('Contrato cancelado con exito.',String cr,'Se han reembolsado $',(contrato calcularReembolso: (contrato calcularPagado)) asString) extent: 210@120.
				].
				"Como es eliminado de la tabla, entonces no queda ninguno seleccionado"
				tablaContratos selectedElement: nil.
			].	
			popUp delete.	
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
		tablaContratos := Table createColumns: (#(Numero Contratado Fecha Personas Cuotas Flexible Efectivo Vigente) asOrderedCollection) extent: (body width*(0.645))@(body height*(0.7)) dataSource: (DataSourceContrato createCollection: (cliente colContratos) object: cliente).
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

{ #category : #initialization }
VerContratos >> initializeWithSystem: unSistema cliente: unCliente [
	super initializeWithSystem: unSistema cliente: unCliente.
	"Agrega Morphs"
	self addBotonBorrarVentana: 'Atras'.
	self addTablaContratos.
	self addTitulo: 'Mis contratos'.
	self addMasInfo.
	self addButtons.
	tablaContratos addDependent: self.
	self update: tablaContratos.

	

]

{ #category : #updating }
VerContratos >> update: o [
	super update: o.
	masInfo setText: ''.
	(tablaContratos selectedElement) ifNotNil: [  
		masInfo setText: (self contratoToString).
	].

	
]

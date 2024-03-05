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
		'contratoSeleccionado',
		'masInfo',
		'botonPagar',
		'botonModificar',
		'botonCancelar',
		'botonCrearContrato'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
VerContratos class >> createWithSystem: unSistema cliente: unCliente [
	|contratosW|.
	contratosW := self new.
	contratosW initializeWithSystem: unSistema cliente: unCliente.
	^contratosW.
	
]

{ #category : #adding }
VerContratos >> addButtons [
	"botonPagar botonModificar botonCancelar botonCrearContrato"
	botonPagar := Button text: 'Pagar' color: (tema container) extent: 80@30.
	botonModificar := Button text: 'Modificar'.
	botonCancelar := Button text: 'Cancelar'.
	botonCrearContrato := Button text: 'botonCrearContrato'.
	
	"Posiciono morphs"
	botonPagar top: tablaContratos bottom + 10; left: tablaContratos left.
	
	
	"Agrego morphs"
	body addMorph: botonPagar.
]

{ #category : #adding }
VerContratos >> addMasInfo [
]

{ #category : #adding }
VerContratos >> addTablaContratos [
	"Agrega una tabla de contratos del cliente actual"
	cliente ifNotNil: [
		tablaContratos := Table createColumns: (#(Numero Contratado Fecha Personas Cuotas Efectivo) asOrderedCollection) extent: (body width*(0.6))@(body height*(0.7)) dataSource: (DataSourceContrato createCollection: cliente colContratos object: cliente).
		tablaContratos left: body left + 20; top: body top + 20.
		tablaContratos borderColor: Color black; borderWidth: 1.
		tablaContratos setClick: [:index |
			contratoSeleccionado  := tablaContratos elementAt: index.
	 	].
		body addMorph: tablaContratos.
	].
]

{ #category : #initialization }
VerContratos >> initializeWithSystem: unSistema cliente: unCliente [
	super initializeWithSystem: unSistema cliente: unCliente.
	"Agrega Morphs"
	self addBotonBorrarVentana: 'Atras'.
	self addTablaContratos.
	self addButtons.
	self addMasInfo.
	

]

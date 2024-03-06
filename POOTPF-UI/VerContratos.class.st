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

{ #category : #adding }
VerContratos >> addButtons [
	"botonPagar botonModificar botonCancelar botonCrearContrato"
	botonPagar := Button text: 'Pagar' color: (tema container) extent: 80@30.
	botonModificar := Button text: 'Modificar' color: (tema container) extent: 80@30.
	botonCancelar := Button text: 'Cancelar' color: (tema container) extent: 80@30.
	botonCrearContrato := Button text: 'Crear Contrato' extent: 100@30.
	
	"Posiciono morphs"
	botonPagar top: tablaContratos bottom + 30; left: tablaContratos left.
	botonModificar top: tablaContratos bottom + 30; left: botonPagar right + 15.
	botonCancelar top: tablaContratos bottom + 30; left: botonModificar right + 15.
	botonCrearContrato top: masInfo bottom + 30; right: masInfo right.
	
	"Funcion de botones"
	botonCrearContrato mouseAction: [

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
	masInfo right: (body right - 20); top: (body top + 20).
	body addMorph: masInfo.
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
	self addMasInfo.
	self addButtons.

	

]

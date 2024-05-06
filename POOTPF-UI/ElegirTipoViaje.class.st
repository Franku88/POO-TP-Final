"
Vista para crear viaje, muestra botones para elegir entre que tipo de viaje se desea crear.
<Instance Variables>
botonCrearEspecial: 	<Button>
botonCrearOrganizado: 	<Button>	

"
Class {
	#name : #ElegirTipoViaje,
	#superclass : #Ventana,
	#instVars : [
		'botonCrearEspecial',
		'botonCrearOrganizado'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
ElegirTipoViaje >> addButtons [
	botonCrearEspecial := Button label: 'Viaje Especial' extent: 100@30.
	botonCrearOrganizado := Button label: 'Viaje Organizado' extent: 110@30.	
		
	botonCrearEspecial mouseAction: [  
			self addMorphCentered: (CrearViajeEspecial createWithSystem: sistema).
		]; center: contenedor center; top: contenedor top + 60.	
		
	botonCrearOrganizado mouseAction: [  
			self addMorphCentered: (CrearViajeOrganizado createWithSystem: sistema).
		]; center: contenedor center; bottom: contenedor bottom - 60.
	
	self addMorph: botonCrearEspecial.
	self addMorph: botonCrearOrganizado.
]

{ #category : #initialization }
ElegirTipoViaje >> initializeWithSystem: sis [
	super initializeWithSystem: sis.
	self addBotonBorrarVentana: 'Volver'.
	self addContenedor: 200@250.
	self addTitulo: 'Seleccione el tipo de viaje a crear'.
	titulo top: body top + 50.
	self addButtons.
]

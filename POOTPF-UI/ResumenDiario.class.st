"
Visualiza resumen diario del sistema.

Instance Variables
resumenDiario:		<ScrolledText>
botonResumen: 	<Button>
"
Class {
	#name : #ResumenDiario,
	#superclass : #Ventana,
	#instVars : [
		'resumenDiario',
		'botonResumen'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
ResumenDiario >> addBotonEjecutarResumen [
	botonResumen := Button label: 'Ejecutar resumen' color: tema container extent: 120@40.
	botonResumen center: header center.
	botonResumen mouseAction: [
			sistema inicioDelDia.
		].
	header addMorph: botonResumen.
]

{ #category : #adding }
ResumenDiario >> addResumenDiario [
	resumenDiario := ScrolledText createExtent: 700@450 color: (tema container) title: 'Inicio del dia'.
	
	resumenDiario setText: (sistema inicioDia).
	
	resumenDiario center: body center.
	
	body addMorph: resumenDiario.
	
]

{ #category : #initialization }
ResumenDiario >> initializeWithSystem: sis [
	super initializeWithSystem: sis.
	self addBotonBorrarVentana: 'Volver'.
	self addResumenDiario.
	self addBotonEjecutarResumen.
	sistema addDependent: self.
	self update: sistema
	
]

{ #category : #updating }
ResumenDiario >> update: o [
	resumenDiario setText: (sistema inicioDia)
	
]

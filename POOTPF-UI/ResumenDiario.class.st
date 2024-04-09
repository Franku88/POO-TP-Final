"
Visualiza resumen diario del sistema.

Instance Variables
resumenDiario:		<ScrolledText>
"
Class {
	#name : #ResumenDiario,
	#superclass : #Ventana,
	#instVars : [
		'resumenDiario'
	],
	#category : #'POOTPF-UI-Views'
}

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
]

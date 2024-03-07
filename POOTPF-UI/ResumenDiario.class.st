"
Visualiza resumen diario del sistema.
    Instance Variables
	resumen:		<ScrolledText>
"
Class {
	#name : #ResumenDiario,
	#superclass : #Ventana,
	#instVars : [
		'resumen'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
ResumenDiario >> initializeWithSystem: sis [
	super initializeWithSystem: sis.
	self addBotonBorrarVentana: 'Volver'.

]

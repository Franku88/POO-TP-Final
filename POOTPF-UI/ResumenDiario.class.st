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
ResumenDiario >> initialize [ 
super initialize .
self addContenedor: 200@200.
self addBotonBorrarVentana: 'Volver'.

]

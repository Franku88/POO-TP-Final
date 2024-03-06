Class {
	#name : #ResumenDiario,
	#superclass : #Ventana,
	#category : #'POOTPF-UI-Views'
}

{ #category : #initialization }
ResumenDiario >> initialize [ 
super initialize .
self addContenedor: 200@200.
self addBotonAtras: 'Volver'.

]

"
Vistas que usaran/mostraran datos de un viaje
    Instance Variables
	viaje:		<Viaje>
"
Class {
	#name : #ViewViaje,
	#superclass : #Ventana,
	#instVars : [
		'viaje',
		'masInfo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #creating }
ViewViaje class >> createWithSystem: unSistema viaje: unViaje [
	|crearViewViajeW|.
	crearViewViajeW := self new.
	crearViewViajeW initializeWithSystem: unSistema viaje: unViaje.
 	^crearViewViajeW.
]

{ #category : #adding }
ViewViaje >> addMasInfo [
	masInfo := ScrolledText createExtent: ((body width*0.35)@(body height*0.8)) color: Color transparent title: 'Viaje'.
	masInfo beReadOnly.
	masInfo ghostText: 'Viaje no seleccionado'.
	masInfo right: (body right - 20); top: (body top + 45).
	body addMorph: masInfo.
]

{ #category : #initialization }
ViewViaje >> initializeWithSystem: unSistema viaje: unViaje [
	self initializeWithSystem: unSistema .	
	viaje := unViaje.
	self addMasInfo.
	
	viaje addDependent: self.
	self update: viaje.

]

{ #category : #updating }
ViewViaje >> update: o [
	(masInfo) ifNotNil: [  
		masInfo setText: (viaje toString).
	] ifNil: [
		masInfo setText: ''.
	].
]

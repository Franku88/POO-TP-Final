"
Un input que permite seleccionar un numero entero mediante botones para aumentar y disminuir.

    Instance Variables
	botonDec:		<Button>
	botonInc:		<Button>
	option:		<Entero>
	optionMorph: 	<Morph>
"
Class {
	#name : #MenuSelectInt,
	#superclass : #Morph,
	#instVars : [
		'botonInc',
		'botonDec',
		'option',
		'optionMorph',
		'min',
		'max'
	],
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
MenuSelectInt class >> createBetween: unNum and: otroNum [
	|men|.
	men := self new.
	men initializeBetween: unNum and: otroNum.
	^men.
	
]

{ #category : #accessing }
MenuSelectInt >> getValor [
	^option valor.
]

{ #category : #initialization }
MenuSelectInt >> initializeBetween: unNum and: otroNum [
	self initialize.
	self borderColor: Color black; color: Color lightGray; borderWidth: 1; extent: 21@21.
	self min: unNum max: otroNum.
	"En lugar de unNum estaba 1, reemplazo realizado para que cominece con el minimo"
	option := Entero create: unNum.
	
	botonDec := Button label: '<' extent: 21@21.
	botonInc := Button label: '>' extent: 21@21.
	
	botonDec right: self left.
	botonInc left: self right.
	
	self addMorph: botonDec.
	self addMorph: botonInc.
	
	botonDec mouseAction: [ 
		self setValor: (self getValor - 1).
	].
	botonInc mouseAction: [
		self setValor: (self getValor + 1).
	].

	option addDependent: self.
	self update: option.

]

{ #category : #accessing }
MenuSelectInt >> min: unNum max: otroNum [
	"Debe ser invocado antes de que funcione"
	min := unNum.
	max := otroNum.
	
]

{ #category : #accessing }
MenuSelectInt >> setValor: num [
	(num between: min and: max) ifTrue: [
		option valor: num.	
	].
]

{ #category : #updating }
MenuSelectInt >> update: opt [
	(optionMorph) ifNil:[
		optionMorph := opt valor asMorph.
		self addMorphCentered: optionMorph.
	] ifNotNil: [
		optionMorph delete.
		optionMorph := opt valor asMorph.
		self addMorphCentered: optionMorph.
	].
]

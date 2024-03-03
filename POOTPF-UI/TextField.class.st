"
Implementacion de RubTextFieldMorph con mensajes simplificadores (estilos).
"
Class {
	#name : #TextField,
	#superclass : #RubTextFieldMorph,
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
TextField class >> createExtent: tam [
	|txtField|.
	txtField := self new.
	txtField extent: tam.
	txtField borderWidth: 1.
	^ txtField.
]

{ #category : #creating }
TextField class >> createExtent: tam color: aColor [
	|txtField|.
	txtField := self new.
	txtField extent: tam.
	txtField borderWidth: 1.
	txtField color: aColor.
	^txtField.

]

{ #category : #creating }
TextField class >> createExtent: tam color: aColor borderColor: otherColor [
	|txtField|.
	txtField := self new.
	txtField extent: tam.
	txtField borderWidth: 1.
	txtField color: aColor.
	txtField borderColor: otherColor.
	^txtField.

]

{ #category : #creating }
TextField class >> createExtent: tam ghostText: text [
	|txtField|.
	txtField := self new.
	txtField extent: tam.
	txtField borderWidth: 1.
	txtField borderColor: Color black.
   txtField ghostText: text.
	^ txtField. 

]

{ #category : #creating }
TextField class >> createTransparentExtent: tam [ 
	|txtField|.
	txtField := self new.
	txtField extent: tam.
	txtField borderWidth: 1.
	txtField color: Color transparent.
	^ txtField.

]

{ #category : #creating }
TextField class >> createTransparentExtent: tam borderColor: aColor [
	|txtField|.
	txtField := self new.
	txtField extent: tam.
	txtField borderWidth: 1.
	txtField color: Color transparent.
	txtField borderColor: aColor. 
	^ txtField.

]

{ #category : #creating }
TextField class >> createTransparentExtent: tam ghostText: text [ 
	|txtField|.
	txtField := self new.
	txtField extent: tam.
	txtField borderWidth: 1.
	txtField color: Color transparent. 
	txtField ghostText: text.
	^ txtField.
]

{ #category : #accessing }
TextField >> clear [ 
	self setText: ''.
]

{ #category : #accessing }
TextField >> input [
	^ self text asString. 
]

{ #category : #testing }
TextField >> isEmpty [ 
	^ self text asString = ''.
]

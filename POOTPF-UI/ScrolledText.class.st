"
Clase que permite crear un RubScrolledTextMorph de dado tamanio y color (con borde curvo).
"
Class {
	#name : #ScrolledText,
	#superclass : #RubScrolledTextMorph,
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
ScrolledText class >> createRoundedSized: aSize color: col [
	"Crea un campo de texto scrolleable (con barras de desplazamiento vertical/horizontal) de tamanio y color 	dados"
	|sText|.
	sText := self new.
	sText extent: aSize. 
	sText color: col.
	sText borderStyle: (Helper getBorderStyle: col width: 2).
	^sText.
]

"
Boton que ejecuta un bloque al presionarlo. Personalizable en color, tamanio y fuente.

Instance Variables
bloque:		<BlockClosure>
"
Class {
	#name : #Button,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloque'
	],
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
Button class >> text: nombre color: col extent: dim [  
^ (self new) label: nombre ;  color: col; extent: dim
]

{ #category : #creating }
Button class >> text: nombre extent: dim [  
	"Crea boton de color predeterminado (gris claro)"
	^ (self new) label: nombre; color: Color lightGray; extent: dim.
]

{ #category : #initialization }
Button >> initializeLabel: nombre color: col extent: dim [
	"Inicializa un boton con etiqueta, color y tamanio dados"
	self initialize.
	self label: nombre.
	self extent: dim.
	self color: col.
]

{ #category : #initialization }
Button >> initializeLabel: nombre color: col extent: dim font: fuen [
	"Inicializa un boton con etiqueta, color, tamanio y fuente dados"
	self initialize.
	self label: nombre font: fuen.
	self extent: dim.
	self color: col.

]

{ #category : #'event handling' }
Button >> mouseAction: bloq [ 
bloque := bloq.
]

{ #category : #'event handling' }
Button >> mouseUp: event [ 
super mouseUp: event.
bloque value.
]

{ #category : #'border-styles' }
Button >> rounded [
	self borderStyle: (RoundedBorder new cornerRadius: 5; width: 2; color: self color) 

]

{ #category : #'border-styles' }
Button >> rounded: unColor [
	self borderStyle: (RoundedBorder new cornerRadius: 5; width: 2; color: unColor) 

]

{ #category : #'border-styles' }
Button >> rounded: unColor width: w [
	self borderStyle: (RoundedBorder new cornerRadius: 5; width: w; color: unColor)  

]

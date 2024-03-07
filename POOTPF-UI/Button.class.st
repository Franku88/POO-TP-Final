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

{ #category : #accessing }
Button class >> label: nombre [
	"Crea boton de color y tamanio predeterminado (gris claro)"
	^ (self new) label: nombre; color: Color lightGray; extent: 80@30.
]

{ #category : #creating }
Button class >> label: nombre color: col extent: dim [  
^ (self new) label: nombre ;  color: col; extent: dim
]

{ #category : #creating }
Button class >> label: nombre extent: dim [  
	"Crea boton de color predeterminado (gris claro)"
	^ (self new) label: nombre; color: Color lightGray; extent: dim.
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

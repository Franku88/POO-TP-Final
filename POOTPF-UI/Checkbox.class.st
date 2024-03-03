"
Clase que simplifica la creacion de un Checkbox con su respectiva etiqueta y tamanio

Instance Variables
label:		<String>
"
Class {
	#name : #Checkbox,
	#superclass : #CheckboxButtonMorph,
	#instVars : [
		'label'
	],
	#category : #'POOTPF-UI-Components'
}

{ #category : #'accessing - dynamic' }
Checkbox class >> createLabel: nom extent: tam [
	"Crea un checkbox con etiqueta y tamanio/posicion ingresados"
	|chkbx|.
	chkbx := self new.
	chkbx initialize.
	chkbx label: nom.
	chkbx extent: tam.
	^chkbx.
]

{ #category : #accessing }
Checkbox >> label [
	^label.
]

{ #category : #accessing }
Checkbox >> label: nom [
	label := nom.
]

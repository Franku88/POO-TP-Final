Class {
	#name : #ModelBiblioteca,
	#superclass : #ModelTableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
ModelBiblioteca >> getString: elem at: columnId [
	(columnId match: 'id') ifTrue: [ ^ elem identificador  ].
	(columnId match: 'nombre') ifTrue:[^ elem nombre ]. 
	(columnId match: 'dirección') ifTrue:[^ elem direccion ]. 
	(columnId match: 'teléfono') ifTrue:[^ elem telefono]. 
	(columnId match: 'representante') ifTrue: [^ elem representante]. 
	^ '...'
]

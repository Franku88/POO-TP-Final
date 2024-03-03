Class {
	#name : #ModelLibro,
	#superclass : #ModelTableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
ModelLibro >> getString: elem at: columnId [
	(columnId match: 'Nombre') ifTrue:[^ (elem nombre) asMorph ]. 
	(columnId match: 'Editorial') ifTrue:[^ elem editorial   ]. 
	(columnId match: 'Año') ifTrue:[^ (elem añoEdicion) asString]. 
	(columnId match: 'Autores') ifTrue: [^ elem nombreAutores ]. 
	(columnId match: 'Tipo y Estado') ifTrue: [
		elem esPrestado ifTrue: [^'Prestado' asMorph color: Color red] ifFalse: [^ 'Disponible' asMorph  color: (Color fromString: '81FE4C')]
		].
	^ '...'
]

{ #category : #accessing }
ModelLibro >> iconFor: elemento at: column [
(column match: 'Tipo y Estado') ifTrue: [ 
		elemento esAudiolibro 
		ifTrue: [^ Helper audiolibroIcon ] 
		ifFalse: [^ Helper libroIcon ]
		
	 ].
^ nil.
]

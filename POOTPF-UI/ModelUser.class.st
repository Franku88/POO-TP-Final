Class {
	#name : #ModelUser,
	#superclass : #ModelTableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
ModelUser >> getString: elem at: columnId [
(columnId match:  'Nombre')	ifTrue: [ ^elem nombre ].
(columnId match: 'Apellido')	ifTrue: [ ^elem apellido ].
(columnId match:  'DNI')		ifTrue: [ ^elem dni ].
	^ '...'
]

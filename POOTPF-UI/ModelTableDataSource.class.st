"
Implementacion de FTSimpleDataSource
"
Class {
	#name : #ModelTableDataSource,
	#superclass : #FTSimpleDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
ModelTableDataSource class >> aCollection: aCollection [
	|dSource|.
	dSource := self new.
	dSource initializeWith: aCollection.
	^ dSource.
]

{ #category : #creating }
ModelTableDataSource class >> aObject: obj withCollection: aCollection [
	|dSource|.
	dSource := self new.
	dSource initializeWith: obj collection: aCollection.
	^ dSource. 
]

{ #category : #accessing }
ModelTableDataSource >> cellColumn: columnIndex row: rowIndex [
	|icon celda elem| 
	elem := self elementAt: rowIndex.
	celda := FTCellMorph new addMorph: (self getString: elem at: columnIndex id) asMorph.
	icon := self iconFor: elem at: columnIndex id. 
	icon ifNotNil: [ 
		celda addMorph: icon asMorph
	].
	^celda
]

{ #category : #accessing }
ModelTableDataSource >> getString: elem at: column [
	^ '...'
]

{ #category : #accessing }
ModelTableDataSource >> iconFor: elem at: column [
	^ nil.
]

{ #category : #initialization }
ModelTableDataSource >> initializeWith: col [
	self initialize.
	elements := col. 
	col addDependent: self
]

{ #category : #initialization }
ModelTableDataSource >> initializeWith: obj collection: col [
	self initialize.
	elements := col.
	obj addDependent: self
]

{ #category : #accessing }
ModelTableDataSource >> numberOfRows [ 
	^elements size.
]

{ #category : #accessing }
ModelTableDataSource >> update: o [
	self changed: #refresh
]

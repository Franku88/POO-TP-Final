"
Implementacion de FTSimpleDataSource
"
Class {
	#name : #TableDataSource,
	#superclass : #FTSimpleDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
TableDataSource class >> createCollection: aCollection [
	"Crea DataSource dependiente de aCollection"
	|aDataSource|.
	aDataSource := self new.
	aDataSource initializeWithCollection: aCollection.
	^aDataSource.
]

{ #category : #creating }
TableDataSource class >> createCollection: aCollection object: anObj [
	"Crea DataSource dependiente de anObj (anObj tiene aCollection)"
	"Este constructor es usado ya que no se puede asegurar que los dependientes de anObj se actualicen 	al modificar la aCollection"
	|aDataSource|.
	aDataSource := self new.
	aDataSource initializeWithCollection: aCollection withObject: anObj.
	^ aDataSource. 
]

{ #category : #accessing }
TableDataSource >> cellColumn: columnIndex row: rowIndex [
	|celda elem| 
	elem := self elementAt: rowIndex.
	celda := FTCellMorph new addMorph: (self getString: elem at: columnIndex id) asMorph.
	^celda.
]

{ #category : #accessing }
TableDataSource >> getString: elem at: column [
	^ '...'
]

{ #category : #initialization }
TableDataSource >> initializeWithCollection: aCollection [
	"Dependiente de aCollection/elements"
	self initialize.
	elements := aCollection. 
	elements addDependent: self.
	self update: elements.
]

{ #category : #initialization }
TableDataSource >> initializeWithCollection: aCollection withObject: anObject [
	"Dependiente de unObjeto (el que tiene a col)"
	self initialize.
	elements := aCollection.
	anObject addDependent: self.
	self update: anObject.
]

{ #category : #accessing }
TableDataSource >> numberOfRows [ 
	^elements size.
]

{ #category : #updating }
TableDataSource >> update: o [
	self changed: #refresh.
]

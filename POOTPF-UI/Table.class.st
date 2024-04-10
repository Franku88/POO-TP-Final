"
Instance Variables
selectedElement: 	<Object>
highlightedElement: <Object>
clickBlock:		<BlockClosure>

"
Class {
	#name : #Table,
	#superclass : #FTTableMorph,
	#instVars : [
		'highlightedElement',
		'selectedElement',
		'clickBlock'
	],
	#category : #'POOTPF-UI-Components'
}

{ #category : #creating }
Table class >> createColumns: columns extent: size dataSource: aDataSource [
	"Crea una tabla con columnas nombradas por la coleccion 'columns', de tamanio 'size' y con un 	DataSource dado"
	|unaTabla|.
	unaTabla := self new.
	unaTabla initializeColumns: columns dataSource: aDataSource; extent: size.
	^unaTabla.
]

{ #category : #accessing }
Table >> elementAt: index [
	^(self dataSource) elementAt: index
]

{ #category : #accessing }
Table >> highlightedElement [
	^ highlightedElement.
]

{ #category : #accessing }
Table >> highlightedElement: elem [
	highlightedElement := elem.
	self changed: highlightedElement.
	"self refresh."
]

{ #category : #initialization }
Table >> initializeColumns: colColumns dataSource: aDataSource [
	self initialize.
	"Agrega etiquetas de columnas"
	colColumns do: [:name | 
		self addColumn: (FTColumn id: name)
	].
	self dataSource: aDataSource; intercellSpacing: 0.5; beResizable; vResizing: #spaceFill; hResizing: #spaceFill; onAnnouncement: FTSelectionChanged do: [ :ann | 
		self setHighlightedElement.
		self setSelectedElement.
		clickBlock value: self selectedElement.
	].
	clickBlock := [:e| nil].
	
	"Agrega tabla actual como dependiente del modelo/dataSoruce"
	dataSource addDependent: self.
	self update: dataSource.

]

{ #category : #accessing }
Table >> selectedElement [
	^ selectedElement.
]

{ #category : #accessing }
Table >> selectedElement: elem [
	selectedElement := elem.
	self changed: selectedElement.
	"self refresh."
]

{ #category : #initialization }
Table >> setClick: unBloque [
	clickBlock := unBloque.
	self changed.
]

{ #category : #initialization }
Table >> setHighlightedElement [
	(self highlightedIndex > 0) ifTrue: [ 
		self highlightedElement: (self elementAt: self highlightedIndex).
	] ifFalse: [
		self highlightedElement: nil.
	].
]

{ #category : #initialization }
Table >> setSelectedElement [
	(self selectedIndex > 0) ifTrue: [ 
		self selectedElement: (self elementAt: self selectedIndex).
	] ifFalse: [
		self selectedElement: nil.
	].
]

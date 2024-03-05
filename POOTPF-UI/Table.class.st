"
Instance Variables
clickBlock:		<BlockClosure>
doubleClickBlock:		<BlockClosure>
"
Class {
	#name : #Table,
	#superclass : #FTTableMorph,
	#instVars : [
		'clickBlock',
		'doubleClickBlock'
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

{ #category : #initialization }
Table >> initializeColumns: colColumns dataSource: aDataSource [
	self initialize.
	colColumns do: [:name | 
		self addColumn: (FTColumn id: name)
	].
	self intercellSpacing: 1; beResizable; vResizing: #spaceFill; hResizing: #spaceFill;
	onAnnouncement: FTStrongSelectionChanged do: [ :ann | 
		doubleClickBlock value: self selectedIndex 
	];
	onAnnouncement: FTSelectionChanged do: [ :ann | 
		clickBlock value: self selectedIndex 
	];
	dataSource: aDataSource.
	"Agrega tabla actual como dependiente del modelo/dataSoruce"
	aDataSource addDependent: self.
	"No hacen nada predeterminadamente"
	doubleClickBlock := [:e | nil]. 	
	clickBlock := [:e | nil].

]

{ #category : #initialization }
Table >> setClick: block [
	clickBlock := block.
]

{ #category : #initialization }
Table >> setDoubleClick: block [
	doubleClickBlock := block.
]

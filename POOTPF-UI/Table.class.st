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

{ #category : #accessing }
Table >> elementAt: index [
	^ self dataSource elementAt: index
]

{ #category : #'border-styles' }
Table >> headerColor: aColor [ 
	headerColor := aColor. 
]

{ #category : #initialization }
Table >> initializeColumns: colColumns model: model [
	self initialize.
	colColumns do: [:name | 
		self addColumn: (FTColumn id: name)
	].
	
	self intercellSpacing: 1; 
	beResizable; 
	vResizing: #spaceFill; 
	hResizing: #spaceFill;
	onAnnouncement: FTStrongSelectionChanged do: [ :ann | 
		doubleClickBlock value: self selectedIndex 
	];
	onAnnouncement: FTSelectionChanged do: [ :ann | 
		clickBlock value: self selectedIndex 
	];
	dataSource: model.
	
	"Agrega tabla actual como dependiente del modelo"
	model addDependent: self.
	"No hacen nada predeterminadamente"
	doubleClickBlock := [:e | nil]. 	
	clickBlock := [:e | nil].

]

{ #category : #'border-styles' }
Table >> rounded [
	"Aplica bordes curvos a la tabla"
	container borderStyle: (Helper getBorderStyle: Color lightBlue)
]

{ #category : #'border-styles' }
Table >> roundedColor: aColor [
	"Aplica bordes curvos a la tabla con un color dado"
	container borderStyle: (Helper getBorderStyle: aColor).
]

{ #category : #initialization }
Table >> setClick: block [
	clickBlock := block.
]

{ #category : #initialization }
Table >> setDoubleClick: block [
	doubleClickBlock := block.
]

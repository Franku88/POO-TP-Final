Class {
	#name : #DataSourceExcursionOpcional,
	#superclass : #TableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
DataSourceExcursionOpcional >> getString: unaExc at: columnId [
	"viaje fechaProxVencimiento colExcursiones cantCuotasPagadas (no agregadas a la tabla)"
	(columnId match: 'Descripcion') ifTrue: [^ unaExc descripcion].
	(columnId match: 'Costo por persona') ifTrue:[^ '$',((unaExc costoPorPersona) asString)]. 
	^ '...'
]

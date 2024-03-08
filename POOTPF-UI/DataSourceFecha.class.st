"
Implementacion de TableDataSource para Fechas
"
Class {
	#name : #DataSourceFecha,
	#superclass : #TableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
DataSourceFecha >> getString: unaFecha at: columnId [
	"viaje fechaProxVencimiento colExcursiones cantCuotasPagadas (no agregadas a la tabla)"
	(columnId match: 'Fecha') ifTrue: [^ (unaFecha fecha) ddmmyyyy].
	(columnId match: 'Cupo') ifTrue:[^ (unaFecha cupo) asString]. 
	^ '...'
]

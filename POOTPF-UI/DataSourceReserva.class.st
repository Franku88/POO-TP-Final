"
Implementacion de TableDataSource para Reservas
"
Class {
	#name : #DataSourceReserva,
	#superclass : #TableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
DataSourceReserva >> getString: unaReserva at: columnId [
	"viaje fechaProxVencimiento colExcursiones cantCuotasPagadas (no agregadas a la tabla)"
	(columnId match: 'Descripcion') ifTrue: [^ unaReserva excursionOpcional descripcion].
	(columnId match: 'Costo por persona') ifTrue:[^ '$',((unaReserva excursionOpcional costoPorPersona) asString)].
	(columnId match: 'Personas') ifTrue:[^ ((unaReserva cantPersonas) asString)].
	^ '...'
]

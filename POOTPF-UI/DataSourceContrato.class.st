"
Implementacion de TableDataSource para Contratos
"
Class {
	#name : #DataSourceContrato,
	#superclass : #TableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
DataSourceContrato >> getString: unContrato at: columnId [
	"viaje fechaProxVencimiento colExcursiones cantCuotasPagadas (no agregadas a la tabla)"
	(columnId match: 'Numero') ifTrue: [^ (unContrato numero) asString].
	(columnId match: 'Contratado') ifTrue:[^ (unContrato fechaContrato) ddmmyyyy]. 
	(columnId match: 'Fecha') ifTrue:[^ (unContrato fechaSeleccionada) ddmmyyyy]. 
	(columnId match: 'Personas') ifTrue:[^ (unContrato cantPersonas) asString]. 
	(columnId match: 'Cuotas') ifTrue: [^ (unContrato cantCuotas) asString].
	(columnId match: 'Efectivo') ifTrue: [^ (unContrato esEfectivoString)]. 
	^ '...'

]

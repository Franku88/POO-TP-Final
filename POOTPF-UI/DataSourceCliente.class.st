Class {
	#name : #DataSourceCliente,
	#superclass : #TableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
DataSourceCliente >> getString: unCliente at: columnId [
	"viaje fechaProxVencimiento colExcursiones cantCuotasPagadas (no agregadas a la tabla)"
	(columnId match: 'DNI') ifTrue: [^ (unCliente dni) asString].
	(columnId match: 'Apellido') ifTrue:[^ (unCliente apellido) ]. 
	(columnId match: 'Ciudad') ifTrue:[^ (unCliente ciudad) ]. 
	(columnId match: 'Frecuente') ifTrue:[^ (unCliente esFrecuente)]. 
	(columnId match: 'Millas') ifTrue: [^ (unCliente millas) asString].
	(columnId match: 'Dinero') ifTrue: [^ (unCliente dinero)asString]. 
	^ '...'
]

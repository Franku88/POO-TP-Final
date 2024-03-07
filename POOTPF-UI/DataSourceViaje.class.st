"
Implementacion de TableDataSource para Viajes.
"
Class {
	#name : #DataSourceViaje,
	#superclass : #TableDataSource,
	#category : #'POOTPF-UI-Components'
}

{ #category : #accessing }
DataSourceViaje >> getString: unViaje at: columnId [
	"viaje fechaProxVencimiento colExcursiones cantCuotasPagadas (no agregadas a la tabla)"
	(columnId match: 'Nombre') ifTrue: [^ (unViaje numero) asString].
	(columnId match: 'Costo por Persona') ifTrue:[^ (unViaje fechaContrato) ddmmyyyy]. 
	(columnId match: 'Impuestos') ifTrue:[^ (unViaje fechaSeleccionada) ddmmyyyy]. 
	^ '...'.
	"ViajeEspecial: ciudad, fechaSalida (rel), fechaRegreso
	ViajeOrganizado: colFechasSalida (rel), cantDias, colEtapas (rel)
	FechaSalida: fecha, cupo"

]

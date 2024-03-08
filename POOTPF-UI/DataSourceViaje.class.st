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
	(columnId match: 'Nombre') ifTrue: [^ (unViaje nombre) asString].
	(columnId match: 'Costo por Persona') ifTrue:[^ (unViaje costoPorPersona asFloat truncateTo: 0.01) asString]. 
	(columnId match: 'Impuestos') ifTrue:[^ (unViaje valorImpuestos asFloat truncateTo: 0.01) asString]. 
	^ '...'.
	"ViajeEspecial: ciudad, fechaSalida (rel), fechaRegreso
	ViajeOrganizado: colFechasSalida (rel), cantDias, colEtapas (rel)
	FechaSalida: fecha, cupo"

]

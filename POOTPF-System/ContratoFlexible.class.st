"
Se diferencia de Contrato por su comportamiento
"
Class {
	#name : #ContratoFlexible,
	#superclass : #Contrato,
	#category : #'POOTPF-System'
}

{ #category : #verifying }
ContratoFlexible >> esFlexible [
	^true.
]

{ #category : #updating }
ContratoFlexible >> modificarFechaSeleccionada: unaFecha [
	"Cambia fechaSeleccionada por unaFecha si el viaje contratado tiene unaFecha disponible"
	|exito|.
	exito := fechaSeleccionada ~= unaFecha.
	(exito) ifTrue: [  
			exito := viaje tieneFecha: unaFecha.
			(exito) ifTrue: [  
					fechaSeleccionada := unaFecha.
				].
		].
	^exito.
]

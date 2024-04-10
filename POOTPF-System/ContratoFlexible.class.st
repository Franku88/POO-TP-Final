"
Se diferencia de Contrato por su comportamiento
"
Class {
	#name : #ContratoFlexible,
	#superclass : #Contrato,
	#category : #'POOTPF-System-System'
}

{ #category : #calculating }
ContratoFlexible >> calcularPlusFecha: unaFecha [
	"Date unaFecha"
	|unPlus|.
	unPlus := viaje calcularPlusFecha: unaFecha personas: (self cantPersonas).
	^unPlus.
]

{ #category : #verifying }
ContratoFlexible >> esFlexible [
	^true.
]

{ #category : #updating }
ContratoFlexible >> modificarFechaSeleccionada: unaFecha [
	"Cambia fechaSeleccionada por unaFecha si el viaje contratado tiene unaFecha disponible"
	|exito|.
	exito := (self fechaSeleccionada) ~= unaFecha.
	(exito) ifTrue: [  
			exito := viaje tieneFecha: unaFecha.
			(exito) ifTrue: [ 
				exito := viaje ocupar: unaFecha personas: cantPersonas.
					(exito) ifTrue: [
							viaje desocupar: (self fechaSeleccionada) personas: cantPersonas.
							self fechaSeleccionada: unaFecha.	
						]. 
				].
		].
	^exito.
]

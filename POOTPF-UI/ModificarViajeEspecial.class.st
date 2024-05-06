"
Vista que muestra menu de modificacion de viaje especial

botonCambiarRegreso:	<Button> 
botonCambiarCupo:		<Button>
"
Class {
	#name : #ModificarViajeEspecial,
	#superclass : #ViewViaje,
	#instVars : [
		'botonCambiarRegreso',
		'botonCambiarCupo'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
ModificarViajeEspecial >> addBotonCambiarCupo [
	botonCambiarCupo := Button label: 'Cambiar cupo'  extent: 155@30.
	botonCambiarCupo left: body left + 150; bottom: body bottom - 150.	
	
	botonCambiarCupo mouseAction: [ 
		self addMessageInput: ('Ingrese nuevo cupo') 
		actionAceptar: [:input :popup|
				((input = '') | (Helper stringIsNumeric: input) not) ifFalse: [
					((input asNumber) >= 0) ifTrue: [ 
							(viaje cambiarCupo: (viaje fechaSalida) cupo: (input asNumber)) ifTrue: [  
									self addMessage: 'Cupo modificado con exito.'.
									popup delete.
								] ifFalse: [
									self addMessage: 'Hubo un error al modificar cupo. (fecha no encontrada)'.
								].
						] ifFalse: [  
							self addMessage: 'Ingrese un numero entero postivo.'.
						].
				] ifTrue: [
					self addMessage: 'Ingrese un numero entero.'.
				].
			] extent: 200@150.	
	].
	
	body addMorph: botonCambiarCupo.
]

{ #category : #adding }
ModificarViajeEspecial >> addBotonCambiarRegreso [
	botonCambiarRegreso := Button label: 'Cambiar fecha de regreso'  extent: 155@30.
	botonCambiarRegreso left: body left + 150; top: body top + 150.	
	
	botonCambiarRegreso mouseAction: [ 
		self addMessageInput: ('Ingrese nueva fecha de regreso',String cr,'		(mm-dd-aaaa)') 
		actionAceptar: [:input :popup|
				|unaFecha|.
				((input = '') | (Helper stringMMDDAAAA: input) not) ifFalse: [
					unaFecha := (Date fromString: input).
					(unaFecha  > (viaje fechaSalida fecha)) ifTrue: [
						(viaje cambiarFechaRegreso: unaFecha) ifTrue: [
								self addMessage: 'Fecha modificada con exito.'.		
							] ifFalse: [
								self addMessage: 'Fecha ingresada invalida (Regreso antes que Salida)'.
							].
						popup delete.
					] ifFalse: [  
						self addMessage: 'Fecha ingresada invalida (Regreso antes que Salida)'.
					].
				] ifTrue: [
					self addMessage: 'Ingrese una fecha en el formato indicado' extent: 230@100.				
				].
			] extent: 200@150.
	].
	
	body addMorph: botonCambiarRegreso.
]

{ #category : #adding }
ModificarViajeEspecial >> addButtons [
	self addBotonCambiarRegreso.
	self addBotonCambiarCupo.
]

{ #category : #initialization }
ModificarViajeEspecial >> initializeWithSystem: unSistema viaje: unViaje [
	super initializeWithSystem: unSistema viaje: unViaje.
	self addTitulo: 'Modificar Viaje Especial'.
	self addBotonBorrarVentana: 'Atras'.
	self addButtons.
]

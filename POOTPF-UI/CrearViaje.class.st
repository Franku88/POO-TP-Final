"
Interfaz para vistas de CrearViaje 
    Instance Variables
	campoCostoPP:		<TextField>
	campoImpuestos:		<TextField>
	campoNombre:		<TextField>

"
Class {
	#name : #CrearViaje,
	#superclass : #Ventana,
	#instVars : [
		'campoNombre',
		'campoCostoPP',
		'campoImpuestos',
		'botonCrearViaje'
	],
	#category : #'POOTPF-UI-Views'
}

{ #category : #adding }
CrearViaje >> addCampoCostoPP [
	|label|.
	campoCostoPP := TextField createTransparentExtent: 120@30 ghostText: 'ej: 5000'.
	campoCostoPP borderWidth: 1; borderColor: Color black.
	label := 'Costo por Persona' asMorph.
	
	campoCostoPP center: contenedor center - (0@93).
	label center: campoCostoPP center - (0@20).
	
	contenedor addMorph: campoCostoPP.
	contenedor addMorph: label.
	
]

{ #category : #adding }
CrearViaje >> addCampoImpuestos [
	|label|.
	campoImpuestos := TextField createTransparentExtent: 120@30 ghostText: 'ej: 1500'.
	campoImpuestos borderWidth: 1; borderColor: Color black.
	label := 'Impuestos' asMorph.
	
	campoImpuestos center: contenedor center - (0@31).
	label center: campoImpuestos center - (0@20).
	
	contenedor addMorph: campoImpuestos.
	contenedor addMorph: label.
]

{ #category : #adding }
CrearViaje >> addCampoNombre [
	|label|.
	campoNombre := TextField createTransparentExtent: 200@30 ghostText: 'ej: Viaje a Cordoba'.
	campoNombre borderWidth: 1; borderColor: Color black.
	label := 'Nombre' asMorph.
	
	campoNombre center: contenedor center - (0@155).
	label center: campoNombre center - (0@20).
	
	contenedor addMorph: campoNombre.
	contenedor addMorph: label.
]

"
Programa principal, ejecuta el trabajo.
"
Class {
	#name : #Faibondi,
	#superclass : #Object,
	#category : #'POOTPF-UI-Executable'
}

{ #category : #executing }
Faibondi class >> ejecutar [
	"Con este constructor se ejecuta el trabajo"
	|sis win|
	"Creo empresa/sistema y lo precargo, en este caso, TestEmpresa cargaInicial: percarga una empresa"
	sis := EmpresaTurismo crear.
	TestEmpresa cargaInicial: sis.
	"Realiza actividades de ejecucion"
	sis efectivizarContratos.
	sis inicioDelDia.
	sis actualizarFrecuentes.
	"Creo ventana Home y la inicializo con el sistema precargado"
	win := Home new.
	win initializeWithSystem: sis.
	win openInWindowLabeled: 'FAIBONDI'.
]

{ #category : #'see class side' }
Faibondi >> seeClassSide [
]

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
	|sis win|.
	win := Home new.
	"Creo empresa/sistema y lo precargo, en este caso, TestEmpresa cargaInicial: percarga una empresa"
	sis := EmpresaTurismo crear.
	TestEmpresa cargaInicial: sis.
	"Inicializo ventana con el sistema creado"
	win initializeWithSystem: sis.
	win openInWindowLabeled: 'FAIBONDI'.
	^win
]

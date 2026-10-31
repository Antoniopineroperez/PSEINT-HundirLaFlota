//HUNDIR LA FLOTA
// Dificultad: 1(3x3), 2(4x4), 3(5x5)
// 3 barcos, 5 intentos
// ** ** B
// ** B **
// ** B **
//
// HAS GANADO
// ** ** H
// ** H **
// ** H **
//
// HAS PERDIDO
// ** ** B
// H  H **
// ** H **

//Función que muestra el tablero que se le pasa como parámetro
Funcion MostrarTablero(tableroJuego, long)
	//1. Definir e inicializar variables
	Definir fila, columna Como Entero
	fila = 0
	columna = 0
	//2. Letrero
	Escribir " --------------------------------------------"
	Escribir "| TABLERO - HUNDIR LA FLOTA |"
	Escribir " --------------------------------------------"
	Escribir ""
	//3. Mostrar el tablero de juego
	Para fila = 0 Hasta (long - 1) Con paso 1 Hacer
		Para columna = 0 Hasta (long - 1) Con paso 1 Hacer
			Escribir tableroJuego[fila,columna] " " Sin Saltar
		FinPara
		Escribir ""
	FinPara
	
	Escribir ""
FinFuncion

//Función que devuelve la dimension que tiene el tablero, en función del nivel de dificultad seleccionado por el usuario
Funcion long = TamTablero(nivelDificultad)
	//1. Definir e inicializar variables
	Definir long Como Entero
	long = 0
	//2. Obtenemos el tamaño del tablero, en función de la dificultad: 1 --> 3x3; 2 --> 4x4; 3 --> 5x5
		Segun nivelDificultad Hacer
			1:
				long = 3
			2:
				long = 4
			3:
				long = 5
		Fin Segun
FinFuncion

//Función que simula el juego, devolviendo el número de barcos hundidos por el usuario
Funcion barcos = Jugar(tablero, long)
	//1. Definir e inicializar variables
	Definir barcos, intentos, filausuario, columnausuario Como Entero
	barcos = 0
	intentos = 0 //Máximo de 5 intentos para hundir los barcos
	filausuario = 0
	columnausuario = 0
	
	//2. Pedir filas y columnas tantas veces como número de intentos tengamos, y comprobar si es un barco
	Mientras (intentos < 5) Hacer
		
		//2.1. Pedir fila y columna
		Esperar 1 Segundo
		Escribir ""
		Escribir "Intento " intentos + 1
		Esperar 1 Segundo
		Escribir "Introduce un número de fila para adivinar: [0 - " long - 1 "]"
		Leer filausuario
		Escribir "Introduce una columna para adivinar: [0 - " long - 1 "]"
		Leer columnausuario
		
		//2.2. Comprobamos si en esa posición del tablero, hay un barco. De ser así, lo marcamos como hundido
			Si tablero[filausuario,columnausuario] = "B"
				Escribir "¡Hundido!"
				tablero[filausuario,columnausuario] = "H"
				barcos = barcos + 1
			SiNo
				Escribir "¡Agua!"
			FinSi
		//2.3. Incrementamos el número de intentos
		intentos = intentos + 1
		//2.4. Si ya hemos hundido todos los barcos, no hace falta que sigamos con más intentos y podemos acabar el bucle
		Si barcos = 3 Entonces
			intentos = 5
		FinSi
	FinMientras
	
	//3. Mostramos el tablero final, llamando a otra función
	MostrarTablero(tablero, long)
FinFuncion

//Juego de Hundir la Flota
Algoritmo HundirFlota
	//1. Definir e inicializar variables
	Definir tablero Como Texto
	Definir  dificultad, fila, columna, dimen, filabarco, columnabarco, barcos, barcosHundidos Como Entero
	dificultad = 0
	fila = 0
	columna = 0
	dimen = 0
	filabarco = 0
	columnabarco = 0
	barcos = 0
	
	Escribir "-------------------------------------------------"
	Escribir "¡Bienvenido al juego Hundir la Flota!"
	Escribir "-------------------------------------------------"
	Esperar 3 Segundos
	
	//2. Llamar a la función que establece el tamaño del tablero en función de la dificultad del juego
	Escribir "Introduce la dificultad del juego: 1 (fácil) | 2 (medio) | 3 (alta)"
	Leer dificultad
	dimen = TamTablero(dificultad)
	
	//3. Dar dimensión al tablero
	Dimension tablero[dimen,dimen]
	
	//4. Creamos el tablero
	Escribir "Creando tablero..."
	Esperar 2 segundos
	
	//4.1. Rellenar el tablero de "agua" (texto "**")
	Para fila = 0 Hasta (dimen - 1) Con Paso 1 Hacer
		Para columna = 0 Hasta (dimen - 1) Con Paso 1 Hacer
			tablero[fila,columna] = "**"
		FinPara
		Escribir ""
	FinPara
	
	//4.2. Mostramos el tablero creado
	MostrarTablero(tablero,dimen)
	
	//4.3. Poner los tres barcos, de forma aleatoria
	Mientras (barcos < 3) Hacer
		filaBarco = azar(dimen) //[0,(dimen - 1)]
		columnaBarco = azar(dimen) //[0,(dimen - 1)]
		Si (tablero[filaBarco,columnaBarco] = "**") Entonces
			tablero[filaBarco,columnaBarco] = "B"
			barcos = barcos + 1
		FinSi
	FinMientras
	
	Escribir "-----------------------------------------"
	Escribir "--------- ¡¡Tablero creado!! ---------"
	Escribir "-----------------------------------------"
	
	//5. Llamar a la función que ejecuta el juego
	Escribir "¡Empieza el juego! Tienes 5 intentos para adivinar los 3 barcos. ¡¡Suerte!! :)"
	barcosHundidos = Jugar(tablero, dimen)
	
	//6. Comprobamos si hemos ganado, en base del número de barcos hundidos devueltos por la función
	Si (barcosHundidos = barcos) Entonces
		Escribir "HAS GANADO"
		Escribir "Hundiste todos los barcos"
	SiNo
		Escribir "HAS PERDIDO"
		Escribir "No has hundido todos los barcos"
	FinSi
FinAlgoritmo

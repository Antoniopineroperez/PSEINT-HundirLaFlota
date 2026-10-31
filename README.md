# PSEINT-HundirLaFlota
Clasico juego de hundir la flota creado con pseudocodigo

# Instrucciones:
B = Posición del barco 🛥️
H = Casilla a la que se ha disparado 🔫
** = Agua 💧

# Leyenda:
🟢 ¡5 intentos, 3 barcos, hundelos a todos!
🟢 Dificultad ➡️ Facil (tablero 3x3) - Normal (tablero 4x4) - Dificil (tablero 5x5)

# Ejemplo de ejecución:
Al elegir una dificultad, el juego genera el tablero de esta forma.

Facil         Normal           Dificil
** ** **      ** ** ** **      ** ** ** ** **        
** ** **      ** ** ** **      ** ** ** ** **
** ** **      ** ** ** **      ** ** ** ** ** 
              ** ** ** **      ** ** ** ** ** 
                               ** ** ** ** **
                               
Donde está la B es donde se ha colocado aleatoriamente el barco, pero obviamente, 
al jugar, no muestra donde se coloca, por lo que solo veriamos los ** como se explica arriba ⬆️

Facil         Normal           Dificil
** ** B       B  ** ** **      ** ** ** ** **        
** B  **      ** ** ** **      ** B  ** ** **
** ** B       B  ** ** **      ** ** ** B  ** 
              ** ** B  **      ** ** ** ** ** 
                               ** ** B  ** **

Ahora el script nos irá pidiendo las posiciones (fila y columna) donde queremos disparar,
tenemos un contador de 5 disparos para ganar. Si coincide nuestra posicion con el barco, lo hundimos.

Ejemplo ganando la partida:

Facil         Normal           Dificil
** ** H       H  ** ** **      ** ** ** ** **        
** H  **      ** ** ** **      ** H  ** ** **
** ** H       H  ** ** **      ** ** ** H  ** 
              ** ** H  **      ** ** ** ** ** 
                               ** ** H  ** **

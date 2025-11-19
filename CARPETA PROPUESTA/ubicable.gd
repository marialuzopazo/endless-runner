"""
INTERFAZ ABSTRACTA UBICABLE
Justificación POO: 
- Define un contrato que deben cumplir todas las entidades ubicables en el juego
- Permite polimorfismo: tratar diferentes objetos con la misma interfaz
- Facilita el sistema de spawn y gestión de posiciones
"""

extends RefCounted
class_name Ubicable

# MÉTODO ABSTRACTO - debe ser implementado por todas las clases hijas
func ubicar() -> Vector2:
	"""
	DEVUELVE la posición actual del objeto en el mundo del juego
	
	Justificación: 
	- Polimorfismo: diferentes objetos (enemigos, jugador, objetos) 
	  pueden ser tratados de la misma manera para obtener su ubicación
	- Encapsulamiento: oculta la implementación específica de cada clase
	"""
	assert(false, "Método abstracto ubicar() debe ser implementado por la clase hija")
	return Vector2.ZERO

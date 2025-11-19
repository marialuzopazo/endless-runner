"""
CLASE ABSTRACTA PERSONAJE
Justificación POO:
- Herencia: define comportamiento común para jugador y enemigos
- Encapsulamiento: atributos protegidos con _ para controlar acceso
- Abstracción: métodos abstractos que deben ser implementados
"""

extends CharacterBody2D
class_name Personaje

# ATRIBUTOS ENCAPSULADOS (protegidos con _)
var _vida: int
var _ataque: int
var _area_de_ataque: Area2D
var _area_de_colision: CollisionShape2D

# CONSTRUCTOR - inicializa atributos comunes
func _init(vida_inicial: int, ataque_inicial: int):
	"""
	CONSTRUCTOR de la clase base Personaje
	
	Justificación POO:
	- Encapsulamiento: inicializa atributos protegidos
	- Herencia: las clases hijas llaman a super._init() 
	- Reutilización: código común en un solo lugar
	"""
	_vida = vida_inicial
	_ataque = ataque_inicial
	print("Personaje creado con ", _vida, " HP y ", _ataque, " de ataque")

# MÉTODO ABSTRACTO - debe ser implementado por clases hijas
func atacar() -> int:
	"""
	MÉTODO ABSTRACTO - lógica de ataque específica de cada personaje
	
	Justificación POO:
	- Polimorfismo: cada personaje ataca de manera diferente
	- Abstracción: define QUÉ hace sin decir CÓMO lo hace
	"""
	assert(false, "Método abstracto atacar() debe ser implementado por la clase hija")
	return 0

# MÉTODOS CONCRETOS - compartidos por todas las clases hijas
func recibir_dano(cantidad: int) -> void:
	"""
	APLICA daño al personaje y verifica si muere
	
	Justificación POO:
	- Herencia: comportamiento común para todos los personajes
	- Encapsulamiento: modifica _vida de manera controlada
	- Reutilización: evita código duplicado en jugador y enemigos
	"""
	_vida -= cantidad
	print("Personaje recibió ", cantidad, " de daño. Vida restante: ", _vida)
	
	if _vida <= 0:
		morir()

func morir() -> void:
	"""
	EJECUTA la lógica de muerte del personaje
	
	Justificación POO:
	- Herencia: comportamiento común para muerte
	- Puede ser sobrescrito por clases hijas para personalización
	"""
	print("Personaje ha muerto")
	queue_free()  # Elimina el nodo de la escena

# GETTERS - acceso controlado a atributos privados
func get_vida() -> int:
	"""
	GETTER para acceder a la vida de manera controlada
	
	Justificación POO:
	- Encapsulamiento: no se accede directamente a _vida
	- Control: podemos agregar validaciones si es necesario
	"""
	return _vida

func get_ataque() -> int:
	"""Getter encapsulado para el atributo de ataque"""
	return _ataque

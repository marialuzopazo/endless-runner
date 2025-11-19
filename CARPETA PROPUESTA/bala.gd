"""
CLASE BALA - Componente del revólver tumbero
Justificación POO:
- Encapsulamiento: estado interno privado
- Composición: parte del sistema de revólver
- Responsabilidad única: solo maneja si funciona o no
"""

extends RefCounted
class_name Bala

var _funciona: bool

func _init():
	"""
	CREA una bala con 50% de probabilidad de funcionar
	
	Justificación POO:
	- Encapsulamiento: el estado se determina al crear
	- Inicialización consistente
	"""
	_funciona = randf() > 0.5  # 50% de probabilidad
	print("Bala creada - Funciona: ", _funciona)

func disparar() -> bool:
	"""
	INTENTA disparar la bala
	
	Justificación POO:
	- Encapsulamiento: solo expone si funciona o no
	- Comportamiento predecible
	"""
	return _funciona

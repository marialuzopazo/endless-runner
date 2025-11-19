"""
SISTEMA DE REVOLVER TUMBERO - Mecánica única del juego
Justificación POO:
- Encapsulamiento: lógica de probabilidad encapsulada
- Composición: el jugador tiene un revólver
- Reutilización: puede ser usado por otros personajes
"""

extends RefCounted
class_name RevolverTumbero

var _balas: Array
var _posicion_actual: int = 0
var _capacidad: int = 6

func _init():
	"""
	INICIALIZA el revólver con balas aleatorias
	
	Justificación POO:
	- Encapsulamiento: las balas se crean internamente
	- Composición: crea instancias de Bala
	"""
	_recargar()
	print("Revolver Tumbero creado con ", _capacidad, " balas")

func _recargar():
	"""Carga el tambor con balas aleatorias"""
	_balas.clear()
	for i in range(_capacidad):
		_balas.append(Bala.new())
	_posicion_actual = 0
	print("Revolver recargado")

func disparar() -> bool:
	"""
	DISPARA el revólver con probabilidad de fallo
	
	Justificación POO:
	- Encapsulamiento: la lógica interna está oculta
	- Composición: usa objetos Bala
	- Retorna resultado simple para el caller
	"""
	if _balas.is_empty():
		print("Revolver vacío - recargando...")
		_recargar()
		return false
	
	var bala_actual: Bala = _balas[_posicion_actual]
	var resultado: bool = bala_actual.disparar()
	
	print("Disparo posición ", _posicion_actual, " - Resultado: ", resultado)
	
	# Avanza al siguiente (lista circular)
	_posicion_actual = (_posicion_actual + 1) % _capacidad
	
	return resultado

func get_balas_restantes() -> int:
	"""Getter para debug - muestra balas restantes"""
	return _balas.size()

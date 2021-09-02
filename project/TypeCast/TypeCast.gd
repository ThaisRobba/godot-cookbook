"""
With type casting, we can specify what something is without depending on the automated type casting.
This is helpful when iterating over certain values (for loops don't have type hints).
"""
extends Control


func _ready() -> void:
	print(($Label as TypeCastLabel).some_property)

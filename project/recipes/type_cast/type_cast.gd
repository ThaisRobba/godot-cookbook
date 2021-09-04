extends Control
"""
With manual type casting, we can specify what something is without depending on the automated type casting.
This is helpful when iterating over values that are untyped and to ensure that whatever we are acessing exists in an object, as it will work correctly with autocompletion and correctly log errors.

To cast, use '(your_node as node_type)'.
ie: ($MyButton as Button)
"""


func _ready() -> void:
	$Label.text += str(($Label as TypeCastLabel).some_property)

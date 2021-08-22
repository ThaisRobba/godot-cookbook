extends Control
"""
The idea here is to have a system that allows me to only update certain nodes.
This is specially useful for things like inventory icons, as to avoid any
type of 'prop drilling'.

Groups can be set from the 'Node' panel (recommended) or programatically,
like here in the _ready() function
"""

func _ready() -> void:
	$VBoxContainer/LabelGroupA1.add_to_group("A")
	$VBoxContainer/LabelGroupA2.add_to_group("A")
	$VBoxContainer/LabelGroupB1.add_to_group("B")
	$VBoxContainer/LabelGroupB2.add_to_group("B")
	$VBoxContainer/LabelGroupB3.add_to_group("B")


func _on_Button_pressed() -> void:
	get_tree().call_group("A", "update_me", 1, str(rand_range(0, 1000)))

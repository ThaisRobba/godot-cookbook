extends Control
"""
A sample of how child elements could be updated from a centralized signal
handler. This allows children to be simpler (ie: no extra functions) but
comes at the cost of increased complexity if navigating the tree.
"""

func _ready() -> void:
	pass



func _on_Button_pressed() -> void:
	for child in $VBoxContainer.get_children():
		if child.name != "Button":
			if child.key == 1:
				child.text = str(rand_range(0, 1000))

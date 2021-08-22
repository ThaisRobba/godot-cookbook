extends Control



func _on_Button_pressed() -> void:
	$VBoxContainer/Parent.text = "Parent, property: %s" % $VBoxContainer/Parent.inner_property
	$VBoxContainer/Parent2.text = "Parent, property: %s" % $VBoxContainer/Parent2.inner_property

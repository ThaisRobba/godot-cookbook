"""
Groups allow trigerring methods on specific nodes without having to traverse the node tree.

Groups can be set from the editor programatically, like here in the _ready() function, or via the 'Node' panel, which is recommended as to avoid possible typos. Groups that you create in code will not show up in the 'Node' panel.

One can also pass extra arguments to a group call. In this example, we pass a key '1', so that our labels can validate if they match it before updating. This allows for more fine grained control.

ie: 'The player tripped an alarm, I want to alert all enemies but I will pass the alarm position so that only enemies close enough to it will look for the player.'
"""
extends Control


func _ready() -> void:
	$VBoxContainer/LabelGroupA1.add_to_group("A")
	$VBoxContainer/LabelGroupA2.add_to_group("A")
	$VBoxContainer/LabelGroupB1.add_to_group("B")
	$VBoxContainer/LabelGroupB2.add_to_group("B")
	$VBoxContainer/LabelGroupB3.add_to_group("B")


func _on_Button_pressed() -> void:
	get_tree().call_group("A", "update_me", 1, str(rand_range(0, 1000)))

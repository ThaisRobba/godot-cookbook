extends Control
"""
A common pattern is to have signals bubbling up and method calls cascading down, centralizing updating children from a signal call (in this case, a simple button press but it could be connected to anything).

The downside of calling the method on children directly is that the program must be made to traverse the tree and this can be quite cumbersome. We recommend using groups and call_group(), instead of directly modifying children. Check the 'group call' example.
"""


func _on_Button_pressed() -> void:
	for child in $VBoxContainer.get_children():
		# Here we had to check to make sure we aren't trying to call the method on the wrong children
		# With a more complex node tree, this gets unwieldy.
		if child.name != "Button":
			child.update_me(1, str(rand_range(0, 1000)))


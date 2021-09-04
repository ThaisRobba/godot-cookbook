extends Label

var child_property : int setget noop, get_inner_property

func noop(_arg):
	return

func get_inner_property():
	return get_child(0).get("child_property")

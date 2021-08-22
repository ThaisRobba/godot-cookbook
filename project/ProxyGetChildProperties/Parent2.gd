extends Label

var inner_property : int setget noop, get_inner_property

func noop(_arg):
	return

func get_inner_property():
	return get_child(0).get("inner_property")

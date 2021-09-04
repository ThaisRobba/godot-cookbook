extends Label

func _get(property: String):
	return get_child(0).get(property)

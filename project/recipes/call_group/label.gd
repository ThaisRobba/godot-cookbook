extends Label

export(int) var key = 0

func update_me(target_key: int, new_value: String) -> void:
	if key == target_key:
		text = new_value

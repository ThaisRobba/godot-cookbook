extends Label

export(int) var key = 0

func update_me(target_key, new_value):
	if key == target_key:
		text = new_value

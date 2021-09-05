extends TextureButton


var title := "" setget set_title
var description := "" setget set_description


func set_title(new_title: String) -> void:
	title = new_title
	$Title.text = title


func set_description(new_description: String) -> void:
	description = new_description
	$Description.text = description

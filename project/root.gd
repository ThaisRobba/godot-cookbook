extends Control

# Iterate over all examples
# Create tabs from tags
# onClick, load an example and show it on the viewport on the right

onready var _CodeContainer = $HBoxContainer/CodeContainer
onready var _ExampleContainer = $HBoxContainer/ExampleContainer
onready var _RecipeContainer = $HBoxContainer/RecipesContainer

const CodeBlock = preload("res://commons/code_block/code_block.tscn")

func _ready() -> void:
	var button_group = ButtonGroup.new()
	for scene in Utils.get_filelist("res://recipes" , "tscn"):
		var button = Button.new()
		button.toggle_mode = true
		button.group = button_group

		button.connect("pressed", self, "_on_scene_selected", [scene])
		button.text = _get_formatted_file_name(scene)
		$HBoxContainer/RecipesContainer/VBoxContainer.add_child(button)


func _on_scene_selected(scene) -> void:
	_load_example(scene)
	_load_scripts(scene)


func _load_scripts(scene: String) -> void:
	for child in _CodeContainer.get_children():
		child.queue_free()

	for script in Utils.get_filelist(scene.get_base_dir(), "gd"):
		var code_block : TextEdit = CodeBlock.instance()
		_CodeContainer.add_child(code_block)
		# We must set the text after adding it as a child
		# otherwise it won't wrap correctly
		code_block.text = Utils.read_file(script)

		_CodeContainer.set_tab_title(_CodeContainer.get_child_count() - 1, _get_file_name(script) + ".gd")

		# We want the script that controls the scene to be the first tab
		# so that we always show documentation correctly
		if script == scene.replace("tscn", "gd"):
			_CodeContainer.move_child(code_block, 1)
	(_CodeContainer as TabContainer).current_tab = 0


func _load_example(scene: String) -> void:
	for child in _ExampleContainer.get_children():
		child.queue_free()

	_ExampleContainer.add_child((load(scene) as PackedScene).instance())


func _get_file_name(filepath: String) -> String:
	var start = filepath.find_last("/") + 1
	var end = filepath.find_last(".") - start
	return filepath.substr(start, end)


func _get_formatted_file_name(filepath: String) -> String:
	return _get_file_name(filepath).replace("_", " ").capitalize()

extends Control

const CodeBlock = preload("res://commons/code_block/code_block.tscn")

onready var _CodeContainer = $HSplitContainer/CodeContainer
onready var _ExampleContainer = $HSplitContainer/ExampleContainer
onready var _PullPanel = $PullPanel


func _ready() -> void:
	_PullPanel.setup(Utils.get_filelist("res://recipes" , "tscn"))
	_PullPanel.connect("recipe_selected", self, "_on_recipe_selected")


func _on_recipe_selected(scene) -> void:
	_load_example(scene)
	_load_scripts(scene)


func _load_scripts(scene: String) -> void:
	for child in _CodeContainer.get_children():
		child.queue_free()

	for script in Utils.get_filelist(scene.get_base_dir(), "gd"):
		var code_block : TextEdit = CodeBlock.instance()
		_CodeContainer.add_child(code_block)
		# We must set the text after adding it as a child otherwise it won't wrap correctly
		code_block.text = Utils.read_file(script)

		var tab_index = _CodeContainer.get_child_count() - 1
		_CodeContainer.set_tab_title(tab_index, Utils.get_file_name(script) + ".gd")

		# We want the script that controls the scene to be the first tab
		# so that we always show documentation correctly
		if script == scene.replace("tscn", "gd"):
			_CodeContainer.move_child(code_block, 1)

	# And we want the first tab to be the one selected when we load a new scene
	(_CodeContainer as TabContainer).current_tab = 0


func _load_example(scene: String) -> void:
	for child in _ExampleContainer.get_children():
		child.queue_free()

	_ExampleContainer.add_child((load(scene) as PackedScene).instance())




extends Control

var open := true
var recipes := []

const CLOSED = false
const OPEN = true

signal recipe_selected(recipe)

const RecipeCard = preload("res://commons/recipe_card/recipe_card.tscn")

func setup(new_recipes: Array) -> void:
	print("hello", new_recipes)
	for recipe in new_recipes:
		var card = RecipeCard.instance()
		card.title = Utils.get_formatted_file_name(recipe)
		card.description = Utils.get_description(recipe)
		card.connect("pressed", self, "_on_recipe_selected", [recipe])
		$Panel/ScrollContainer/GridContainer.add_child(card)


func toggle(to: bool = not open) -> void:
	print("to is: %s" % to)
	open = to
	_tween_to_position()


func _on_OpenButton_pressed() -> void:
	toggle()


func _on_recipe_selected(recipe: String) -> void:
	emit_signal("recipe_selected", recipe)
	toggle(CLOSED)


func _tween_to_position() -> void:
	var target_x = 0 if open else -rect_size.x

	$Tween.interpolate_property(self, "rect_position", rect_position, Vector2(target_x, 0), 0.2, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()

extends TextEdit


func _ready() -> void:
	syntax_highlighting = true
	draw_tabs = true
	show_line_numbers = true
	wrap_enabled = true
	fold_gutter = true
	add_color_region('"', '"', Color(0.945098, 0.980392, 0.54902))
	add_keyword_color("func", Color(0.952941, 0.454902, 0.745098))
	add_keyword_color("void", Color(0.952941, 0.454902, 0.745098))
	add_keyword_color("true", Color(0.952941, 0.454902, 0.745098))
	add_keyword_color("false", Color(0.952941, 0.454902, 0.745098))

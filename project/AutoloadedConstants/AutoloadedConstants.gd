tool
extends Control
"""
Preload might break the usage of autoloaded constants (order of load is
important!) so pay attention if the editor is complaining about not finding
a certain value. Below, we export a var using an autoloaded constant.
"""

export(Constants.ControlledBy) var controlled_by = Constants.ControlledBy.none setget set_controlled_by

func set_controlled_by(target):
	controlled_by = target
	$Label.text = "Controlled by: %s" % Constants.ControlledBy.keys()[target]

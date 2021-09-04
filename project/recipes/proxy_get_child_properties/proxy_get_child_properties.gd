extends Control
"""
Suppose we want to be able to access properties of a child node but we don't want to do 'parent.child.property', we want to let the parent handle this so that any future changes to child only have to be modified in the parent node.

There are a few ways to go about this:
	1. We could have the parent inherit from the child
	2. We could modify the parent '_get(property)' function
	3. We could add a property with setget on the parent

All of these have tradeoffs.
Number 1 means that we would have to copy non-default fields on initialization. Data could get out of sync and we would be using more memory than needed.
Number 2 means that if we change the child interface, we have to update it everywhere that called the parent.
Number 3 is more verbose but also more consistent. It is, in essence, the Mediator pattern, meaning that all interactions that affect the child will be resolved by the parent, so the parent interface can remain stable, even if the child changes. There is no risk of data being out of sync.
"""

onready var _Parent = $VBoxContainer/Parent
onready var _Parent2 = $VBoxContainer/Parent2
onready var _Parent3 = $VBoxContainer/Parent3

func _on_Button_pressed() -> void:
	_Parent.text = "Parent, property: %s" % _Parent.child_property
	_Parent2.text = "Parent, property: %s" % _Parent2.child_property
	_Parent3.text = "Parent, property: %s" % _Parent3.child_property

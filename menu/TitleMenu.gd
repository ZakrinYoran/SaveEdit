extends "res://menu/TitleMenu.gd"

func _ready():
	for btn in get_node(saveSlotsPath).get_children():
		if "edit_button" in btn:
			btn.connect("edit_save", self, "edit_save")


func edit_save():
	$NoMargins/SaveEditor.popup_centered()

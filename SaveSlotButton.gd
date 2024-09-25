extends "res://SaveSlotButton.gd"

export (NodePath) var edit_button = NodePath("")

signal edit_save

# Called when the node enters the scene tree for the first time.
func _ready():
	edit_button = get_node(edit_button)
	edit_button.connect("pressed", self, "edit_save")

func edit_save():
	CurrentGame.saveFile = saveSlotFile
	emit_signal("edit_save")

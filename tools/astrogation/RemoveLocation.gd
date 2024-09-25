extends Button

export (NodePath) var selector_node
var location : String

func _ready():
	selector_node = get_node(selector_node)
	add_to_group("save_edit_astrogation")
	connect("pressed", self, "_on_button_pressed")

func _on_data_changed(what):
	location = what

func _on_button_pressed():
	CurrentGame.state.astrogation.erase(location)
	selector_node.fill_options()

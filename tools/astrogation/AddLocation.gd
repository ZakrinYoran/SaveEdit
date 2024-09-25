extends Button

const TEMPLATE = {
	"vector":Vector2(), 
	"time":0, 
	"event":"", 
	"trackable":false, 
	"empheral":false, 
	"since":0, 
	"highlight":""}

export (NodePath) var selector_node
var location : String

func _ready():
	selector_node = get_node(selector_node)
	add_to_group("save_edit_astrogation")
	connect("pressed", self, "_on_button_pressed")

func _on_data_changed(what):
	location = what

func _on_button_pressed():
	CurrentGame.state.astrogation["NEW LOCATION"] = TEMPLATE.duplicate()
	selector_node.fill_options(true)

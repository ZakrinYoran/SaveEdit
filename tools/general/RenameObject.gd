extends LineEdit


export (String) var path
export (String) var group_suffix

export (NodePath) var selector_node

var data : Dictionary
var previous : String

func _ready():
	selector_node = get_node(selector_node)
	add_to_group("save_edit%s" % group_suffix)
	connect("text_entered", self, "_on_text_entered")

func _on_text_entered(text:String):
	data[text] = data[previous].duplicate(true)
	data.erase(previous)
	selector_node.fill_options(true)

func _on_save_changed():
	_on_data_changed()

func _on_data_changed(target : String = ""):
	data = CurrentGame.state
	if path:
		for category in path.split("."):
			data = data[category]

	previous = target
	text = target
	editable = true

func _on_no_target():
	data = {}
	editable = false
	text = ""

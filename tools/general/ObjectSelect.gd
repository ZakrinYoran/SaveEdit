extends OptionButton

export (String) var call_group
export (String) var call_func
var object : String

func _ready():
	connect("item_selected", self, "_on_item_selected")

func _on_item_selected(idx):
	object = get_item_text(idx)
	get_tree().call_group(call_group, call_func, object)

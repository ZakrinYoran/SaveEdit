extends Control

export (String) var category
export (NodePath) var option_button
onready var tab_container : TabContainer = get_parent()

func _ready():
	add_to_group("save_edit")
	option_button = get_node(option_button)

func _on_save_changed():
	option_button.clear()
	for entry in CurrentGame.state[category]:
		option_button.add_item(entry)

	if option_button.get_item_count():
		tab_container.set_tab_hidden(get_index(), false)
		option_button._on_item_selected(0)
	else:
		tab_container.set_tab_hidden(get_index(), true)


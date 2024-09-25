extends Control

export (NodePath) var option_button
onready var tab_container : TabContainer = get_parent()

func _ready():
	add_to_group("save_edit")
	option_button = get_node(option_button)

func _on_save_changed():
	option_button.fill_options()
	tab_container.set_tab_hidden(get_index(), !option_button.get_item_count())


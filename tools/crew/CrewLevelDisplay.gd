extends Label

export (String, "Talent", "Experience") var type 
export (NodePath) var source

func _ready():
	source = get_node(source)
	source.connect("value_changed", self, "_on_value_changed")

func _on_value_changed(value):
	match type:
		"Talent":
			text = CurrentGame.translateLevel(value, CurrentGame.talentLevels)
		"Experience":
			text = CurrentGame.translateLevel(value, CurrentGame.experienceLevels)

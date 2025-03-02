extends CanvasLayer

@onready var npc = get_tree().get_first_node_in_group("npc")
@onready var dialogueBox = get_parent().get_node("TextBoxContainer")



func _on_ethos_pressed() -> void:
	dialogueBox.closeButtons()
	npc.acceptButtonInput("ethos")


func _on_pathos_pressed() -> void:
	dialogueBox.closeButtons()
	npc.acceptButtonInput("pathos")

func _on_logos_pressed() -> void:
	dialogueBox.closeButtons()
	npc.acceptButtonInput("logos")

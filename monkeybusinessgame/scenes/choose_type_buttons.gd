extends CanvasLayer

@onready var npc = get_parent().get_parent().get_child(2)
@onready var dialogueBox = get_parent()




func _on_ethos_pressed() -> void:
	dialogueBox.closeButtons()
	npc.acceptButtonInput("ethos")


func _on_pathos_pressed() -> void:
	dialogueBox.closeButtons()
	npc.acceptButtonInput("pathos")

func _on_logos_pressed() -> void:
	dialogueBox.closeButtons()
	npc.acceptButtonInput("logos")

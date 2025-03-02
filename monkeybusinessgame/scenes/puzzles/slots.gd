extends Area2D  # This script goes inside each Slot (Slot1, Slot2, etc.)

# Dictionary that defines the correct piece-to-slot matches
var correct_slots = {
	"paperPiece1": "Slot1",
	"paperPiece2": "Slot2",
}

# Track correctly placed pieces (shared across all slots)
var placed_pieces = {}

func _on_area_entered(area: Area2D) -> void:
	print("_on_area_entered area ", area.name)
	print("_on_area_entered self ", self.name)
	# Get the parent Node2D and call `mark_piece_placed`
	var puzzle_manager = get_parent()  # This finds `PuzzleManager.gd`
	if puzzle_manager.has_method("mark_piece_placed"):
		puzzle_manager.mark_piece_placed(area.name, self.name)

func _on_area_exited(area: Area2D) -> void:
	print("_on_area_exited area:", area.name)
	print("_on_area_exited self:", self.name)
	var puzzle_manager = get_parent()
	if puzzle_manager.has_method("mark_piece_removed"):
		puzzle_manager.mark_piece_removed(area.name, self.name)

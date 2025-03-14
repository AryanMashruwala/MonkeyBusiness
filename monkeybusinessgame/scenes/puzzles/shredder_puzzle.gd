extends Node2D  # Tracks puzzle pieces for this minigame

# Dictionary that defines correct puzzle-to-slot matches
var correct_slots = {
	"paperPiece1": "Slot1",
	"paperPiece2": "Slot2",
	"paperPiece3": "Slot3",
	"paperPiece4": "Slot4"
}

# Dictionary to track placed pieces
var placed_pieces = {}

func mark_piece_placed(piece_name: String, slot_name: String):
	#print("IMMMMMMMMMM")
	#print(correct_slots.get(piece_name), slot_name)
	if correct_slots.get(piece_name) == slot_name:
		#print("is this called????")
		placed_pieces[piece_name] = true
		print(placed_pieces)
		print("✅", piece_name, "correctly placed in", slot_name)
	check_puzzle_solved()

func mark_piece_removed(piece_name: String, slot_name: String):
	if placed_pieces.has(piece_name) and slot_name == correct_slots[piece_name]:
		placed_pieces.erase(piece_name)
		print(placed_pieces)
		print("❌", piece_name, "removed from", slot_name)

func check_puzzle_solved():
	if len(placed_pieces) == len(correct_slots):
		if is_instance_valid(self):
			queue_free()  # Only free if still valid
			await get_tree().process_frame
		SceneManager.switch_scene("res://scenes/main_office.tscn")

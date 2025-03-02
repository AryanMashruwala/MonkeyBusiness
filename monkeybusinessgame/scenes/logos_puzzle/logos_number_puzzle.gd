extends Node2D  # Tracks puzzle pieces for this minigame

# Dictionary that defines correct puzzle-to-slot matches
var correct_slots = {
	"number1": "slot1",
	"number2": "slot2",
	"number3": "slot3",
	"number4": "slot4",
	"number5": "slot5",
	"number6": "slot6",
	"number7": "slot7"
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
		print("🎉 Puzzle Solved!")

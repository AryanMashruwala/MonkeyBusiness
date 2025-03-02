extends Node

var removed_nodes = {}

func mark_node_removed(node_name: String):
	removed_nodes[node_name] = true

func is_node_removed(node_name: String) -> bool:
	return node_name in removed_nodes

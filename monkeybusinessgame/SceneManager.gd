extends Node
# For managing scenes

var previous_scene: Node = null  # Store the original scene

func switch_scene(target_scene_path: String):
    if previous_scene == null:
        previous_scene = get_tree().current_scene  # Store the current scene

    var target_scene = load(target_scene_path).instantiate()
    get_tree().root.add_child(target_scene)
    get_tree().current_scene.queue_free()
    get_tree().current_scene = target_scene

func return_to_previous_scene():
    if previous_scene:
        get_tree().root.add_child(previous_scene)
        get_tree().current_scene.queue_free()
        get_tree().current_scene = previous_scene
        previous_scene = null  # Reset after returning
extends DetailedSceneBase


@onready var current_visibility_state_label = $MarginContainer2/VBoxContainer/CurrentVisibilityState
@onready var last_visibility_states_label = $MarginContainer2/VBoxContainer/LastVisibilityStates
var last_visibility_states = []


func _ready():
	current_visibility_state_label.text = "Current Visibility State: " + Bridge.game.visibility_state
	_on_visibility_state_changed(Bridge.game.visibility_state)
	Bridge.game.connect("visibility_state_changed", Callable(self, "_on_visibility_state_changed"))

func _on_visibility_state_changed(state):
	last_visibility_states.append(state)
	
	if last_visibility_states.size() > 5:
		last_visibility_states.remove(0)
	
	_update_last_states()

func _update_last_states():
	var text = "Last Visibility States: "
	
	for state in last_visibility_states:
		text += state + " -> "
	
	last_visibility_states_label.text = text

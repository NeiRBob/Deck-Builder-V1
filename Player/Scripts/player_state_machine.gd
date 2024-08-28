class_name PlayerStateMachine extends Node

var states: Array[State] = []  # Corrected from '-' to '='
var prev_state: State
var current_state: State

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state:
		ChangeState(current_state.Process(delta))

func _physics_process(delta):
	if current_state:
		ChangeState(current_state.Physics(delta))

func _unhandled_input(event):
	if current_state:
		ChangeState(current_state.HandleInput(event))

func Initialize(_player: Player) -> void:
	states.clear()

	for c in get_children():
		if c is State:
			states.append(c)  # Assign player to each state

	if states.size() > 0:
		states[0].player = _player
		ChangeState(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func ChangeState(new_state: State) -> void:
	if new_state == null or new_state == current_state:
		return

	if current_state:
		current_state.Exit()

	prev_state = current_state
	current_state = new_state
	current_state.Enter()

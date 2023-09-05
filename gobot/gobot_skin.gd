extends Node3D

signal foot_step

@onready var _animation_tree: AnimationTree = %AnimationTree
@onready var _state_machine: AnimationNodeStateMachinePlayback = _animation_tree.get(
		"parameters/StateMachine/playback"
)
@onready var path_follow_3d: PathFollow3D = $".."

func _ready():
	_state_machine.travel("Run")
	run()

func run():
	path_follow_3d.progress_ratio = 0
	var tween = get_tree().create_tween()
	tween.tween_property(path_follow_3d, "progress_ratio", 1, 3)
	tween.tween_callback(run)

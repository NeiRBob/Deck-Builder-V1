class_name State_Idle extends State


func Enter() -> void:
	player.UpdateAnimation("idle")
	pass


func Exit() -> void:
	pass


func Process( _delta : float ) -> State:
	return null

func Physics( _delta : float ) -> State:
	return null


func HandleInput( _event : InputEvent ) -> State:
	return null



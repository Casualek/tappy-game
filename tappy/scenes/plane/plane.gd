extends CharacterBody2D

class_name Tappy

const GRAVITY: float = 1500.0
const POWER: float = -400.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio: AudioStreamPlayer2D = $audio
@onready var animated_sprite: AnimatedSprite2D = $animatedSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta 
	
	_fly()
	
	move_and_slide()
	if is_on_ceiling() == true:
		die()

	if is_on_floor() == true:
		die()

func die() -> void:
	animated_sprite.stop()
	audio.stop() 
	set_physics_process(false)
	SignalManager.on_plane_died.emit()

func _fly() -> void:
	if Input.is_action_just_pressed("fy") == true:
		velocity.y = POWER
		animation_player.play("power")

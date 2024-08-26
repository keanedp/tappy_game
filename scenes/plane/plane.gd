extends CharacterBody2D


const GRAVITY: float = 1000.0
const POWER: float = -350.0


signal on_plane_died


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	fall(delta)
	fly()
	move_and_slide()
	if is_on_floor():
		die()


func fall(delta: float) -> void:
	velocity.y += GRAVITY * delta;


func fly() -> void:
	if Input.is_action_just_pressed(" fly"):
		velocity.y = POWER
		animation_player.play("power")


func die() -> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
	on_plane_died.emit()

extends Parallax2D


@onready var sprite_2d: Sprite2D = $Sprite2D
@export var texture: Texture2D


func _ready() -> void:
	var scale_f = get_viewport_rect().size.y / texture.get_height()
	sprite_2d.texture = texture
	sprite_2d.scale	= Vector2(scale_f, scale_f)
	repeat_size.x  = texture.get_width() * scale_f
	
	SignalManager.on_plane_died.connect(_on_plane_died)


func _on_plane_died() -> void: 
	#set_process(false) # doesn't work, experimental bug?
	process_mode = PROCESS_MODE_DISABLED

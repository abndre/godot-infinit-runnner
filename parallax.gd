extends ParallaxBackground


@export var MOON_SPEED = 0.05
@export var ROOF_SPEED = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$moon.motion_offset.x -=MOON_SPEED
	$booton.motion_offset.x -=ROOF_SPEED

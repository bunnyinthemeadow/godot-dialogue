extends Polygon2D

const max_speed = 0.5

var x_speed
var y_speed

var desired_x_size
var desired_y_size

func _ready():
	set_desired_size(Vector2(abs(2 * polygon[0].x), abs(2 * polygon[0].y)))

func set_desired_size(size):
	desired_x_size = size.x
	desired_y_size = size.y
	var x_min_time = abs(desired_x_size - polygon[1].x) / max_speed
	var y_min_time = abs(desired_y_size - polygon[1].y) / max_speed
	if(x_min_time > y_min_time):
		x_speed = max_speed
		y_speed = abs(desired_y_size - polygon[1].y) / x_min_time
	else:
		x_speed = abs(desired_x_size - polygon[1].x) / y_min_time
		y_speed = max_speed
		print(y_speed)
		print(x_speed)

func _process(delta):
	change_x_positions()
	change_y_positions()
	
func change_x_positions():
	var current_x_extent = polygon[2].x
	var desired_x_extent = desired_x_size/2
	var x_change = clamp(desired_x_extent - current_x_extent, -x_speed, x_speed)
	polygon[0].x = polygon[0].x - x_change
	polygon[1].x = polygon[1].x + x_change
	polygon[2].x = polygon[2].x + x_change
	polygon[3].x = polygon[3].x - x_change
	
func change_y_positions():
	var current_y_extent = polygon[2].y
	var desired_y_extent = desired_y_size/2
	var y_change = clamp(desired_y_extent - current_y_extent, -y_speed, y_speed)
	polygon[0].y = polygon[0].y - y_change
	polygon[1].y = polygon[1].y - y_change
	polygon[2].y = polygon[2].y + y_change
	polygon[3].y = polygon[3].y + y_change

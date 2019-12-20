extends Node2D

const accel = 100
const max_rotation_speed = 10

var desired_rotation_pos
var rotation_velocity
export(bool)var prefers_clockwise = true

func _ready():
	desired_rotation_pos = rotation_degrees
	rotation_velocity = 0
	
func _process(delta):
	apply_force(delta)
	rotate(deg2rad(rotation_velocity))
	
func set_desired_rotation(degrees):
	if rotation_degrees < 0:
		rotation_degrees = 720 + rotation_degrees
	if rotation_degrees >= 360:
		rotation_degrees = rotation_degrees - 360
	var degrees_one
	var degrees_two
	if(degrees > rotation_degrees):
		degrees_one = degrees
		degrees_two = degrees - 360
	else:
		degrees_two = degrees
		degrees_one = degrees + 360
	var degrees_one_difference = abs(rotation_degrees - degrees_one)
	var degrees_two_difference = abs(rotation_degrees - degrees_two)
	if(degrees_one_difference == degrees_two_difference):
		if(prefers_clockwise):
			desired_rotation_pos = degrees_one
		else:
			desired_rotation_pos = degrees_two
	else:
		desired_rotation_pos = degrees_one if degrees_one_difference < degrees_two_difference else degrees_two
	print()

func apply_force(delta):
	var rotation_difference = desired_rotation_pos - rotation_degrees
	var rotation_sign = 0 if rotation_difference == 0 else rotation_difference/abs(rotation_difference)
	var target_speed = clamp(abs(rotation_difference), 0, max_rotation_speed)
	var target_velocity = target_speed * rotation_sign
	var velocity_difference = target_velocity - rotation_velocity
	var acceleration_sign = 0 if velocity_difference == 0 else velocity_difference / abs(velocity_difference)
	var acceleration = acceleration_sign * accel
	var delta_v = delta * acceleration
	delta_v = clamp(delta_v, -1 * abs(rotation_difference), abs(rotation_difference))
	rotation_velocity += delta_v
	rotation_velocity = rotation_velocity / 1.05
	if(abs(rotation_difference) < 0.75 && abs(rotation_velocity) < 0.75):
		rotation_velocity = 0
		rotation_degrees = desired_rotation_pos
	rotation_velocity = clamp(rotation_velocity, -1 * max_rotation_speed, max_rotation_speed)
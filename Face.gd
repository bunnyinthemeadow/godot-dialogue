extends Control

var left_eye
var right_eye

var temp

func _ready():
	left_eye = get_node("Eyes Controller/Left Eye Controller")
	right_eye = get_node("Eyes Controller/Right Eye Controller")
	set_scared_face()
	temp = 0.0
	
func _process(delta):
	temp += delta
	if temp > 21:
		set_happy_face()
	elif temp > 18:
		set_angry_face()
	elif temp > 15:
		set_bored_face()
	elif temp > 12:
		set_scared_face()
	elif temp > 9:
		set_happy_face()
	elif temp > 6:
		set_angry_face()
	elif temp > 3:
		set_bored_face()

func set_happy_face():
	left_eye.set_desired_rotation(0)
	right_eye.set_desired_rotation(0)

func set_bored_face():
	left_eye.set_desired_rotation(180)
	right_eye.set_desired_rotation(180)

func set_angry_face():
	left_eye.set_desired_rotation(90)
	right_eye.set_desired_rotation(-90)
	
func set_scared_face():
	left_eye.set_desired_rotation(-90)
	right_eye.set_desired_rotation(90)

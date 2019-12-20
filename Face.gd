extends Control

var left_eye
var right_eye
var mouth

var temp

func _ready():
	left_eye = get_node("Eyes Controller/Left Eye Controller")
	right_eye = get_node("Eyes Controller/Right Eye Controller")
	mouth = get_node("Mouth Controller/Mouth")
	set_angry_face()
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
	elif temp > 1:
		set_scared_face()
		temp -= 1000

func set_happy_face():
	left_eye.set_desired_rotation(0)
	right_eye.set_desired_rotation(0)
	mouth.set_desired_size(Vector2(65, 17))

func set_bored_face():
	left_eye.set_desired_rotation(180)
	right_eye.set_desired_rotation(180)
	mouth.set_desired_size(Vector2(65, 17))

func set_angry_face():
	left_eye.set_desired_rotation(90)
	right_eye.set_desired_rotation(-90)
	mouth.set_desired_size(Vector2(55, 17))
	
func set_scared_face():
	left_eye.set_desired_rotation(-90)
	right_eye.set_desired_rotation(90)
	mouth.set_desired_size(Vector2(65, 25))

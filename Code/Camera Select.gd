extends Control


func _on_Main_pressed():
	get_node("../../Cameras/Main").make_current()


func _on_Top_pressed():
	get_node("../../Cameras/Top-Down").make_current()


func _on_Right_pressed():
	get_node("../../Cameras/Right-Side").make_current()


func _on_Left_pressed():
	get_node("../../Cameras/Left-Side").make_current()

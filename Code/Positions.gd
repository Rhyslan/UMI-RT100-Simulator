extends Control


onready var RT100 = $"../../UMI RT100"

enum {ZED, SHOULDER, ELBOW, YAW, PITCH, ROLL, GRIPPER}


func _on_Z_Slider_value_changed(value):
	$"Zed/Z Value".text = "Value: " + str(value)
	RT100.changePos(ZED, value)


func _on_Z_Reset_pressed():
	$"Zed/Z Slider".value = -19
	RT100.changePos(ZED, 19)


func _on_S_Slider_value_changed(value):
	$"Shoulder/S Value".text = "Value: " + str(value)
	RT100.changePos(SHOULDER, value)


func _on_S_Reset_pressed():
	$"Shoulder/S Slider".value = 0
	RT100.changePos(SHOULDER, 0)


func _on_E_Slider_value_changed(value):
	$"Elbow/E Value".text = "Value: " + str(value)
	RT100.changePos(ELBOW, value)


func _on_E_Reset_pressed():
	$"Elbow/E Slider".value = 0
	RT100.changePos(ELBOW, 0)


func _on_Y_Slider_value_changed(value):
	$"Yaw/Y Value".text = "Value: " + str(value)
	RT100.changePos(YAW, value)


func _on_Y_Reset_pressed():
	$"Yaw/Y Slider".value = 0
	RT100.changePos(YAW, 0)


func _on_P_Slider_value_changed(value):
	$"Pitch/P Value".text = "Value: " + str(value)
	RT100.changePos(PITCH, value)


func _on_P_Reset_pressed():
	$"Pitch/P Slider".value = 0
	RT100.changePos(PITCH, 0)


func _on_R_Slider_value_changed(value):
	$"Roll/R Value".text = "Value: " + str(value)
	RT100.changePos(ROLL, value)


func _on_R_Reset_pressed():
	$"Roll/R Slider".value = 0
	RT100.changePos(ROLL, 0)


func _on_G_Slider_value_changed(value):
	$"Gripper/G Value".text = "Value: " + str(value)
	RT100.changePos(GRIPPER, value)


func _on_G_Reset_pressed():
	$"Gripper/G Slider".value = 0
	RT100.changePos(GRIPPER, 0)

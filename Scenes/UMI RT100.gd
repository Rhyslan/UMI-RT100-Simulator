extends Spatial


var pitch = 0
var roll = 0
var k = 0.07415

enum {ZED, SHOULDER, ELBOW, YAW, PITCH, ROLL, GRIPPER}


func changePos(joint, position):
	var w1 = 0
	var w2 = 0
	
	var tween = get_tree().create_tween()

	match joint:
		ZED:
			# DEBUG: print("moving zed to " + str(position))
			tween.tween_property($RT100/Body/Zed/Shoulder, "translation", Vector3(0, (position * 0.00012287676) + 0.22, 0.07), 1)
		SHOULDER:
			# DEBUG: print("moving shoulder to " + str(position))
			tween.tween_property($"RT100/Body/Zed/Shoulder/Upper Arm", "rotation_degrees", Vector3(0, (position * 0.03422) - 90, 0), 1)
		ELBOW:
			# DEBUG: print("moving elbow to " + str(position))
			tween.tween_property($"RT100/Body/Zed/Shoulder/Upper Arm/Lower Arm", "rotation_degrees", Vector3(0, position * 0.06844, 0), 1)
		YAW:
			# DEBUG: print("Moving yaw to " + str(position))
			tween.tween_property($"RT100/Body/Zed/Shoulder/Upper Arm/Lower Arm/Yaw", "rotation_degrees", Vector3(0, (position * 0.10267) + 90, 0), 1)
		PITCH:
			# DEBUG: print("moving pitch to " + str(position))
			pitch = position
			w1 = roll + position
			w2 = -roll + position
			tween.tween_property($"RT100/Body/Zed/Shoulder/Upper Arm/Lower Arm/Yaw/Pitch", "rotation_degrees", Vector3(0, 90, (-((w1 + w2) * k) / 2) - 90), 1)
			# DEBUG: print(str(w1) + " : " + str(w2))
		ROLL:
			# DEBUG: print("moving roll to " + str(position))
			roll = position
			w1 = pitch + position
			w2 = pitch + -position
			tween.tween_property($"RT100/Body/Zed/Shoulder/Upper Arm/Lower Arm/Yaw/Pitch/Roll", "rotation_degrees", Vector3(0, (-((w1 - w2) * k) / 2), 0), 1)
			# DEBUG: print(str(w1) + " : " + str(w2))
		GRIPPER:
			print("moving gripper to " + str(position)) # Not yet implemented
		_:
			print("invalid joint")

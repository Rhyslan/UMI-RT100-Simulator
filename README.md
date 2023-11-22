# UMI-RT100-Simulator
 A simulation of the RT100 robot made in Godot 3.5. Available joints include Zed, Shoulder, Elbow, (Wrist) Yaw, (Wrist) Pitch and (Wrist) Roll. Gripper is currently not implemented. 'True' refers to the value in the real world, while 'Simulated' referes to the value within Godot.

## Position Values
All joint values are in encoder counts (c). Conversions are shown below:

### Zed
| True Distance per <br/> Encoder Count (mm) | True Conversion | Simulated Distance <br/> per Encoder Count | Simulated Conversion*      |
| :----------------------------------------: | :-------------: | :----------------------------------------: | :------------------------: |
| 0.2667                                     | c * 0.2667      | 0.22012287676                              | (c * 0.00012287676) + 0.22 |

<sup>* Includes offset used necessary to achieve home position in simulation</sup>

### Shoulder, Elbow and Yaw
| Joint    | Degrees per <br/> Encoder Count | Conversion  | Simulated Conversion* |
| :------: | :-----------------------------: | :---------: | :-------------------: |
| Shoulder | 0.03422                         | c * 0.03422 | (c * 0.03422) - 90    |
| Elbow    | 0.06844                         | c * 0.06844 | c * 0.06844           |
| Yaw      | 0.10267                         | c * 0.10367 | (c * 0.10367) + 90    |

<sup>* Includes offset used necessary to achieve home position in simulation</sup>

### Pitch and Roll
Pitch and Roll are calculated from the encoder count of the two wrist motors (W1 and W2). The slider is not limited to the max and min values of either the Pitch, Roll, W1 or W2 encoder counts. The values of Pitch and Roll are stored in variables for the duration of the simulation. The values of W1 and W2 are only stored for the duration of the movement. Simulated Pitch and Roll are currently unfinished, conversions will be added once finished.

#### Pitch
The following pseudocode is used to control the pitch:
```
pitch_value = c
W1 = roll_value + c
W2 = (-1 * roll_value) + c
```
True Pitch in degrees is found by $\frac{(W1+W2)×k}{2}\$, where k = 0.07415

#### Roll
The following pseudocode is used to control the roll:
```
roll_value = c
W1 = pitch_value + c
W2 = pitch_value + (-1 * c)
```
True Roll in degrees is found by $\frac{(W1-W2)×k}{2}\$, where k = 0.07415

## Sources
- Robot 3D Model: https://grabcad.com/library/umi-rt100-1
- Materials: https://www.cgbookcase.com/, https://3dtextures.me/
- Robot conversion values: UMI RT100 User Manual (Physical Book)

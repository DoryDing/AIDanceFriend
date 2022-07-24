import json

def compareDanceCoordinates(dance1, dance2 = None):
    f1 = open(dance1)
    connections = {'leftArm': ['leftShoulder',' leftElbow'],
                   'leftForeArm': ['leftElbow,', 'leftWrist'],
                   'leftBody': ['leftShoulder', 'leftHip'],
                   'leftThigh': ['leftHip', 'leftKnee'],
                   'leftLeg': ['leftKnee', 'leftAnkle'],
                   'rightArm': ['rightShoulder', ' rightElbow'],
                   'rightForeArm': ['rightElbow,', 'rightWrist'],
                   'rightBody': ['rightShoulder', 'rightHip'],
                   'rightThigh': ['rightHip', 'rightKnee'],
                   'rightLeg': ['rightKnee', 'rightAnkle'],
                   'shoulders': ['leftShoulder', 'rightShoulder'],
                   'hips': ['leftHips', 'rightHip'],
                   'neck': ['nose', 'middleOfShoulders']
                   }
    data1 = json.load(f1)
    for frame in data1.items():
        print(frame)

    if dance2 != None:
        f2 = open(dance2)
        data2 = json.load(f2)
compareDanceCoordinates("data.json")




import os
import cv2
import math
import numpy as np
import mediapipe as mp
desiredHeight = 480
desiredWidth = 480
def resizeAndShow(image):
    h, w = image.shape[:2]
    img = image
    #if h < w:
        #img = cv2.resize(image, (desiredWidth, math.floor(h / (w / desiredWidth))))
    #else:
        #img = cv2.resize(image, (math.floor(w / (h / desiredHeight)), desiredHeight))
    cv2.imshow('Resized Image', img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
mpPose = mp.solutions.pose
mpDrawing = mp.solutions.drawing_utils
mpDrawingStyles = mp.solutions.drawing_styles

mpSelfieSegment = mp.solutions.selfie_segmentation

IMAGE_FILES = [r"keyframes/frames1.jpg", r"keyframes/frames2.jpg"]
def drawPose(file):
    with mpPose.Pose(
        static_image_mode = True,
            min_detection_confidence = 0.5,
            model_complexity = 1,
            enable_segmentation = True
    ) as pose:

        for idx, file in enumerate(IMAGE_FILES):
            image = cv2.imread(file)
            h, w, _ = image.shape
            results = pose.process(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
            if not results.pose_landmarks:
                continue
            print(
                f'Nose coordinates: ('
                f'{results.pose_landmarks.landmark[mpPose.PoseLandmark.NOSE].x * w}, '
                f'{results.pose_landmarks.landmark[mpPose.PoseLandmark.NOSE].y * h})'
            )

            annotatedImage = image.copy()
            mpDrawing.draw_landmarks(
                annotatedImage,
                results.pose_landmarks,
                mpPose.POSE_CONNECTIONS,
                landmark_drawing_spec=mpDrawingStyles.get_default_pose_landmarks_style()
            )
            resizeAndShow(annotatedImage)
            print('Nose world landmark: '),
            print(results.pose_world_landmarks.landmark[mpPose.PoseLandmark.NOSE])
            mpDrawing.plot_landmarks(results.pose_world_landmarks, mpPose.POSE_CONNECTIONS)



            condition = np.stack((results.segmentation_mask,) * 3, axis=-1) > 0.1
            fg_image = np.zeros(image.shape, dtype=np.uint8)
            #fg_image[:] = (255, 255, 255)
            bg_image = np.zeros(image.shape, dtype=np.uint8)
            bg_image[:] = (192, 192, 192)
            output_image = np.where(condition, image, bg_image)
            resizeAndShow(output_image)

drawPose(IMAGE_FILES)
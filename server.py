import os
from flask import Flask, request,abort,jsonify

import AIBase
import main
import cv2

app = Flask(__name__)
app.config["UPLOAD_EXTENSIONS"] = ['.mov']

@app.route('/analize', methods = ['GET', 'POST'])

def edit_video():
    uploaded_video = request.files.getlist("video1")[0]
    uploaded_image = request.files.getlist("video2")[0]

    video1_filename = uploaded_video.filename
    video2_filename = uploaded_image.filename

    if video1_filename != '' and video2_filename != '':
        _, video_file_ext = os.path.splitext(video1_filename)
        _, image_file_ext = os.path.splitext(video2_filename)
        if image_file_ext not in app.config['UPLOAD_EXTENSIONS'] or video_file_ext not in app.config['UPLOAD_EXTENSIONS']:
            abort(400)
        uploaded_video.save(video1_filename)
        uploaded_image.save(video2_filename)

        score = main.main(video1_filename, video2_filename)
        result = AIBase.send_images_example(video1_filename, video2_filename)
        os.remove(video1_filename)
        os.remove(video2_filename)

        return jsonify(result, score)

if __name__ == "__main__":
    app.run(host = "0.0.0.0")
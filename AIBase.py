from firebaseStorage import StorageManager
import os


sm = StorageManager()

def send_images_example(vid1, vid2):
    '''public_urls = []
    #get the list of file store in the vid1 and vid2 directories
    vid1= os.listdir('/Users/doryding/PycharmProjects/Project/keyframes')
    vid2 = os.listdir('/Users/doryding/PycharmProjects/Project/coach')

    for i in range(len(vid1)):
        public_url1 = sm.upload_file(file_name=f'tennis/{vid1[i]}', local_path=f'/Users/doryding/PycharmProjects/Project/keyframes/{vid1[i]}')
        public_url2 = sm.upload_file(file_name=f'tennis/{vid2[i]}', local_path=f'/Users/doryding/PycharmProjects/Project/coach/{vid2[i]}')
        public_urls.append((public_url1,public_url2))'''

    public_urls = []
    public_url1 = sm.upload_file(file_name = 'dance/vid1', local_path = vid1)
    public_url2 = sm.upload_file(file_name='dance/vid2', local_path=vid2)
    public_urls.append((public_url1, public_url2))
    return public_urls
#
# print(send_images_example())
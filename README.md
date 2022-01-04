# Face Recognition System in Matlab

## Dependencies:

- Statistics and Machine Learning Toolbox

## Functions Description

### App entry - app

### Button Handlers
- add_image() - adds an image to directory 'profile' in the root file. It's purpose is to keep a single image for recognition. Each newly added image replaces the existing one.
- face_recognition() - performs face recognition of a previously added image.
- add_image_to_the_profile() - adds a single image to temporary profile. Each image is named accordingly to it's number in the directory (as count of files +1).
- add_profile() - adds a profile to the dataset, so it's all images become relevant in calculating the eigenfaces.

### Helper functions
- load_user_img() - provides an image added through the add_image() function in a formatted way to the face_recognition() function, as the tested image.
- load_data() - provides a set of images from the dataset folder to the face_recognition() function, as training set.
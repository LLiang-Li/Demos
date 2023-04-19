name = 'tiny-yolov3-coco';
detector = yolov3ObjectDetector(name);
camera = webcam; % Connect to the camera
while true
    img = snapshot(camera); 
    %%img = imresize(img,[640 960]);
    img = preprocess(detector,img);
    [bboxes,scores,labels] = detect(detector,double(img),'DetectionPreprocessing','none');
    detectedImg = insertObjectAnnotation(img,'Rectangle',bboxes,labels);
    imshow(detectedImg)
    pause(1)
end        
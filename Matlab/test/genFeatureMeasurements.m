function pixelMeasurements = genFeatureMeasurements(T_wCam_GT, landmarks_w, K, simSetup)
%Will return -1 if the feature cannot be seen

camRes = simSetup.cameraResolution;

pixelMeasurements = zeros(2, size(T_wCam_GT, 3));

% Extract all viewable measurements
for step_i = 1:size(T_wCam_GT,3)
        
        %Transform and project landmarks into the camera frame
        landmarks_cam = homo2cart(inv(T_wCam_GT(:,:,step_i))*cart2homo(landmarks_w));
        pixels = homo2cart(K*landmarks_cam);
        
        %Determine which landmarks are viewable and find their ids
        viewableLandmarksIdx = pixels(1,:) > 0 & pixels(1,:) < camRes(2) & pixels(2,:) > 0 & pixels(2,:) < camRes(1);
        viewableLandmarksIdx = viewableLandmarksIdx & landmarks_cam(3,:) > 0;
        
        
        %viewableLandmarkIds = find(viewableLandmarksIdx);
        %viewableLandmarkIds = viewableLandmarkIds(:);
        %viewableLandmarks = landmarks_cam(:, viewableLandmarksIdx);
        
        pixels(:, ~viewableLandmarksIdx) = -1;

        %Generate pixel noise
        n_p = simSetup.pixelNoiseStd*randn(2,size(pixelMeasurements,2)); %image noise        
      
        pixelMeasurements =  pixelMeasurements + n_p;
        
end


end


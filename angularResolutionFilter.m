function [blurredImageSet] = angularResolutionFilter(rez,FOV)

% Nate Raymondi - 9/21/2019 quick hack code

% This function reads in a .jpg file, standardizes it to a predefined
% field-of-view, and then filters the image to particular angles of
% angular resolution

% Inputs:
%   rez   - Nx1 vector of angular resolutions to filter
%   FOV   - field-of-view (in degrees) of the image

% Outputs:
%   blurredImageSet - saves all blurred Images
%   function also saves all blurred images into the original folder under
%   the name "angRez(rez).jpg"

% HARDCODED: the name of the image to be imported must be "image.jpg" lol


% import the image from folder
baselineImage = imread('streetView.jpg'); 

% plot the baseline image
figure; imshow(baselineImage); title('Baseline Image');
set(gcf,'color','w');
set(gcf, 'Position',  [50, 550, 800, 400])

% convert to FOV degree field-of-view 
pixelsPerAngle = floor(length(baselineImage)/FOV);

blurredImageSet = zeros([size(baselineImage), length(rez)]);
for i = 1:length(rez)
    % specify angular resolution in degrees
    rezRun = rez(i); 

    % blur the image
    windowWidth = rezRun * pixelsPerAngle;
    kernel = ones(windowWidth) / windowWidth ^ 2;
    blurredImage = imfilter(baselineImage, kernel);

    % plot the blurred image
    figure; imshow(blurredImage); title(['Angular Rez - ',num2str(rezRun),'^\circ']);
    set(gcf,'color','w');
    
    % save the blurred image for later
    blurredImageSet(:,:,:,i) = blurredImage;
    
    % save image to the folder
    imwrite(blurredImage, ['angRez',num2str(rezRun),'.jpg'], 'jpg');
end

end


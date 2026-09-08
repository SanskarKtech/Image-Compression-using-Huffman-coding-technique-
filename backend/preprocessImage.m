function grayImage = preprocessImage(inputImage)
% Convert RGB input to grayscale. Keep grayscale input unchanged.

if ndims(inputImage) == 3
    grayImage = rgb2gray(inputImage);
else
    grayImage = inputImage;
end

grayImage = uint8(grayImage);
end

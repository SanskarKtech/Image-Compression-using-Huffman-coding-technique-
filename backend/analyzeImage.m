function info = analyzeImage(originalImage, grayImage, fileName)
% Collect image information used by the GUI and report.

info.fileName = fileName;
info.originalRows = size(originalImage, 1);
info.originalCols = size(originalImage, 2);
info.grayRows = size(grayImage, 1);
info.grayCols = size(grayImage, 2);
info.totalPixels = numel(grayImage);
info.imageType = ternaryString(ndims(originalImage) == 3, ...
    'RGB Color Image', 'Grayscale Image');
info.processingType = 'Grayscale image used for Huffman coding';
info.numberOfIntensityLevels = numel(unique(grayImage(:)));
info.originalClass = class(originalImage);
end

function out = ternaryString(condition, a, b)
if condition
    out = a;
else
    out = b;
end
end

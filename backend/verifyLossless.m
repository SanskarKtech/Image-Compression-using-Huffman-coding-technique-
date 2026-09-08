function result = verifyLossless(originalImage, reconstructedImage)
result = isequal(uint8(originalImage), uint8(reconstructedImage));
end

function metrics = calculateMetrics(grayImage, analysis, imagePath)
% Calculate compression and source-coding metrics.
% File size is reported separately from theoretical encoded size because
% a real compressed file also needs metadata such as the Huffman tree.

totalPixels = numel(grayImage);
originalBits = totalPixels * 8;
encodedBits = analysis.encodedBitCount;

metrics.originalSizeBits = originalBits;
metrics.encodedDataBits = encodedBits;
metrics.originalSizeKB = originalBits / 8 / 1024;
metrics.encodedDataSizeKB = encodedBits / 8 / 1024;

if encodedBits > 0
    metrics.compressionRatio = originalBits / encodedBits;
    metrics.compressionPercentage = (1 - encodedBits/originalBits) * 100;
else
    metrics.compressionRatio = Inf;
    metrics.compressionPercentage = 100;
end

metrics.savedSpaceKB = metrics.originalSizeKB - metrics.encodedDataSizeKB;
metrics.entropy = analysis.entropy;
metrics.averageCodeLength = analysis.averageCodeLength;

if metrics.averageCodeLength > 0
    metrics.codingEfficiency = ...
        (metrics.entropy / metrics.averageCodeLength) * 100;
else
    metrics.codingEfficiency = 0;
end

metrics.averageBitsPerPixel = encodedBits / totalPixels;

% A useful engineering estimate of tree overhead.
% Each leaf stores an 8-bit symbol plus a 1-bit leaf marker in a compact
% tree representation. This is an estimate, not the exact MATLAB file size.
leafCount = numel(analysis.uniqueSymbols);
metrics.estimatedTreeOverheadBits = leafCount * 9;
metrics.estimatedTotalCompressedBits = ...
    encodedBits + metrics.estimatedTreeOverheadBits;
metrics.estimatedTotalCompressedSizeKB = ...
    metrics.estimatedTotalCompressedBits / 8 / 1024;

if metrics.estimatedTotalCompressedBits > 0
    metrics.realisticCompressionRatio = ...
        originalBits / metrics.estimatedTotalCompressedBits;
else
    metrics.realisticCompressionRatio = Inf;
end

metrics.inputFileBytes = dir(imagePath).bytes;
end

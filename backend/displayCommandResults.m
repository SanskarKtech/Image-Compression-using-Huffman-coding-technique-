function displayCommandResults(file, info, analysis, metrics, ...
    isLossless, encodingTime, decodingTime)

fprintf('\n============================================================\n');
fprintf('        HUFFMAN IMAGE COMPRESSION - BACKEND RESULTS\n');
fprintf('============================================================\n');

fprintf('\nIMAGE INFORMATION\n');
fprintf('------------------------------------------------------------\n');
fprintf('Image Name             : %s\n', file);
fprintf('Image Type             : %s\n', info.imageType);
fprintf('Resolution             : %d x %d pixels\n', info.grayRows, info.grayCols);
fprintf('Total Pixels           : %d\n', info.totalPixels);
fprintf('Unique Intensity Levels: %d\n', info.numberOfIntensityLevels);

fprintf('\nHUFFMAN CALCULATION\n');
fprintf('------------------------------------------------------------\n');
fprintf('Source Entropy         : %.6f bits/pixel\n', metrics.entropy);
fprintf('Average Code Length    : %.6f bits/pixel\n', metrics.averageCodeLength);
fprintf('Coding Efficiency      : %.3f %%\n', metrics.codingEfficiency);

fprintf('\nCOMPRESSION\n');
fprintf('------------------------------------------------------------\n');
fprintf('Original Data          : %.2f KB\n', metrics.originalSizeKB);
fprintf('Encoded Bitstream      : %.2f KB\n', metrics.encodedDataSizeKB);
fprintf('Encoded Bits           : %d\n', metrics.encodedDataBits);
fprintf('Compression Ratio      : %.3f : 1\n', metrics.compressionRatio);
fprintf('Compression Percentage : %.3f %%\n', metrics.compressionPercentage);
fprintf('Estimated Tree Overhead: %d bits\n', metrics.estimatedTreeOverheadBits);
fprintf('Estimated Total Size   : %.2f KB\n', ...
    metrics.estimatedTotalCompressedSizeKB);
fprintf('Realistic Ratio        : %.3f : 1\n', ...
    metrics.realisticCompressionRatio);

fprintf('\nEXECUTION\n');
fprintf('------------------------------------------------------------\n');
fprintf('Encoding Time          : %.6f s\n', encodingTime);
fprintf('Decoding Time          : %.6f s\n', decodingTime);

fprintf('\nLOSSLESS VERIFICATION\n');
fprintf('------------------------------------------------------------\n');
if isLossless
    fprintf('Status                 : PASS - Reconstruction is identical\n');
else
    fprintf('Status                 : FAIL - Reconstruction differs\n');
end

fprintf('\n============================================================\n');
fprintf('Use the GUI buttons to inspect the Huffman merge calculations,\n');
fprintf('code table, tree and encoded bitstream.\n');
fprintf('============================================================\n\n');
end

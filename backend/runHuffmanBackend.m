function analysis = runHuffmanBackend(grayImage)
% Complete backend Huffman calculation.
% This function deliberately exposes the algorithmic stages.

symbols = grayImage(:);
[uniqueSymbols, ~, idx] = unique(symbols);
counts = accumarray(idx, 1);
probabilities = counts / numel(symbols);

% Entropy
nonzero = probabilities > 0;
entropy = -sum(probabilities(nonzero) .* log2(probabilities(nonzero)));

% Build Huffman tree and record every merge.
tree = buildHuffmanTree(uniqueSymbols, probabilities);

% Generate binary codes from the tree.
codes = generateHuffmanCodes(tree);

% Encode and decode timing.
tic;
encodedData = encodeImage(symbols, uniqueSymbols, codes);
encodingTime = toc;

tic;
decodedSymbols = decodeHuffmanData(encodedData, tree);
decodingTime = toc;

% Backend table
codeLengths = zeros(numel(uniqueSymbols), 1);
codeStrings = cell(numel(uniqueSymbols), 1);

for k = 1:numel(uniqueSymbols)
    codeLengths(k) = numel(codes{k});
    codeStrings{k} = sprintf('%d', codes{k});
end

averageCodeLength = sum(probabilities .* codeLengths);

analysis.symbols = symbols;
analysis.uniqueSymbols = uniqueSymbols;
analysis.counts = counts;
analysis.probabilities = probabilities;
analysis.entropy = entropy;
analysis.tree = tree;
analysis.codes = codes;
analysis.codeStrings = codeStrings;
analysis.codeLengths = codeLengths;
analysis.averageCodeLength = averageCodeLength;
analysis.encodedData = encodedData;
analysis.encodedBitCount = numel(encodedData);
analysis.decodedSymbols = decodedSymbols;
analysis.encodingTime = encodingTime;
analysis.decodingTime = decodingTime;
analysis.rows = size(grayImage, 1);
analysis.cols = size(grayImage, 2);
analysis.totalPixels = numel(grayImage);
analysis.huffmanTable = [double(uniqueSymbols), counts, probabilities, ...
                         codeLengths];
end

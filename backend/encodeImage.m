function encodedData = encodeImage(symbols, uniqueSymbols, codes)
% Encode image symbols into a binary vector.
% Uses direct lookup rather than repeatedly searching the dictionary.

% uniqueSymbols correspond to leaf node IDs/codes.
[~, symbolIndex] = ismember(symbols, uniqueSymbols);

lengths = zeros(numel(symbolIndex), 1);
for k = 1:numel(symbolIndex)
    lengths(k) = numel(codes{symbolIndex(k)});
end

totalBits = sum(lengths);
encodedData = zeros(1, totalBits, 'uint8');

position = 1;
for k = 1:numel(symbolIndex)
    code = uint8(codes{symbolIndex(k)});
    L = numel(code);

    if L > 0
        encodedData(position:position+L-1) = code;
        position = position + L;
    end
end
end

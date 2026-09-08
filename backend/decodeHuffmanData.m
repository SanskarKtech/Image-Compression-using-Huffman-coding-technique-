function decodedSymbols = decodeHuffmanData(encodedData, tree)
% Decode a binary vector by walking the Huffman tree.

if numel(tree.nodes) == 1
    % A one-symbol source is encoded with the single code [0].
    % The caller should provide the expected pixel count in this case;
    % use the number of encoded bits as a practical count fallback.
    decodedSymbols = repmat(tree.nodes(1).symbol, 1, max(1, numel(encodedData)));
    return;
end

% First pass estimates decoded count by reaching leaves.
decoded = zeros(1, max(1, numel(encodedData)), 'double');
count = 0;
nodeID = tree.root;

for k = 1:numel(encodedData)
    if encodedData(k) == 0
        nodeID = tree.nodes(nodeID).left;
    else
        nodeID = tree.nodes(nodeID).right;
    end

    if tree.nodes(nodeID).isLeaf
        count = count + 1;
        decoded(count) = tree.nodes(nodeID).symbol;
        nodeID = tree.root;
    end
end

decodedSymbols = decoded(1:count);
end

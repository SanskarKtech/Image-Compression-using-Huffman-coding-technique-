function codes = generateHuffmanCodes(tree)
% Generate variable-length binary Huffman codes by traversing the tree.

leafNodes = find([tree.nodes.isLeaf]);
maxSymbol = numel(leafNodes);

% Codes are indexed according to the leaf node's original symbol order.
codes = cell(maxSymbol, 1);

if numel(tree.nodes) == 1
    codes{1} = 0;
    return;
end

rootCode = [];
codes = assignCodes(tree.root, rootCode, tree, codes);

% Reorder codes according to leaf node IDs. Leaf IDs are created in the
% same order as the unique-symbol input.
end

function codes = assignCodes(nodeID, currentCode, tree, codes)
node = tree.nodes(nodeID);

if node.isLeaf
    codes{nodeID} = currentCode;
    return;
end

codes = assignCodes(node.left, [currentCode 0], tree, codes);
codes = assignCodes(node.right, [currentCode 1], tree, codes);
end

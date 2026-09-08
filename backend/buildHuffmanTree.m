function tree = buildHuffmanTree(symbols, probabilities)
% Build a binary Huffman tree without using huffmandict().
% mergeLog records the actual calculations for display.

n = numel(symbols);

if n == 0
    error('No symbols were supplied.');
end

% Special case: an image containing only one intensity.
if n == 1
    nodes = struct('id', 1, 'symbol', double(symbols(1)), ...
        'probability', probabilities(1), 'left', 0, 'right', 0, ...
        'isLeaf', true);
    tree.nodes = nodes;
    tree.root = 1;
    tree.mergeLog = struct([]);
    return;
end

% Node storage.
maxNodes = 2*n - 1;
nodes(1:maxNodes) = struct( ...
    'id', 0, 'symbol', -1, 'probability', 0, ...
    'left', 0, 'right', 0, 'isLeaf', false);

active = zeros(1, n);

for k = 1:n
    nodes(k).id = k;
    nodes(k).symbol = double(symbols(k));
    nodes(k).probability = probabilities(k);
    nodes(k).isLeaf = true;
    active(k) = k;
end

mergeLog(1:n-1) = struct( ...
    'step', 0, 'leftID', 0, 'rightID', 0, ...
    'leftProbability', 0, 'rightProbability', 0, ...
    'newProbability', 0, 'newID', 0);

nodeCount = n;

for step = 1:n-1
    % Sort active nodes by probability, then ID for deterministic output.
    active = sortActiveNodes(active, nodes);

    leftID = active(1);
    rightID = active(2);

    nodeCount = nodeCount + 1;
    newProbability = nodes(leftID).probability + ...
                     nodes(rightID).probability;

    nodes(nodeCount).id = nodeCount;
    nodes(nodeCount).symbol = -1;
    nodes(nodeCount).probability = newProbability;
    nodes(nodeCount).left = leftID;
    nodes(nodeCount).right = rightID;
    nodes(nodeCount).isLeaf = false;

    mergeLog(step).step = step;
    mergeLog(step).leftID = leftID;
    mergeLog(step).rightID = rightID;
    mergeLog(step).leftProbability = nodes(leftID).probability;
    mergeLog(step).rightProbability = nodes(rightID).probability;
    mergeLog(step).newProbability = newProbability;
    mergeLog(step).newID = nodeCount;

    active = [active(3:end), nodeCount]; %#ok<AGROW>
end

tree.nodes = nodes(1:nodeCount);
tree.root = nodeCount;
tree.mergeLog = mergeLog;
end

function active = sortActiveNodes(active, nodes)
prob = zeros(size(active));
ids = zeros(size(active));

for k = 1:numel(active)
    prob(k) = nodes(active(k)).probability;
    ids(k) = nodes(active(k)).id;
end

[~, order] = sortrows([prob(:), ids(:)], [1 2]);
active = active(order);
end

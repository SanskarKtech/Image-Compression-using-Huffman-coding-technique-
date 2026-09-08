function showHuffmanTree(tree)
% Visualize the actual Huffman merge process as a tree-like diagram.
% For many image symbols, the plot becomes crowded, so the merge table is
% also provided.

fig = figure('Name','Huffman Tree and Merge Process','NumberTitle','off', ...
    'Color','white','Position',[70 60 1250 760]);

n = numel(tree.mergeLog);

mergeData = cell(n,7);
for k=1:n
    m = tree.mergeLog(k);
    mergeData{k,1}=m.step;
    mergeData{k,2}=m.leftID;
    mergeData{k,3}=m.leftProbability;
    mergeData{k,4}=m.rightID;
    mergeData{k,5}=m.rightProbability;
    mergeData{k,6}=m.newID;
    mergeData{k,7}=m.newProbability;
end

uicontrol('Style','text','Parent',fig,'Units','normalized', ...
    'Position',[0.08 0.93 0.84 0.05], ...
    'String','STEP-BY-STEP HUFFMAN NODE MERGING', ...
    'FontSize',17,'FontWeight','bold','BackgroundColor','white');

uitable('Parent',fig,'Units','normalized','Position',[0.05 0.48 0.90 0.40], ...
    'Data',mergeData, ...
    'ColumnName',{'Step','Left Node','Left P','Right Node','Right P', ...
                  'New Node','New P'}, ...
    'ColumnWidth',{70,90,110,90,110,100,110},'FontSize',9);

% Show a compact textual tree traversal.
treeText = buildTreeText(tree,tree.root,0,'ROOT');
uicontrol('Style','edit','Parent',fig,'Units','normalized', ...
    'Position',[0.05 0.05 0.90 0.36], ...
    'String',treeText,'Max',20,'Min',0,'Enable','inactive', ...
    'HorizontalAlignment','left','FontName','Courier New', ...
    'FontSize',9,'BackgroundColor','white');
end

function textOut = buildTreeText(tree,nodeID,depth,branch)
node = tree.nodes(nodeID);
indent = repmat('    ',1,depth);

if node.isLeaf
    line = sprintf('%s%s -> symbol=%d, P=%.8f', ...
        indent,branch,node.symbol,node.probability);
else
    line = sprintf('%s%s -> internal node %d, P=%.8f', ...
        indent,branch,node.id,node.probability);
end

textOut = {line};

if ~node.isLeaf
    leftText = buildTreeText(tree,node.left,depth+1,'0');
    rightText = buildTreeText(tree,node.right,depth+1,'1');
    textOut = [textOut; leftText; rightText]; %#ok<AGROW>
end
end

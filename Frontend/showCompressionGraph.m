function showCompressionGraph(metrics)
figure('Name','Compression Comparison','NumberTitle','off', ...
    'Color','white','Position',[300 200 800 550]);

values = [metrics.originalSizeKB metrics.encodedDataSizeKB ...
          metrics.estimatedTotalCompressedSizeKB];

bar(values);
set(gca,'XTick',1:3,'XTickLabel', ...
    {'Original Raw','Encoded Stream','Encoded + Tree Estimate'});
ylabel('Size (KB)');
title('Huffman Compression Size Comparison');
grid on;

for k=1:3
    text(k,values(k),sprintf(' %.3f KB',values(k)), ...
        'HorizontalAlignment','center','VerticalAlignment','bottom', ...
        'FontWeight','bold');
end
end

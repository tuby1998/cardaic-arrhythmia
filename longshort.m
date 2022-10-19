
%%
%construction of LSTM
%
layers = [ ...
    sequenceInputLayer(10,'Normalization','rescale-symmetric')
    bilstmLayer(100,'OutputMode','last')
    dropoutLayer(0.2)
    fullyConnectedLayer(5)
    softmaxLayer
    classificationLayer
    ];
%
options = trainingOptions('adam', ...
    'MaxEpochs',10, ...
    'MiniBatchSize', 40, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 16, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);
%
%%
%train LSTM
net = trainNetwork(XTrain,YTrain,layers,options);
%
%%
%visualize training Accuracy
trainPred = classify(net,XTrain,'SequenceLength',16);
LSTMAccuracytr = sum(trainPred == YTrain)/numel(YTrain)*100;
figure
confusionchart(YTrain,trainPred,'ColumnSummary','column-normalized',...
              'RowSummary','row-normalized','Title','Confusion Chart for LSTM(tr)');
%
%%
% %visualize testing Accuracy
% tic
% testPred = classify(net,XTest,'SequenceLength',16);
% toc
% LSTMAccuracyte = sum(testPred == YTest)/numel(YTest)*100;
% figure
% confusionchart(YTest,testPred,'ColumnSummary','column-normalized',...
%               'RowSummary','row-normalized','Title','Confusion Chart for LSTM(te)');
% % %
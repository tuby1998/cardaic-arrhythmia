wfdb2mat('mitdb/234')
load('234m.mat');
a=val(1,:);

% b=val(2,:);

a1 = wdenoise(a,14, ...
    'Wavelet', 'db10', ...
    'DenoisingMethod', 'Bayes', ...
    'ThresholdRule', 'Median', ...
    'NoiseEstimate', 'LevelIndependent');

% b1 = wdenoise(b,14, ...
%     'Wavelet', 'db10', ...
%     'DenoisingMethod', 'Bayes', ...
%     'ThresholdRule', 'Median', ...
%     'NoiseEstimate', 'LevelIndependent');
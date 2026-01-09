clc;
clear;
close all;


fs = 360;                 
t = 0:1/fs:10;            
ecg = 1.2*sin(2*pi*1.2*t) ...
    + 0.25*sin(2*pi*2.4*t) ...
    + 0.1*randn(size(t));



hpFilt = designfilt('highpassiir', ...
    'FilterOrder', 4, ...
    'HalfPowerFrequency', 0.5, ...
    'SampleRate', fs);

lpFilt = designfilt('lowpassiir', ...
    'FilterOrder', 4, ...
    'HalfPowerFrequency', 40, ...
    'SampleRate', fs);

ecg_filt = filtfilt(lpFilt, filtfilt(hpFilt, ecg));



threshold = 0.5 * max(ecg_filt);

[peaks, locs] = findpeaks(ecg_filt, ...
    'MinPeakHeight', threshold, ...
    'MinPeakDistance', round(0.6 * fs));



RR_intervals = diff(locs) / fs;   


figure;
plot(RR_intervals, '-o');
xlabel('Beat Number');
ylabel('RR Interval (s)');
title('RR Interval Tachogram');
grid on;


scriptDir = fileparts(mfilename('fullpath'));
resultsDir = fullfile(scriptDir, '..', 'results');
if ~exist(resultsDir, 'dir')
    mkdir(resultsDir);
end
saveas(gcf, fullfile(resultsDir, 'rr_intervals.png'));


mean_RR = mean(RR_intervals);


SDNN = std(RR_intervals);


RMSSD = sqrt(mean(diff(RR_intervals).^2));


fprintf('Mean RR Interval: %.4f s\n', mean_RR);
fprintf('SDNN: %.4f s\n', SDNN);
fprintf('RMSSD: %.4f s\n', RMSSD);


figure;
bar([mean_RR, SDNN, RMSSD]);
set(gca, 'XTickLabel', {'Mean RR', 'SDNN', 'RMSSD'});
ylabel('Time (s)');
title('HRV Time-Domain Parameters');
grid on;


scriptDir = fileparts(mfilename('fullpath'));
resultsDir = fullfile(scriptDir, '..', 'results');
saveas(gcf, fullfile(resultsDir, 'hrv_parameters.png'));

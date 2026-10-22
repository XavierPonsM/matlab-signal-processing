duration = 1.0;
Fs = 96000;
n = 0:1:duration*Fs-(1/Fs);
recorder = audiorecorder(Fs, 16, 1);
[gainDB, Fg, satura] = frequencyResponse (Fs, duration, n, recorder);

if satura
    disp('Ha saturat, baixa volum i repeteix la prova.');
end    

semilogx(Fg, gainDB, '-o'); axis tight; grid on; title 'Frequency Response'; 
                            xlabel 'Frequency'; ylabel 'Gain';
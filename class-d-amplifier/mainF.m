clear all
A=1.0;
C = 470e-9;
L = 22e-6;
R=4;
gain = 2;

Fst=44000000;
fo_sin=500;
fo_trin=250000 ;


time = 0:1/Fst:1-1/Fst; 
interval = 1:70000;

%input
input = A*sin(2*pi*time*fo_sin);

%triangular
trin= fTriangular(A, fo_trin, time); 

%comparador - PWM
s_comp=fComparador(input, trin, Fst);

%power ampli
powerAmp=s_comp*gain;

%LowPassFilter - Output
[output,Hz]=l_p_f(powerAmp, Fst, L, C, R);

%FOURIER TRANSFORM
[Fin, Ft, FtpowerAmp, Ftoutput]= signals_fft (input, trin, powerAmp, output);

%PLOT
figure('Name', 'Time domain');
plot_timeDomain (input, trin, s_comp, output, time, interval);

figure('Name', 'Freq domain')
plot_freqDomain(Fin, Ft, FtpowerAmp, Ftoutput, Hz, Fst);




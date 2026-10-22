%Inicializacion variables
clc
duration = 1.0;
Fthd = 3000;
Fs = 44100;
t = 0:(1/Fs):duration-(1/Fs); %inici:separacio:final
n = 0:1:duration*Fs-(1/Fs);

%Generamos un seno de frecuencia Fthd
sig = sin(2*pi*n*(Fthd/Fs));
recorder = audiorecorder(Fs, 16, 1);
Fin = fft(sig);
[Vfo,kfo] = max(abs(Fin));


%Reproducir el audio
Play_Obj = audioplayer(sig,Fs,16);   
record(recorder, duration);
playblocking(Play_Obj);  
stop(recorder);

%Grabar audio
y = getaudiodata(recorder);
NFFT = length(y); %freq

Fy = fft(y, length(sig)); %transformada de fourier per passar a domini freq
Fg = ((0:1/NFFT:duration-1/NFFT)*Fs).';                                                                                     

subplot(2,1,1);
plot(Fg, 20*log10(abs(Fy))); grid;
title('Transformada')

%Calculo THD
[THD, r] = F_thd(Fy,NFFT,kfo);
THD

%Funcion matlab para comprobar
THD1 = thd(y,44100,6);
percent_thd = 100*(10^(THD1/20));
percent_thd
%------------------------------

subplot(2,1,2);
plot(r); grid;
title('Armonicos')

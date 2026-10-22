%main1
clear all

A=1;
C = 470e-9;
L = 22e-5;
R=4;

Fs=44100;
Fst=44000000;
F=1000; %output net a 10000Hz, 100000Hz
Ftrin=100000;
Fot=5500000;

tt = 0:1/Fst:1-1/Fst; 
interval = 1:70000;

%input
input = A*sin(2*pi*tt*F);
subplot(3,2,1);
plot(tt(interval), input(interval)); grid on; axis tight; title Input; 

%triangular
trin= fTriangular(A, Ftrin, tt); 
subplot(3,2,2);
plot(tt(interval), trin(interval)); title Triangular;

%comparador - PWM
s_comp=fComparador(input, trin, Fst);
subplot(3,2,3); 
plot(tt(interval),s_comp(interval)); grid on; axis tight; title PWM;

%power ampli
s_power=s_comp*2;
subplot(3,2,4);
plot(tt(interval),s_power(interval)); grid on; axis tight; title PowerAmpli;

%LowPassFilter - Output
[y]=l_p_f(s_power, Fst, L, C, R);
subplot(3,1,3);
plot(tt(interval),y(interval)); grid on; axis tight; title Output;



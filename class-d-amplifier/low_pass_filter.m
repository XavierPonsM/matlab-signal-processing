%Low Pass Filter
Fs=96000;
%duration = 1.0;
n = 0:1:duration*Fs-(1/Fs);
t = 0:0.001:1; 
R = 4;
C = 470e-9;
L = 22e-6;
F = 1:100:Fs;
T = 1/Fs;
z= exp(1i*2*pi*F*T);
s = 1i *2*pi.*F;
%sig = sin(2*pi*t*111100);
figure('Name', 'LPF');
while R <= 16
    
    %Hs = 1/(L*C)*1./(s.^2+1/(R*C).*s+1/(L*C));
    numerador = 1 + 2*z.^-1 + z.^-2;
    denominador = (L*C*(2*Fs)^2+(L/R)*2*Fs+1) + (2-2*((2*Fs)^2)*L*C)* z.^-1 + (((2*Fs)^2)*L*C-2*Fs*L/R + 1)* z.^-2;
    %dB = 20*log10(abs(Hs));
    H = numerador./denominador;
    dBz = 20*log10(abs(H));
    %semilogx(F, dB); grid on;
    semilogx(F,dBz); axis tight; grid on;
    hold on;
    R=2*R;
    %subplot(2,1,2)   
end
hold off;
numerador = [1 2 1];
denominador = [(L*C*(2*Fs)^2+(L/R)*2*Fs+1) (2-2*((2*Fs)^2)*L*C) (((2*Fs)^2)*L*C-2*Fs*L/R + 1)];
y=filter(numerador,denominador,sig); %x es el senyal dentrada
%plot(t,y)
%legend('Rl = 4 ohm','Rl = 8 ohm', 'Rl = 16 ohm', 'Location', 'southwest')
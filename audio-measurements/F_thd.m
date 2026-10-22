function [thdValue,r] = F_thd(SignalOut,NFFT, kfo)
%F_THD Funcion para calcular la distorsion armonica total de una señal

%Variables internas
SignalOutput = SignalOut;
h=0;

%Amplitud de la fundamental
Vfo = max(abs(SignalOutput(kfo-10:kfo+10)));
Vfo

%Sumamos los armonicos al cuadrado
for i = 2*kfo:kfo:NFFT/2+10
    
    [maxIn, p] = max(abs(SignalOutput(i-10:i+10)));
    r(i+(p-10)) = maxIn;
    %maxIn
    h = h + (maxIn)^2;
    
end

thdValue = (sqrt(h)/Vfo)*100;

end


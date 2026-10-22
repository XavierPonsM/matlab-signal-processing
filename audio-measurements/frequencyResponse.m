function [GainDb, Fg, satura] = frequencyResponse(Fs, duration, n, recorder)

exp = 0;
j = 1;
satura = false;
cont = 0;
while 10*(2).^exp < Fs/2
    F = 10*(2).^exp;
    Fg(j) = F;
    
    sig = sin(2*pi*n*(F/Fs));
    
    Play_Obj = audioplayer(sig,Fs,16);   
    record(recorder, 1.2*duration);
    playblocking(Play_Obj);  
    stop(recorder);
    
    y = getaudiodata(recorder);
    
    controlSaturacio = max(y);
    
    if controlSaturacio >= 1.0
        cont = cont + 1;
    end
    
    Fsig = fft(sig, length(sig));
    Fy = fft(y, length(y));
    
    maxFsig(j) = max(abs(Fsig)); 
    maxFy(j) =max(abs(Fy));
   
    j=j+1;
    exp=exp+1;
end
if cont > 2
    satura = true;
end
GainDb = 20 * log10(maxFy./maxFsig);



end
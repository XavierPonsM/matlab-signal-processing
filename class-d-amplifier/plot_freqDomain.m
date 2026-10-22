function plot_freqDomain(Fin, Ft, FtPowerAmp, Ftoutput, Hz, Fst)
    
    interval = 1:Fst/2;
    
    %Input
    subplot(3,2,1);
    semilogx(abs(Fin)); grid on; axis tight; title 'Input FT';

    %Triangular
    subplot(3,2,2);
    semilogx(abs(Ft)); grid on; axis tight; title 'Triangular FT';
    
    %Power Amp
    subplot(3,2,3);
    semilogx((abs(FtPowerAmp))); grid on; axis tight; title 'Power & Filter FT';
    hold on
    
    %Filter
    subplot(3,2,3);
    semilogx(abs(Hz)); axis tight; grid on;
    hold off

    %Output
    subplot(3,2,4);
    semilogx(abs(Ftoutput)); grid on; axis tight; title 'Output FT';
    
    subplot(3,1,3);
    semilogx(20*log(abs(FtPowerAmp(interval)))); grid on; axis tight; title 'LOG Power & Filter FT';
    hold on
    %Filter
    subplot(3,1,3);
    semilogx(20*log10(abs(Hz(interval)))); axis tight; grid on;
    hold off
    ylim([-80,5]);
end
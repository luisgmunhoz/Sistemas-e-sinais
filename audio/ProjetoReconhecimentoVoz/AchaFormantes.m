function [f] = AchaFormantes(vogal, tentativa)
    t = linspace(0, 0.1, length(vogal{:,tentativa})); % definindo vetor tempo
    Vp = vogal{:,tentativa};
    Fs = 44100; % frequência de arquivo wav
%    Vp1 = Vp(20000:24409); % cortando o aúdio para análise com menor ruído para achar o f0
%    f(1) = mean(pitch(Vp1,Fs));


    Y0 = db(fftshift(abs(fft(vogal{:,tentativa})))); % fft em decibéis
    Y0 = Y0((floor(length(Y0)/2)):floor(0.625*length(Y0))); % pegando de 4/8 da fft a 5/8 da fft
    frequencia = linspace(0, 5512.5, length(Y0)); % vetor de frequências
    
    [Md,fp]=findpeaks(Y0,frequencia,'MinPeakDistance', 0.9 *100);
    

    Y0 = db(fftshift(abs(fft(vogal{:,tentativa}))));
    Y0 = Y0((floor(length(Y0)/2)):floor(0.625*length(Y0)));
    frequencia = linspace(0, 5512.5, length(Y0));
%% calculo f0
    fpa = fp(1:8);
    delta = diff(fpa);
    f(1) = mean(delta);

%% Formantes
    % filtro de predição linear
    fs = 44100;
    ncoeff = 2+fs/1000;           % regra geral para estimar a formante

    a=lpc(Vp,ncoeff);
   
    % achando frequências resolvendo as raízes
    
    r=roots(a);                  % acha raízes do polinômio a
    
    r=r(imag(r)>0.01);           % raízes maiores que 0 Hz até 22050 (fs/2)
    
    ffreq=sort(atan2(imag(r),real(r))*fs/(2*pi));     % convertendo para Hz e ordenando

    counter = 2;
    for ii=1:length(ffreq)
        f(counter) = ffreq(ii);
        counter = counter + 1;
        if(counter > 4);
            break;
        end
    end
end

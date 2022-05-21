%% ECM307-G01T02L03D - Atividade T3
%% Atividade T3 - Análise de Vogais
%% Luis Guilherme de Souza Munhoz RA: 20.01937-8 Lab: 3
%% Instruções

%%%% primeiro descomente a sessão de leitura
%%%% em seguida comente a sessão de análise
%%%% agora rode o código
%%%% depois comente a sessão de leitura e descomente a sessão de análise e
%%%% rode o código novamente
%% Boas Práticas

clc;                                       % limpa a tela
clear all;                                 % limpar as variáveis
close all;                                 % fecha as figuras abertas
%% Leitura das vogais e armazenamento em arquivo Vogais.mat

% prealocando
a = cell(1,5);
a{1,5} = [];

% prealocando
e = cell(1,5);
e{1,5} = [];

% prealocando
i = cell(1,5);
i{1,5} = [];

% prealocando
o = cell(1,5);
o{1,5} = [];

% prealocando
u = cell(1,5);
u{1,5} = [];

for ii = 1:5
%%%% Leitura da vogal a
    File = "a" + ii + ".wav";
    
    [Y,FS] = audioread(File);
    
    a{:,ii} = Y;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Leitura da vogal e
    File = "e" + ii + ".wav";

    [Y,FS] = audioread(File);
    

    e{:,ii} = Y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Leitura da vogal i
    File = "i" + ii + ".wav";

    [Y,FS] = audioread(File);

    i{:,ii} = Y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Leitura da vogal o
    File = "o" + ii + ".wav";

    [Y,FS] = audioread(File);

    o{:,ii} = Y;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Leitura da vogal u
    File = "u" + ii + ".wav";
    
    [Y,FS] = audioread(File);

    u{:,ii} = Y;

end
save('Vogais.mat', 'a', 'e', 'i', 'o', 'u');
%% Carregando o arquivo das vogais e as analisando

k = 0;
jj = 0;
% preallocation
a = cell(1,5);

% preallocation
e = cell(1,5);

% preallocation
i = cell(1,5);

% preallocation
o = cell(1,5);

% preallocation
u = cell(1,5);

load('Vogais.mat')
FS = 44100;
Ts = 1/FS;
% for ii = 1:5
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%% analise da vogal a    
%     %%%%% reduzindo o tamanho de a
%     N       = length(a{:,ii});               
%     Ts      = 1/FS;                     
%     ws      = 2*pi*FS;                
%     duracao = N*Ts;                    
%     tempo   = linspace(0,duracao,N);   
%     fmax    = FS/2;
%     k = k + 1;
% 
%     %%%% espectro de amplitude
% 
% 
%     figure(1)
%     frequencia = linspace(0,FS,N);
%     subplot(5,5,k);
%     plot(frequencia,fftshift(abs(fft(a{:,ii}))));
%     title("a" + ii);
% 
%     
%     %%%% plotando a série temporal
%     
% 
%     figure(2)
%     N       = length(a{:,ii});
%     duracao = N*Ts; 
%     tempo   = linspace(0,duracao,N);
%     subplot(5,5,k);
%     plot(tempo, a{:,ii});
%     title("a" + ii);
%     
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%% analise da vogal e    
%     %%%%% reduzindo o tamanho de e
%     
%     N       = length(e{:,ii});               
%     Ts      = 1/FS;                     
%     ws      = 2*pi*FS;                
%     duracao = N*Ts;                    
%     tempo   = linspace(0,duracao,N);   
%     fmax    = FS/2;
%     k = k + 1;
% 
%     %%%% espectro de amplitude
% 
% 
%     figure(1)
%     frequencia = linspace(0,FS,N);
%     subplot(5,5,k);
%     plot(frequencia,fftshift(abs(fft(e{:,ii}))));
%     title("e" + ii);
% 
%     
%     %%%% plotando a série temporal
%     
% 
%     figure(2)
%     N       = length(e{:,ii});
%     duracao = N*Ts; 
%     tempo   = linspace(0,duracao,N);
%     subplot(5,5,k);
%     plot(tempo, e{:,ii});
%     title("e" + ii);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%% analise da vogal i    
%     %%%%% reduzindo o tamanho de i
%     N       = length(i{:,ii});               
%     Ts      = 1/FS;                     
%     ws      = 2*pi*FS;                
%     duracao = N*Ts;                    
%     tempo   = linspace(0,duracao,N);   
%     fmax    = FS/2;
%     k = k + 1;
% 
%     %%%% espectro de amplitude
% 
% 
%     figure(1)
%     frequencia = linspace(0,FS,N);
%     subplot(5,5,k);
%     plot(frequencia,fftshift(abs(fft(i{:,ii}))));
%     title("i" + ii);
% 
%     
%     %%%% plotando a série temporal
%     
% 
%     figure(2)
%     N       = length(i{:,ii});
%     duracao = N*Ts; 
%     tempo   = linspace(0,duracao,N);
%     subplot(5,5,k);
%     plot(tempo, i{:,ii});
%     title("i" + ii);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%% analise da vogal o    
%     %%%%% reduzindo o tamanho de o
%     N       = length(o{:,ii});               
%     Ts      = 1/FS;                     
%     ws      = 2*pi*FS;                
%     duracao = N*Ts;                    
%     tempo   = linspace(0,duracao,N);   
%     fmax    = FS/2;
%     k = k + 1;
% 
%     %%%% espectro de amplitude
% 
% 
%     figure(1)
%     frequencia = linspace(0,FS,N);
%     subplot(5,5,k);
%     plot(frequencia,fftshift(abs(fft(o{:,ii}))));
%     title("o" + ii);
% 
%     
%     %%%% plotando a série temporal
%     
% 
%     figure(2)
%     N       = length(o{:,ii});
%     duracao = N*Ts; 
%     tempo   = linspace(0,duracao,N);
%     subplot(5,5,k);
%     plot(tempo, o{:,ii});
%     title("o" + ii);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%% analise da vogal u   
%     %%%%% reduzindo o tamanho de u
%     N       = length(u{:,ii});               
%     Ts      = 1/FS;                     
%     ws      = 2*pi*FS;                
%     duracao = N*Ts;                    
%     tempo   = linspace(0,duracao,N);   
%     fmax    = FS/2;
%     k = k + 1;
% 
%    %%%% espectro de amplitude
% 
% 
%     figure(1)
%     frequencia = linspace(-FS/2,FS/2,N);
%     subplot(5,5,k);
%     plot(frequencia,fftshift(abs(fft(u{:,ii}))));
%     title("u" + ii);
% 
%     
%     %%%% plotando a série temporal
%     
% 
%     figure(2)
%     N       = length(u{:,ii});
%     duracao = N*Ts; 
%     tempo   = linspace(0,duracao,N);
%     subplot(5,5,k);
%     plot(tempo, u{:,ii});
%     title("u" + ii);
% end
%% análise da primeira vogal a

figure(3);
t0 = 0.908329;
N       = length(a{:,1});
duracao = N*Ts; 
Vp = a{:,1}(39690:44999);
tempo   = linspace(0,duracao,N)-t0;
tempoa1 = linspace(tempo(39690), tempo(44999), length(Vp))

plot(tempoa1,Vp)

frequencia = linspace(0,FS/2,N/2);
frequencia = frequencia(0.4*N:0.42*N);
Y0 = abs(fft(a{:,1}));
Y0 = Y0(0.9*N:0.92*N);
plot(frequencia,fftshift((Y0)));
title("a"+ 1);
%% Modifica parâmetros do gráfico

set(findall(gcf,'Type','line'),'LineWidth',3);
set(gca,'FontSize',14,'LineWidth',2);

%%% Analisando os parâmteros graficamente

ti = 0.00174627;  % começo do primeiro período inteiro
tf = 0.109774;   % fim do último período inteiro

T = (tf-ti)/14; % valor médio dentre os 14 períodos
f = inv(T);     % frequência associada a vibração gerada

findpeaks(Vp,tempoa1,'MinPeakDistance',T);

[vt,tp]=findpeaks(Vp,tempoa1,'MinPeakDistance',T);

Tm =mean(diff(tp));

title('Sinal de voz para a vogal a');
xlabel('Tempo em s');
ylabel('Tensão em Volts'); 
grid minor

findpeaks(Y0,frequencia,'MinPeakDistance',0.9*f);

title('Espectro de amplitude da vogal a');
xlabel('Frequência em Hz');
ylabel('Magnitude em dB'); 
grid minor 

[Md,fp]=findpeaks(Y0,frequencia,'MinPeakDistance',0.9*f);
%% Analisando o sinal de Voz

t = tempoa1;
findpeaks(diff(Vp),t(1:end-1),'MinPeakDistance',0.001,'MinPeakDistance',0.005);
[vt,ip] = findpeaks(diff(Vp),t(1:end-1),'MinPeakDistance',0.001,'MinPeakDistance',0.005);

title('Sinal de voz para a vogal a');
xlabel('Tempo em s');
ylabel('Tensão em Volts'); 
grid minor

inicio =  find(t==ip(11));
fim    =  find(t==ip(12));

plot(t(inicio:fim),Vp(inicio:fim));
title('Sinal de voz para a vogal a');
xlabel('Tempo em s');
ylabel('Tensão em Volts'); 
grid 
clear("Y");
X = t(inicio:fim) - t(inicio);
Y = Vp(inicio:fim);

[vexp,texp] = findpeaks(Y,X,'MinPeakDistance',0.001);

f = fit(texp(1:3)',vexp(1:3)','exp1')
plot(f,texp(1:3)',vexp(1:3))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Otimizando


x=[0 0.1188 -335.1 730]';

% Plot the original and experimental data.

Y_new =  x(1) + x(2).*exp(x(3).*X).*sin(2*pi*x(4).*X)

plot(X,Y,'+r',X,Y_new,'b')
title('Sinal de voz para a vogal a');
xlabel('Tempo em s');
ylabel('Tensão em Volts'); 
grid 
legend('Real','Ajustado')
%% Analisando as respectivas funções de transferência

% Transformando a função temporal em uma função de laplace

x=[0 0.2056 -2422 730]';
Y_new =  x(1) + x(2).*exp(x(3).*X).*sin(2*pi*x(4).*X)
clear('tf')                 % apaga a variável que impede o cálculod a função de transferência
                            % no futuro melhor mudar o nome da variável
k  = x(2)*2*pi*x(4);
p1 = x(3) + j*2*pi*x(4);
p2 = x(3) - j*2*pi*x(4);
z  = [];

Gvoz = zpk(z,[p1 p2],k)
figure()
impulse(Gvoz)
Tn = 1/x(4);
Ts = Tn/20;
fs = 1/Ts;


[Zd,Pd,Kd] = bilinear(z,[p1 p2]',k,fs)
[Nd,Dd] = zp2tf(Zd,Pd,Kd)
Gvozd = tf(Nd,Dd,Ts)
subplot(4,1,2); 
impulse(Gvoz);
axis([0 8e-3 -2.5 2.5])
subplot(4,1,3); 
impz(cell2mat(Gvozd.numerator),cell2mat(Gvozd.denominator),(8e-3/Ts),fs)
subplot(4,1,1); 
plot(X,Y,'+r')
axis([0 8e-3 -2.5 2.5])
subplot(4,1,4); 
plot(X,Y_new,'b')
axis([0 8e-3 -2.5 2.5])
figure()
margin(Gvoz);
grid;
4551/(2*pi)


figure()

subplot(1,2,1)
pzmap(Gvoz);


subplot(1,2,2)
pzmap(Gvozd);


[serie,tempo,X] = impulse(Gvoz);
impulse(Gvoz)

serie            = serie';
vogal_artificial = [serie serie serie serie serie serie serie serie serie serie serie serie serie serie serie serie serie serie serie serie];
vogal_artificial = [vogal_artificial vogal_artificial vogal_artificial vogal_artificial vogal_artificial vogal_artificial vogal_artificial vogal_artificial vogal_artificial vogal_artificial vogal_artificial vogal_artificial];
sound(vogal_artificial)
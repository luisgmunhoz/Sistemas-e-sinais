%% ECM307-G01T02L03D - Atividade T3
%% Atividade T3 - Análise de Vogais
%% Luis Guilherme de Souza Munhoz RA: 20.01937-8 Lab: 3
%% Boas Práticas
clc;                                       % limpa a tela
clear all;                                 % limpar as variáveis
close all;                                 % fecha as figuras abertas
fclose('all');                             % fecha arquivos abertos
%% Leitura das vogais e armazenamento em arquivo Vogais.mat
lerSalvar()
%% Cálculo das formantes e escrita em csv

load("Vogais.mat");
%%% GENERO MASCULINO-1 FEMININO-2 CRIANCA-3
%%% FONEMA A=1 E=2 I=3 O=4 U=5
%%% 1 - mudar nome do diretório e dos arquivos na lerSalvar()
%%% 2 - mudar o valor da variável locutor a partir do último valor do vogais1.csv
%%% 3 - mudar valor da variável genero caso necessário

    FONEMA = 1;
    LOCUTOR = 5;
    GENERO = 1;

    for ii=1:5
        FRM = AchaFormantes(a,ii)
        N = [GENERO LOCUTOR ii  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        dlmwrite('vogais1.csv',N,'delimiter',',','-append');
    end
    FONEMA = 2;
    for ii=1:5
        FRM = AchaFormantes(e,ii);
        N = [GENERO LOCUTOR ii  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        dlmwrite('vogais1.csv',N,'delimiter',',','-append');
    end
    
    FONEMA = 3;
    for ii=1:5
        FRM = AchaFormantes(i,ii);
        N = [GENERO LOCUTOR ii  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        dlmwrite('vogais1.csv',N,'delimiter',',','-append');
    end
    
    FONEMA = 4;
    for ii=1:5
        FRM = AchaFormantes(o,ii);
        N = [GENERO LOCUTOR ii  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        dlmwrite('vogais1.csv',N,'delimiter',',','-append');
    end

    FONEMA = 5;
    for ii=1:5
        FRM = AchaFormantes(u,ii);
        N = [GENERO LOCUTOR ii  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        dlmwrite('vogais1.csv',N,'delimiter',',','-append');
    end
%% Leitura e checagem de vogais

VogaisSecretas = cell(1,5); % célula com uma de cada vogal que não está no banco de dados
VogaisSecretas{1,5} = []; % inicializando célula vazia

[Y, FS] = audioread("VogaisLocutor3/TesteA.wav");
Y = Y(:,1); % pegando somente um canal de aúdio 

VogaisSecretas{1,1} = Y;
FRM = AchaFormantes(VogaisSecretas,1);
IdentificaVogal(FRM);
[Y, FS] = audioread("VogaisLocutor3/TesteE.wav");
Y = Y(:,1);

VogaisSecretas{1,2} = Y;
FRM = AchaFormantes(VogaisSecretas,2);
IdentificaVogal(FRM);

[Y, FS] = audioread("VogaisLocutor3/TesteI.wav");
Y = Y(:,1);

VogaisSecretas{1,3} = Y;
FRM = AchaFormantes(VogaisSecretas,3);
IdentificaVogal(FRM);

[Y, FS] = audioread("VogaisLocutor3/TesteO.wav");
Y = Y(:,1);

VogaisSecretas{1,4} = Y;
FRM = AchaFormantes(VogaisSecretas,4);
IdentificaVogal(FRM);

[Y, FS] = audioread("VogaisLocutor3/TesteU.wav");
Y = Y(:,1);

VogaisSecretas{1,5} = Y;
FRM = AchaFormantes(VogaisSecretas,5);
IdentificaVogal(FRM);
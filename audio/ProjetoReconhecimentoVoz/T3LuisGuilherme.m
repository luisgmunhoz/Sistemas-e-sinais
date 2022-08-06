%% ECM307-G01T02L03D - Atividade T3
%% Atividade T3 - Análise de Vogais
%% Luis Guilherme de Souza Munhoz RA: 20.01937-8 Lab: 3
%% Boas Práticas

clc;                                       % limpa a tela
clear all;                                 % limpar as variáveis
close all;                                 % fecha as figuras abertas
fclose('all');
%% Leitura das vogais e armazenamento em arquivo Vogais.mat

LerSalvar("17f")
%% Cálculo das formantes e escrita em csv

load("Vogais.mat")
%%% GENERO MASCULINO-1 FEMININO-2 CRIANCA-3
%%% FONEMA A=1 E=2 I=3 O=4 U=5
%% 1 - mudar nome do diretório e dos arquivos na lerSalvar()
%%% 2 - mudar o valor da variável locutor a partir do último valor do vogais1.csv
%%% 3 - mudar valor da variável genero caso necessário

LOCUTOR = 14;
GENERO = 2;
IteradorVogal(GENERO, LOCUTOR)
%% Leitura e checagem de vogais

VogaisSecretas = cell(1,5); % célula com uma de cada vogal que não está no banco de dados
VogaisSecretas{1,5} = []; % inicializando célula vazia


[Y, FS] = audioread("audios/1L/TesteA.wav");
Y = Y(:,1); % pegando somente um canal de aúdio    
VogaisSecretas{1,1} = Y;
FRM = AchaFormantes(VogaisSecretas,1);
IdentificaVogal(FRM);

[Y, FS] = audioread("audios/1L/TesteE.wav");
Y = Y(:,1);

VogaisSecretas{1,2} = Y;
FRM = AchaFormantes(VogaisSecretas,2);
IdentificaVogal(FRM);

[Y, FS] = audioread("audios/1L/TesteI.wav");
Y = Y(:,1);

VogaisSecretas{1,3} = Y;
FRM = AchaFormantes(VogaisSecretas,3);
IdentificaVogal(FRM);

[Y, FS] = audioread("audios/1L/TesteO.wav");
Y = Y(:,1);

VogaisSecretas{1,4} = Y;
FRM = AchaFormantes(VogaisSecretas,4);
IdentificaVogal(FRM);

[Y, FS] = audioread("audios/1L/TesteU.wav");
Y = Y(:,1);

VogaisSecretas{1,5} = Y;
FRM = AchaFormantes(VogaisSecretas,5);
IdentificaVogal(FRM);
function [] = IteradorVogal(GENERO, LOCUTOR)
    load("Vogais.mat");
    %%% GENERO MASCULINO-1 FEMININO-2 CRIANCA-3
    %%% FONEMA A=1 E=2 I=3 O=4 U=5
    %% 1 - mudar nome do diretório e dos arquivos na lerSalvar()
    %%% 2 - mudar o valor da variável locutor a partir do último valor do vogais1.csv
    %%% 3 - mudar valor da variável genero caso necessário

    FONEMA = 1;
    for tentativa=1:5
        FRM = AchaFormantes(A, tentativa);
        N = [GENERO LOCUTOR tentativa  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        EscreveCsv(N);
    end
    
    FONEMA = 2;
    for tentativa=1:5
        FRM = AchaFormantes(E,tentativa);
        N = [GENERO LOCUTOR tentativa  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        EscreveCsv(N);
    end
    
    FONEMA = 2;
    for tentativa=1:5
        FRM = AchaFormantes(I,tentativa);
        N = [GENERO LOCUTOR tentativa  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        EscreveCsv(N);
    end
    
    FONEMA = 4;
    for tentativa=1:5
        FRM = AchaFormantes(O,tentativa);
        N = [GENERO LOCUTOR tentativa  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        EscreveCsv(N);
    end
    
    FONEMA = 5;
    for tentativa=1:5
        FRM = AchaFormantes(U,tentativa);
        N = [GENERO LOCUTOR tentativa  FONEMA FRM(1) FRM(2) FRM(3) FRM(4)];
        EscreveCsv(N);
    end

end
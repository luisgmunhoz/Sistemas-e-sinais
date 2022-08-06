function [] = LerSalvar(FILEDIRECTORY)

    % prealocando
    A = cell(1,5);
    A{1,5} = [];
    
    % prealocando
    E = cell(1,5);
    E{1,5} = [];
    
    % prealocando
    I = cell(1,5);
    I{1,5} = [];
    
    % prealocando
    O = cell(1,5);
    O{1,5} = [];
    
    % prealocando
    U = cell(1,5);
    U{1,5} = [];
    
    for tentativa = 1:5
    %%%% Leitura da vogal a
        File = "audios/" + FILEDIRECTORY + "/a" + tentativa + ".wav";
        
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        A{:,tentativa} = Y;
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Leitura da vogal e
        File = "audios/" + FILEDIRECTORY + "/e" + tentativa + ".wav";
    
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        E{:,tentativa} = Y;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Leitura da vogal i
        File = "audios/" + FILEDIRECTORY + "/i" + tentativa + ".wav";
    
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        I{:,tentativa} = Y;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Leitura da vogal o
        File = "audios/" + FILEDIRECTORY + "/o" + tentativa + ".wav";
    
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        O{:,tentativa} = Y;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Leitura da vogal u
        File = "audios/" + FILEDIRECTORY + "/u" + tentativa + ".wav";
        
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        U{:,tentativa} = Y;
    
    end
save('Vogais.mat', 'A', 'E', 'I', 'O', 'U');
disp("arquivo salvo!")
fclose('all');
end
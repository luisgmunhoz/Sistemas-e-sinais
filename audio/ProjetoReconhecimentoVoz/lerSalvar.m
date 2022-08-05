function [] = LerSalvar(FILEDIRECTORY)

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
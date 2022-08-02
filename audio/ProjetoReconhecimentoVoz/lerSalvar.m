function [] = lerSalvar()

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
        File = "audios/18/a" + ii + ".mov";
        
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        a{:,ii} = Y;
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Leitura da vogal e
        File = "audios/18/e" + ii + ".mov";
    
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        e{:,ii} = Y;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Leitura da vogal i
        File = "audios/18/i" + ii + ".mov";
    
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        i{:,ii} = Y;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Leitura da vogal o
        File = "audios/18/o" + ii + ".mov";
    
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        o{:,ii} = Y;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% Leitura da vogal u
        File = "audios/18/u" + ii + ".mov";
        
        [Y,FS] = audioread(File);
        Y = Y(:,1);
        u{:,ii} = Y;
    
    end
save('Vogais.mat', 'a', 'e', 'i', 'o', 'u');
disp("arquivo salvo!")
fclose('all');
end
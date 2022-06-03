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
disp("arquivo salvo!")
end
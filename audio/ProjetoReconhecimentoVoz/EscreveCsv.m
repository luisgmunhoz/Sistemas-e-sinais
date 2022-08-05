function [] = EscreveCsv(N)
    dlmwrite('VogaisAlunos.csv',N,'delimiter',',','-append');
end
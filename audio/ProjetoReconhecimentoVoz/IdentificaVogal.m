function [] = IdentificaVogal(FRM)
    load("matlab_matrixA.mat")
    load("matlab_matrixE.mat")
    load("matlab_matrixI.mat")
    load("matlab_matrixO.mat")
    load("matlab_matrixU.mat")
    
    % verifica se as formantes calculadas estão no intervalo adequado de
    % média e desvio padrão para determinar qual é a vogal.
    if((FRM(1) > A(1,1) && FRM(1) < A(1,2)) && (FRM(2) > A(2,1) && FRM(2) < A(2,2)) && (FRM(3) > A(3,1) && FRM(3) < A(3,2)) && (FRM(4) > A(4,1) && FRM(4) < A(4,2)))
        disp("A vogal é um A")
    end
    
    if((FRM(1) > E(1,1) && FRM(1) < E(1,2)) && (FRM(2) > E(2,1) && FRM(2) < E(2,2)) && (FRM(3) > E(3,1) && FRM(3) < E(3,2)) && (FRM(4) > E(4,1) && FRM(4) < E(4,2)))
        disp("A vogal é um E")
    end

    if((FRM(1) > I(1,1) && FRM(1) < I(1,2)) && (FRM(2) > I(2,1) && FRM(2) < I(2,2)) && (FRM(3) > I(3,1) && FRM(3) < I(3,2)) && (FRM(4) > I(4,1) && FRM(4) < I(4,2)))
        disp("A vogal é um I")
    end

    if((FRM(1) > O(1,1) && FRM(1) < O(1,2)) && (FRM(2) > O(2,1) && FRM(2) < O(2,2)) && (FRM(3) > O(3,1) && FRM(3) < O(3,2)) && (FRM(4) > O(4,1) && FRM(4) < O(4,2)))
       disp("A vogal é um O")
    end

    if((FRM(1) > U(1,1) && FRM(1) < U(1,2)) && (FRM(2) > U(2,1) && FRM(2) < U(2,2)) && (FRM(3) > U(3,1) && FRM(3) < U(3,2)) && (FRM(4) > U(4,1) && FRM(4) < U(4,2)))
        disp("A vogal é um U")
    end
end
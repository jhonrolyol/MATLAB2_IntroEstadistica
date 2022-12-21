%==========================================================================
%                    Introducción a la estadística 2022
% Session: N°2
% Name: JR
% Date: december 15, 2022
% Source: https://www.youtube.com/watch?v=uGAFBGi9xGo&list=PLaRL0TPGolGd3RuBEjTmiha_HuFwjYSE9&index=2 
%==========================================================================

% Section 0 ---------------------------------------------------------------
    clear, clc
    dir *
    pwd
% Section 1 ---------------------------------------------------------------
    figure(1), shg % (SHowGraph)
    subplot(311)
    % Distribucion homogenea
    SampleSize = 1e4; % Tamaño de la muestra
    Muestra = rand(1, SampleSize);
    %Bordes = -.2:.02:1.2;
    Bordes = 0:.02:1;
    histogram(Muestra, Bordes);
    xlabel('Valores de la variable');
    ylabel('# Observaciones');
    title('Distribución Homogénea');
    ExpectedObs = SampleSize/(length(Bordes)-1);
% Section 2 ---------------------------------------------------------------
    % Proceso de Bernoulli: Dos posibles resultados mutuamente excluyentes
    NumAzar = rand(1,10);
    Binario = NumAzar > 0.5;
    Resultado = [NumAzar; Binario];
    sum(Binario);
    %CuentaDeUnos = sum(Binario);
% Section 3 ---------------------------------------------------------------
    % Bucle o loop
    NumEns = 10;
    CuentaDeUnos = sum(Binario);
    %ProbabilidadExito = 0.5; % Probabilidad de exito del proceso binario
    ProbabilidadExito = 0.1;
    NExperimentos = 1e4;
    %NExperimentos = 10;
    NumExitos = zeros(1,NExperimentos); % Analizar esta línea
    for n = 1:NExperimentos
        %Binario = rand(1, NumEns) > ProbabilidadExito;
        Binario = rand(1, NumEns) < ProbabilidadExito;
        NumExitos(n) = sum(Binario);
    end
    % figure
    figure(44)
    Bordes = min(NumExitos):1:max(NumExitos);
    histogram(NumExitos, Bordes);
    xlabel('Número de exitos');
    ylabel('Número obeservaciones');
% Section 4 ---------------------------------------------------------------
    % binopdf() Binomial Probability Density Function
    y = binopdf(Bordes,NumEns,ProbabilidadExito);
    y = y/sum(y) * NExperimentos;
    hold on
    plot(Bordes + 0.5, y, 'ko-','linew',3);
% Section 5 ---------------------------------------------------------------
    figure(1);
    % Dinstribucion normal
    subplot(312)
    Muestra = randn(1, NExperimentos);
    Bordes = -6:.2:6;
    histogram(Muestra, Bordes);
    xlabel('Valor de la variable');
    ylabel('# Observaciones');
    title('Distribución Normal');
% Section 6 ---------------------------------------------------------------
    % Distribución exponencial
    subplot(313);
    %Muestra = exprnd(2,1,NExperimentos);
    Muestra = exprnd(10,1,NExperimentos);
    Bordes = 0:.2:20;
    histogram(Muestra, Bordes);
    xlabel('Valor de la variable');
    ylabel('Num. Observaciones');
    title('Distribución Exponencial');
% Section 7 ---------------------------------------------------------------
    % Tamanio de la muestra
    TamanioMuestra = 10000;
    Muestra = rand(1, TamanioMuestra); % Muestra de dist. Homogénea
    % Bordes
    Bordes = 0:0.02:1;
    % Figure
    figures(55)
    histogram(Muestra,Bordes)
    xlabel('Valores de la muestra');
    ylabel('# Obs');
    title('Muestra con dist. Homogénea')
    % Promedio
    mean(Muestra)
    nExp = 1e3;
    %TamanioMuestra2 = 10;
    %TamanioMuestra2 = 30;
    TamanioMuestra2 = 300;
    PromedioDeLasMuestras = zeros(1,nExp);
        for n = 1:nExp
	        Muestra = rand(1, TamanioMuestra2); %Muestra de dist. Homogénea
	        PromedioDeLasMuestras(n) = mean(Muestra);
        end
    subplot(212)
    histogram(PromedioDeLasMuestras)
    xlabel('Promedio muestra');
    ylabel('# Obs');
    title('Variabilidad del promedio de la muestra')
    xlim([0 1])
    % Standard error of the mean 
    SEM = std(PromedioDeLasMuestras);
    SEMestimado = std(Muestra)/sqrt(30-1);
   
    mean(randn(1,100))
    mean(randn(1,100))
    mean(randn(1,100))
    mean(randn(1,100))
    return % Regresa a la ventana de comandos

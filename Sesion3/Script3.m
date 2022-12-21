%==========================================================================
%                    Introducción a la estadística 2022
% Session: N°3
% Name: JR
% Date: december 19, 2022
% Source: https://www.youtube.com/watch?v=pLyl_R_F3m4&list=PLaRL0TPGolGd3RuBEjTmiha_HuFwjYSE9&index=3
%==========================================================================

% Section 0 ---------------------------------------------------------------
    clear, clc
    dir *
    pwd
% Section 1 ---------------------------------------------------------------
    clear, clc
    figure(1), clf % clf clean Figure
    subplot(311)
    x = -4:0.1:4;
    y = normpdf(x);
    plot(x,y, 'linew',3);
    title('Standar Nomal Distribution');
    xlabel('z-balue');
    ylabel('PDF');
    axis square
% Section 2 ---------------------------------------------------------------
    subplot(312)
    x = -4:0.1:4; % Eje x en STD o z-value
    y = normcdf(x); % CDF: Cumulative Density Function
    plot(x,y, 'linew',3);
    title('Cumulative of the Normal Distribution');
    xlabel('z-balue');
    ylabel('CDF');
    axis square
% Section 3 ---------------------------------------------------------------
    subplot(313)
    p = 0:.0001:1;
    p(1) = normcdf(-4);
    p(end) = normcdf(4);
    y = norminv(p);
    plot(p,y, 'linew',3);
    title('Inverse of CDF');
    xlabel('Probability');
    ylabel('z-value');
    axis square
% Section 4 ---------------------------------------------------------------
    clear, clc;
    % Leemos las tablas de Excel
    TableDatos = readtable('Muestra.xlsx');
    % Obtenemos las variables que nos interesan de la tabla
    Pesos = TableDatos.Peso;
    Estaturas = TableDatos.Estatura; 
    Edades = TableDatos.Edad;
    PromedioPesos = mean(Pesos);
    PromedioEstatura = mean(Estaturas);
    StdPesos = std(Pesos);
% Section 5 ---------------------------------------------------------------
    figure(2), clf;
    subplot(411)
    x = 40:1:100;
    PDFPesos = normpdf(x, PromedioPesos, StdPesos); % Graficando como se veria el PDF de la poblacion 
    plot(x,PDFPesos, 'linew',3);
    xlabel('Peso (Kg)');
    ylabel('PDF');
    title('PDF Poblacion');
    hold on % Para graficar en el mismo panel
    % plot([x1 x2], [y1 y2]), para graficar una linea
    plot([PromedioPesos, PromedioPesos], ylim, 'r:', 'LineWidth', 3);
    LimitesX = xlim;
    
    subplot(412);
    Bordes = 40:5:100;
    histogram(Pesos, Bordes);
    xlabel('Peso (Kg)');
    ylabel('# Obs');
    title('Distribución de nuestros pesos');
    xlim(LimitesX); % El "xlim()" permite mostrar los límites de "x"
    
    subplot(413); hold on
    SampleSize = length(Pesos);
    MuestraSimulada = randn(1,SampleSize)*StdPesos + PromedioPesos;
    histogram(MuestraSimulada, Bordes);
    xlabel('Peso (Kg)');
    ylabel('# Obs');
    title('Distribucion de nuestros pesos simulados');
    plot([mean(MuestraSimulada);mean(MuestraSimulada)], ylim, 'r:', 'linew',3);

    subplot(414);
    nSimulaciones = 1e4;
    PromedioSim = zeros(1,nSimulaciones);
    for n = 1:nSimulaciones
        PesosSimulados = randn(1, SampleSize)*StdPesos + PromedioPesos;
        PromedioSim(n) = mean(PesosSimulados);
    end

    AnchoBin = 0.2;
    Bordes = min(PromedioSim):AnchoBin:max(PromedioSim);
    histogram(PromedioSim, Bordes, 'Normalization', 'PDF');
    xlim(LimitesX);
    xlabel('Promedio de los pesos Simulados');
    ylabel('PDF');
    title('Distribución del promedio de las muestras');

    % Standar Error of the Mean (SEM)
    SEMmuestra = std(Pesos)/sqrt(SampleSize-1);
    SEMteorico = std(PromedioSim);

    % Graficar un intervalo de confianza del 95%
    PromMuestraSim = mean(MuestraSimulada);
    Alpha = 0.05; % (1 - Alpha) Confidence Level
    RelCoef = norminv(1-Alpha/2); % Reliability Coefficient

    ConfidenceInterval = [PromMuestraSim - SEMteorico*RelCoef ...
                          PromMuestraSim + SEMteorico*RelCoef];
    subplot(413);
    plot([ConfidenceInterval; ConfidenceInterval], [ylim;ylim]', 'r', 'linew',4);

    subplot(414), hold on
    x = 60:1:80;
    y = normpdf(x, mean(PromedioSim), std(PromedioSim));
    plot(x,y, 'r', 'linew',3);


return % El return no permite ejecutar las siguientes lineas




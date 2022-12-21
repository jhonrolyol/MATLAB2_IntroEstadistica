%==========================================================================
%                    Introducción a la estadística 2022
% Session: N°1
% Name: JR
% Date: december 15, 2022
% Source: https://www.youtube.com/watch?v=H0x-J81Dc7A&list=PLaRL0TPGolGd3RuBEjTmiha_HuFwjYSE9&index=1 
%==========================================================================

% Section 0 ---------------------------------------------------------------
    dir *
    pwd
% Section 1 ---------------------------------------------------------------
    % New script
    edit 
    % Suma
    S = 3 + 3;
    % Resta o diferencia
    D = 3 - 3;
    % Producto o multiplicacion
    P = 3*3;
    % Cociente o division
    Q = 3/3;
    % Potencia
    X = 2^8;
    % Raiz cuadrada
    R = sqrt(25);
    R1 = 25^(1/2);
    S1 = 3 + (45/2);
    R2 = sqrt(X);
    clear;
% Section 2 ---------------------------------------------------------------
    % Vector1
    Vector1 =  [3 5 7 9 11];
    LongVector1 = length(Vector1);
    SizeVector = size(Vector1);
    % Vector2
    Vector2 = [7 ;6 ;9 ;32];
    LongVector2 = length(Vector2);
    SizeVector2 = size(Vector2);
% Section 3 ---------------------------------------------------------------
    % Suma de un vector
    SumaVector = sum([3 2 8 12]);
    SumaVector2 = sum(Vector2);
    % Promedio 
    PromVector = mean([5 5 5 5 6]);
    PromVector2 = mean(Vector2);
    % Mediana
    MedianVector = median([1 2 2 3 4 4 5 5 5 6 1 1 2 3]);
    MedianVector2 = median(Vector2);
    % Moda
    ModaVector = mode([2 2 2 3 3 4 4 5 5 6 7 7 8 9 3 2 2 3 3]);
    ModaVector2 = mode(Vector2);
    % Desviacion estandar
    DesvEstanVector = std([5 87 45 -100 -5 63]);
    DesvEstanVector2 = std(Vector2);
    % Varianza
    VarianzaVector = var([2 4 6 4 8 2 10]);
    VarianzaVector2 = var(Vector2);
% Section 4 ---------------------------------------------------------------
    Vector3 = 1:500;
    Vector4 = 10:5:50;
    % Transpuesta
    VectorTranspuesta = Vector4';
% Section 5 ---------------------------------------------------------------    
    % Matriz1
    Matriz1 = [2 4 6; 5 7 11];
    % Tamaño de la matriz
    TamanioMatriz = size(Matriz1);
    % Matriz2
    Matriz2 = [2 4 6 8; 3 5 7 9;-12 0 25 6];
    TamnioMatriz2 = size(Matriz2);
    % Indexar
    Matriz2(3,1); % Valor de la fila 3 y columna 1
    Matriz2(3,:);
    Matriz2(3,1:4);
    Matriz2(:,3);
    % Cambiar los elementos de una matriz
    Matriz2(3,3) = -200;
    % Para empezar de nuevo 
    clear, clc;
% Section 6 ---------------------------------------------------------------
    % Vetcor5
    Vector5 = [3 -55 7 9 -11 13];
    % Creamos un vector tiempo
    Tiempo = [0 .2 .4 .6 .8 1];
    % Graficamos
    figure(1), clf
    plot(Tiempo, Vector5, 'ro--', 'linewidth',5,'markersize',20);
    xlabel('Tiempo (s)');
    ylabel('Voltaje (V)');
    title('Registro de voltaje en el tiempo');
    % Algunas modificaciones
    plot(Tiempo, Vector5-1, 'b:', 'linewidth',3,'markersize',10);
    % graficamos la funcion seno
    figure(2)
    x = 0:pi/100:2*pi;
    y = sin(x);
    plot(x,y);
    % Documentacion
    doc plot;
    doc mean;
    help plot;
    help mean;
    % Documentacion general
    doc; 

% Section 7 ---------------------------------------------------------------
    % Creamos un vector 
    NewVector = [2 -4 -3 2 1 6 7 -3 2];
    % Valor minimo de un vector
    min(NewVector);
    % valor maximo de un vector
    max(NewVector);
% Section 8 ---------------------------------------------------------------
    % rand
    rand
    % randn
    randn
    % vector de numeros al azar de una "distribucion normal"
    randn(1,20);
    % Numeros al azar de una "distribucion homogenea"
    NumAzar = rand(1,1000); % 10 000 = 1e4 o  100 000 = 1e5
    % tamaño del vector
    size(NumAzar);
    % histogram
    figure(3)
    histogram(NumAzar);
    xlabel("Valores que toma la variabel: numeros al azar");
    ylabel("Numero de observaciones por bin")
        % Analisis del histogram
            % El histogram no es exatamente homogenea porque se tomó 
            % una muestra de la poblacion al azar.
    % abrimos las figuras
    shg
    % cerramos ventanas abiertas
    close all
    % numeros de distribucion normal
    figure(4);
    NumAzarDistNormal = randn(1,1000); % 10 000 = 1e4 o  100 000 = 1e5
    histogram(NumAzarDistNormal);
        % media, media aritmetica o promedio aritmetico
        PromNumAzarDistNormal = mean(NumAzarDistNormal);
        % desviacion estandar
        DesEstNumAzarDistNormal = std(NumAzarDistNormal);
    % Usando un tamanio de muestra
    TamanioMuestra = 100;
    figure(5);
    NumAzarDistNormal2 = randn(1,TamanioMuestra); % 10 000 = 1e4 o  100 000 = 1e5
    histogram(NumAzarDistNormal2);
    histogram(NumAzarDistNormal2*10); % los valores se multiplican por 10
    histogram(NumAzarDistNormal2*10 + 50); % centrado en 50
        % media, media aritmetica o promedio aritmetico
        PromNumAzarDistNormal2 = mean(NumAzarDistNormal2);
        % desviacion estandar
        DesEstNumAzarDistNormal2 = std(NumAzarDistNormal2);

function [Q, residue] = deflacion_polinomial(coeficientes, raiz)
    % Inputs:
    %   coeficientes: Vector [an, a{n-1}, ..., a_0] del polinomio f(x).
    %   raiz: Raíz conocida r (f(r) = 0).
    % Outputs:
    %   Q: Coeficientes del polinomio deflacionado (grado n-1).
    %   residue: Residuo (debe ser 0 si r es una raíz exacta).

    n = length(coeficientes) - 1;  % Obtener el grado del polinomio
    Q = zeros(1, n);  % Inicializar el arreglo para el polinomio deflacionado
    Q(1) = coeficientes(1);  % Copiar el primer coeficiente

    i = 2;
    while i <= n+1  % Usar while en lugar de for
        Q(i) = Q(i-1) * raiz + coeficientes(i);
        i = i + 1;
    end

    residue = Q(end);  % El último valor es el residuo
    Q = Q(1:end-1);  % Eliminar el residuo de los coeficientes del polinomio deflacionado
end

% Definir el polinomio f(x) = x^2 + 2x - 24
coeficientes = [1, 2, -24];
raiz = 4;  % Raíz conocida

% Llamar a la función
[Q, residue] = deflacion_polinomial(coeficientes, raiz);

% Mostrar resultados
disp('Coeficientes del polinomio deflacionado:');
disp(Q);
disp('Residuo:');
disp(residue);
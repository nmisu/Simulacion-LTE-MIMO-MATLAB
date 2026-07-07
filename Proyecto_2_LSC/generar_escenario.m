%% Inicialización del escenario
function [Pos_BS, Pos_MS, dist_BS_MS, snr, SNR] = generar_escenario(K, lado_x, lado_y, Ptx, f, B, N0, sigma_sh)
    % Configura las posiciones y SNR de los usuarios
    
    % Posición de la estación base
    Pos_BS = 0 + 1i*0;

    % Distribución aleatoria de usuarios
    Pos_MS = zeros(1,K);
    for k = 1:K
        Pos_MS(k) = lado_x*(rand-0.5) + 1i*lado_y*(rand-0.5);
    end
    
    % Calculo de distancias y path loss
    dist_BS_MS = abs(Pos_MS - Pos_BS);
    PL = 32.4 + 20*log10(f/1e9) + 37.6*log10(dist_BS_MS); % dB
    Prx = 10*log10(Ptx) - PL + sigma_sh*randn(1,K); % Añadimos shadowing
    
    % Calcular SNR de cada usuario
    N = B*N0; % Potencia de ruido
    SNR = Prx - 10*log10(N); % dB
    snr = 10.^(SNR./10); % u.n
end
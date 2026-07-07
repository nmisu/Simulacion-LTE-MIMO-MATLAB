%% generar_canal.m
function h = generar_canal(sistema, snr, Mtx, Mrx, Nsim, Ptx)
    % Genera canales para los diferentes sistemas
    switch sistema
        case 'MISO'
            H = (randn(1, Mtx, Nsim) + 1i*randn(1, Mtx, Nsim)) * sqrt(Ptx/Mtx);
            h_eq = zeros(1, Nsim);
            for p = 1:Nsim
                H_p = H(1, :, p);
                w = H_p' / norm(H_p); % MRT
                h_eq(p) = w' * H_p';
            end

        case 'SIMO'
            H = (randn(Mrx, 1, Nsim) + 1i*randn(Mrx, 1, Nsim)) * sqrt(Ptx);
            h_eq = zeros(1, Nsim);
            for p = 1:Nsim
                H_p = H(:, 1, p);
                w = H_p / norm(H_p); % MRC
                h_eq(p) = w' * H_p;
            end

        case 'MIMO_txrx'
            H = (randn(Mrx, Mtx, Nsim) + 1i*randn(Mrx, Mtx, Nsim)) * sqrt(Ptx/Mtx);
            h_eq = zeros(1, Nsim);
            for p = 1:Nsim
                H_p = H(:,:,p);
                [U, ~, V] = svd(H_p);
                v = V(:,1); % Primera columna de V
                u = U(:,1); % Primera columna de U
                h_eq(p) = u' * H_p * v * sqrt(Mtx);
            end

        case 'MIMO_rx'
            H = (randn(Mrx, Mtx, Nsim) + 1i*randn(Mrx, Mtx, Nsim)) * sqrt(Ptx/Mtx);
            h_eq = zeros(1, Nsim);
            for p = 1:Nsim
                H_p = H(:,:,p);
                v = 0.5 * ones(Mtx,1); % Cada antena transmite con 1/4 de la potencia total
                u = H_p*v / norm(H_p*v); % MRC
                h_eq(p) = u' * H_p * v * sqrt(Mtx);
            end
    end
    h = sqrt(snr) .* h_eq;
end
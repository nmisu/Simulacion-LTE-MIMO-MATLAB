%% canal_MIMO.m
function h_MIMO = canal_MIMO(Pos_MS, Mtx, Mrx, snr_us, Nsim, Ptx, mode)
    K = numel(Pos_MS);
    h_MIMO = zeros(K, Nsim);
    
    H = (randn(Mrx, Mtx, Nsim) + 1i*randn(Mrx, Mtx, Nsim)) * sqrt(Ptx/Mtx);
    
    for i = 1:K 
        h_eq = zeros(1, Nsim);
        for p = 1:Nsim
            H_p = H(:,:,p);
            if strcmp(mode, "txrx") % TX y RX
                [U, ~, V] = svd(H_p);
                v = V(:,1); % Primera columna de V
                u = U(:,1); % Primera columna de U
                h_eq(p) = u' * H_p * v * sqrt(Mtx);
            else % Solo en RX
                % Transmisión con potencia igual por antena
                v = 0.5 * ones(Mtx,1); % Cada antena transmite con 1/4 de la potencia total
                % MRC en RX
                u = H_p*v; 
                u = u/norm(u);
                h_eq(p) = u' * H_p * v * sqrt(Mtx); % Canal equivalente
            end
        end
        h_MIMO(i,:) = sqrt(snr_us(i)) * h_eq;
    end
end
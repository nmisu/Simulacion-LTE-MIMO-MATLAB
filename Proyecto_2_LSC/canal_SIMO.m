%% canal_SIMO.m
function h_SIMO = canal_SIMO(Pos_MS, Mtx, Mrx, snr_us, Nsim, Ptx)
    K = numel(Pos_MS);
    h_SIMO = zeros(K, Nsim);
    
    H = (randn(Mrx, 1, Nsim) + 1i*randn(Mrx, 1, Nsim)) * sqrt(Ptx);
    
    for i = 1:K
        h_eq = zeros(1, Nsim);
        % Combinador MRC
        for p = 1:Nsim
            H_p = H(:, 1, p);
            w = H_p / norm(H_p); % Vector de combinación (MRC)
            h_eq(p) = w' * H_p; % Canal equivalente
        end
        h_SIMO(i,:) = sqrt(snr_us(i)) * h_eq;
    end
end
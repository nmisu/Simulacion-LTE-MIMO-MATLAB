%% canal_MISO.m
function h_MISO = canal_MISO(Pos_MS, Mtx, Mrx, snr_us, Nsim, Ptx)
    K = numel(Pos_MS);
    h_MISO = zeros(K, Nsim);
    
    H = (randn(1, Mtx, Nsim) + 1i*randn(1, Mtx, Nsim)) * sqrt(Ptx/Mtx);
    
    for i = 1:K  
        h_eq = zeros(1, Nsim);
        % MRT
        for p = 1:Nsim
            H_p = H(1, :, p);  % Canal para esta realización
            w = H_p' / norm(H_p); % Precoding vector (MRT)
            h_eq(p) = w' * H_p'; % Canal equivalente
        end
        h_MISO(i, :) = sqrt(snr_us(i)) * h_eq;
    end
end
function rc = range_compress(rx, tx)
% range compression using matched filter

% rx = received signal matrix (Ns*Np)
% tx = transmit chirp (1*Ns)
% rc = range-compressed output (Ns*Np)

    [Nr, Np] = size(rx);

    % matched filter is time reversed conjugate of transmit signal
    mf = conj(fliplr(tx));
    mf = mf / norm(mf); % normalizes filter energy
    rc = zeros(Nr, Np);
    for p = 1:Np
        % convolution of received pulse with matched filter
        temp = conv(rx(:,p), mf, 'same'); 
        rc(:,p) = temp
    end 
end 

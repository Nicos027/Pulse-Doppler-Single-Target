function rx = simulate_single_target(tx, fs, prf, Np, R0, v, fc, Trec)

    c = 3e8;
    lambda = c / fc;

    Ns = length(tx);
    Nr = round(Trec * fs);
    rx = zeros(Nr, Np);

    for p = 1:Np
        t_pulse = (p-1) / prf;
        R = R0 + v * t_pulse;
        tau = 2 * R / c;

        delay_samp = round(tau * fs);

        fd = 2 * v / lambda;
        doppler_phase = exp(1j * 2 * pi * fd * t_pulse);

        amp = 3;

        start_idx = delay_samp + 1;
        end_idx = delay_samp + Ns;

        if end_idx <= Nr
            rx(start_idx:end_idx, p) = amp * tx.' * doppler_phase;
        end
    end

    noise_power = 0.01;
    noise = sqrt(noise_power/2) * (randn(size(rx)) + 1j*randn(size(rx)));
    rx = rx + noise;
end

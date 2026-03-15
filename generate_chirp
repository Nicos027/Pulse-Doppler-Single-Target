function [tx, t_fast, k] = generate_chirp(fs, Tp, B)
    t_fast = 0:1/fs:Tp-1/fs;
    k = B / Tp;
    tx = exp(1j * pi * k * t_fast.^2);
end

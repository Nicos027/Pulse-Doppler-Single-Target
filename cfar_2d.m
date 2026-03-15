function [detections, threshold_map] = cfar_2d(RD_power, Tr, Td, Gr, Gd, alpha)
% 2 dimension CA-CFAR detector

% RD_power = range Doppler map power (Nr x Nd)
% Tr, Td = number of training cells in range and Doppler directions
% Gr, Gd = number of guard cells in range and Doppler directions
% alpha  = threshold scaling factor
% detections = binary detection map
% threshold_map = threshold value used on each cell

[Nr, Nd] = size(RD_power);
detections = zeros(Nr, Nd);

% total half window size
r_half = Tr + Gr;
d_half = Td + Gd;

for r = r_half + 1 : Nr - r_half
    for d = d_half + 1 : Nd - d_half 

        % extract local window around tested cell
        window = RD_power(r-r_half:r+r_half, d-d_half:d+d_half);

        % zero out guard cells + tested cell
        window_mask = ones(size(window));

        r_guard_start = Tr + 1;
        r_guard_end = Tr + 2*Gr + 1;
        d_guard_start = Td + 1;
        d_guard_end = Td + 2*Gd + 1;

        window_mask(r_guard_start:r_guard_end, d_guard_start:d_guard_end) = 0;

        % training cells only
        training_cells = window(window_mask == 1);

        % estimate local noise power
        noise_est = mean(training_cells);

        % CFAR threshhold
        threshold = alpha * noise_est;
        threshold_map(r, d) = threshold;

        % cell being tested
        tested_cell = RD_power(r, d);

        if tested_cell > threshold
            detections(r, d) = 1;
        end 
    end 
end 

  

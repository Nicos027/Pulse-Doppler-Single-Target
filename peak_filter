function peak_detections = peak_filter_2d(RD_power, detections)
% keep only local 2D maxima detections

[Nr, Nd] = size(RD_power);
peak_detections = zeros(Nr, Nd);

for r = 2:Nr-1
    for d = 2:Nd-1
        if detections(r, d) == 1
            neighborhood = RD_power(r-1:r+1, d-1:d+1);
            center_val = RD_power(r,d);

            if center_val == max(neighborhood(:))
                peak_detections(r, d) = 1;
            end
        end
    end
end

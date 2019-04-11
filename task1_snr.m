function []= task1_snr()
[X,map] = imread('benBW','bmp'); %load a picture
[m,n] = size(X);
snr_1=1:100
snr_1=snr_1./10


for j=1:100
snr=snr_1(j)

a = sqrt(1/(2*snr)); % this is the amplitude of the noise

% convert the image (matrix of bytes) to a stream of bits
X_bin_vec = matrix2bitstream(X); % convert the picture to 1 and 0
X_bin_vec_modulated = 2*X_bin_vec-1; % convert 1 and 0 to 1 and -1

% Channel
X_rec1 = channel(X_bin_vec_modulated,a,'awgn');
X_rec2 = channel(X_bin_vec_modulated,a,'ray');
% detection
X_det_bin1 = (sign(X_rec1)+1)/2; % this vector contains ones and zeros
error_sum=X_det_bin1-X_bin_vec;
error_sum=error_sum.*error_sum;
ber_awgn(j)=sum(error_sum)/length(error_sum)
X_det_bin2 = (sign(X_rec2)+1)/2; % this vector contains ones and zeros
error_sum2=X_det_bin2-X_bin_vec;
error_sum2=error_sum2.*error_sum2;
ber_ray(j)=sum(error_sum2)/length(error_sum2)
% convert the bits back to a matrix

%fun=@(x) x.*exp(-(x.^2)/2).*qfunc(x.*sqrt(snr))
%ber_ray_the(j)=integral(fun,0,Inf)
ber_ray_the=0.5*(1-sqrt(snr_1./(1+snr_1)))
end

snr_2=sqrt(2*snr_1)
ber_awgn_the=qfunc(snr_2)



figure
subplot(1,2,2)
plot(snr_1,ber_awgn)
title('Actual BER Curve for AWGN','FontSize',14)
%subplot(1,2,2)
%plot(snr_1,ber_ray)
%title('Actual BER Curve for Rayleigh','FontSize',14)
subplot(1,2,1)
plot(snr_1,ber_awgn_the)
title('Theorical BER Curve for AWGN','FontSize',14)

%subplot(1,2,1)
%plot(snr_1,ber_ray_the)
%title('Theorical BER Curve for Rayleigh','FontSize',14)







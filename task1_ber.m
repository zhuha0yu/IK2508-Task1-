function []= task1_ber(snr,mode)
[X,map] = imread('benBW','bmp'); %load a picture
[m,n] = size(X);
a = sqrt(1/(2*snr)); % this is the amplitude of the noise

% convert the image (matrix of bytes) to a stream of bits
X_bin_vec = matrix2bitstream(X); % convert the picture to 1 and 0
X_bin_vec_modulated = 2*X_bin_vec-1; % convert 1 and 0 to 1 and -1

% Channel
X_rec1 = channel(X_bin_vec_modulated,a,mode);

% detection
X_det_bin1 = (sign(X_rec1)+1)/2; % this vector contains ones and zeros
error_sum=X_det_bin1-X_bin_vec;
error_sum=error_sum.*error_sum;
ber=sum(error_sum)/length(error_sum)
% convert the bits back to a matrix
X_det1 = bitstream2matrix(X_det_bin1,m,n);
X_det2 = bitstream2matrix(error_sum,m,n);
colormap(repmat([0:.01:1]',1,3))
subplot(1,3,1)
imagesc(X)
title('Original Picture','FontSize',14)
axis equal
axis off

subplot(1,3,2)
imagesc(X_det1)
title('After Transmission','FontSize',14)
axis equal
axis off
subplot(1,3,3)
imagesc(X_det2)
title('After Transmission','FontSize',14)
axis equal
axis off
snr




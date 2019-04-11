function [] = task2(h,taps,X_rec2)
m = 309; 
n = 250;
a = .1;
n0 = 2*a^2;


[dummy delay] = max(abs(h));
delay=max(delay-1,1);

eq_coeff = calc_eq_coeff(h,n0,taps);

X_det_bin1 = (sign(X_rec2)+1)/2;
X_det_bin1 = [X_det_bin1((delay):end) X_det_bin1(1:(-1+delay))];

start = ceil(taps/2);
X_det_bin2 = (sign(filter(eq_coeff,[1],X_rec2))+1)/2;
X_det_bin2 = [X_det_bin2((start+delay):end) X_det_bin2(1:(start-1+delay))];

% convert the bits back to a matrix
X_det1 = bitstream2matrix(X_det_bin1,m,n);
X_det2 = bitstream2matrix(X_det_bin2,m,n);

colormap(repmat([0:(1/255):1]',1,3))

subplot(1,2,1)
imagesc(X_det1)
title('Before equalisation','FontSize',14)
axis equal
axis off

subplot(1,2,2)
imagesc(X_det2)
title('After equalisation','FontSize',14)
axis equal
axis off




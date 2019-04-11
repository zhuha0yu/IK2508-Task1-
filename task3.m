function []= task3(X_rec,m,n)
X_det_bin = (sign(X_rec)+1)/2;

% convert the bits back to a matrix
X_det = bitstream2matrix(X_det_bin,m,n);

colormap(repmat([0:.01:1]',1,3))
imagesc(X_det)






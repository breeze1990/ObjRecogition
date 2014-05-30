function [ desc ] = mySIFT( patch )
%MYSIFT Summary of this function goes here
%   patch should be 18-by-18
kx = fspecial('sobel')'; % kernel for calculating derivative w.r.t x-axis
ky = fspecial('sobel');% kernel for calculating derivative w.r.t y-axis
Ix = imfilter(patch,kx);
Iy = imfilter(patch,ky);% calculate the derivatives
Ix = Ix(2:17,2:17);
Iy = Iy(2:17,2:17); % 16-16-matrix
amp = sqrt(Ix.^2+Iy.^2);
th = atan(Iy./Ix)/pi;
th(Ix<0) = th(Ix<0)+1; % [-0.5 , 1.5), 8 bins
th = floor((th+0.5)*4)+1;
th(th==9)=8;
th(isnan(th))=1;
idx = 0;
bins = zeros(8,16);
for i=1:4:13
    for j=1:4:13
        idx = idx+1;
        tth = reshape(th(i:i+3,j:j+3),1,16);
        tamp = reshape(amp(i:i+3,j:j+3),1,16);
        for k=1:16
            bins(tth(k),idx) = bins(tth(k),idx)+tamp(k);
        end
    end
end
desc = reshape(bins,128,1);
desc = desc / norm(desc);

end
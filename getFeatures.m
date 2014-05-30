function [ret] = getFeatures(im,wsiz,Rth)
%GETFEATURES Computes corner points and return them
if nargin < 3
    Rth = 1;
end
if nargin <2
    wsiz = 16; % window size 5,11,17,23
end
kx = fspecial('sobel')'; % kernel for calculating derivative w.r.t x-axis
ky = fspecial('sobel');% kernel for calculating derivative w.r.t y-axis
Ix = imfilter(im,kx,'replicate');
Iy = imfilter(im,ky,'replicate');% calculate the derivatives
Ix2 = Ix.*Ix;
Iy2 = Iy.*Iy;
Ixy = Iy.*Ix; % some quatitives used for the moment matrix later
step = 1; % step is used to skip duplicate windows that detect the same corner
[row, col] = size(im);
ret = [];
Rmat = zeros(row,col);
for i=2:step:row-wsiz
    for j=2:step:col-wsiz
        wIx2 = Ix2(i:i+wsiz-1,j:j+wsiz-1);
        wIy2 = Iy2(i:i+wsiz-1,j:j+wsiz-1);
        wIxy = Ixy(i:i+wsiz-1,j:j+wsiz-1); % implicitly I use a step funtion for window here
        M = [ sum(wIx2(:)) sum(wIxy(:));
              sum(wIxy(:)) sum(wIy2(:))]; % moment matrix
        R = det(M)-0.05*(trace(M)^2); % calculate the response funtion according to the formula in the paper
        Rmat(i,j) = R;
    end
end
isMaximum = imregionalmax(Rmat);
Rmat(~isMaximum) = 0;
for i=2:step:row-wsiz
    for j=2:step:col-wsiz
        if Rmat(i,j)>Rth 
            item.res = Rmat(i,j); % record the R values
            item.pos = [i j]; % record the positions
            item.desc = mySIFT(im(i-1:i+wsiz,j-1:j+wsiz));
            if isempty(ret)
                ret = item;
            else % record the point information based on a descending order of R value
                idx = ([ret.res]>=Rmat(i,j));
                ret = [ret(idx) item ret(~idx)];
            end
        end
    end
end
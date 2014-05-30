function [ cls,ctr ] = myKmeans( pts,K )
%MYKMEANSJ Summary of this function goes here
%   Detailed explanation goes here
len = size(pts,1);
pdim = size(pts,2);
sel = randperm(len,K);
ctr = pts(sel,:);
cls = ones(len,1);
while true
    pctr = ctr;
    for i=1:len
        tmp = repmat(pts(i,:),K,1);
        tmp = tmp - ctr;
        tmp = sqrt(sum(tmp.^2,2));
        [~, ti] = min(tmp);
        cls(i) = ti;
    end % Every point is assgined to a cluster
    %calculate new centroids
    cnt = zeros(K,1);
    tpt = zeros(K,pdim);
    for i=1:K
        cnt(i) = length(find(cls==i));
    end
    for i=1:len
        tpt(cls(i),:)=tpt(cls(i),:)+pts(i,:);
    end
    for i=1:K
        if cnt(i)==0
            error('why');
        end
        tpt(i,:)=tpt(i,:)/cnt(i);
    end % new centroids
    ctr = tpt;
    disp(norm(ctr-pctr));
    if norm(ctr-pctr)<1e-10
        break;
    end
end
end


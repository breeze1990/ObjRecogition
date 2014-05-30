function [ out ] = imgrepr(vfp,dict)
%IMGREPR Convert image to representation based on given dictionary
%   Detailed explanation goes here
    ld = size(dict,1);
    len = length(vfp);
    ides = zeros(ld,1);
    for i=1:len
        tmp = repmat(vfp(i).desc',ld,1); % find closest voce element
        tmp = (tmp - dict).^2;
        tmp = sqrt(sum(tmp,2));
        [~,vi] = min(tmp);
        ides(vi) = ides(vi) + 1;
    end
    out = ides;
end
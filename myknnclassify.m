function [rgp] = myknnclassify(trcs,trgp,td,k)
%kNN k-nearest-neighbor

%trcs = [imc1.repr, imc2.repr, imc3.repr, imc4.repr]';
%trgp = [ones(180,1); ones(220,1)*2; ones(165,1)*3; ones(110,1)*4];
if nargin<4
    k = 15;
end
ltd = size(td,1); % length of all test data
len = size(trcs,1); % length of training set
fdim = size(trcs,2); % dimension of image representation

rgp = zeros(ltd,1); % test group prediction init

for itr = 1:ltd
    simi = zeros(len,1);
    for i=1:len
        for j=1:fdim
            simi(i) = simi(i) + min(trcs(i,j), td(itr,j)); % histogram similarity
        end
    end
    [~, si] = sort(simi,'descend');
    rslgp = trgp( si(1:k) ); % find the max k cases with similarity
    rgp(itr) = mode(rslgp); % the most frequent type is the result
end
end

trcs = [imc1(1:180).repr, imc2(1:220).repr, imc3(1:165).repr, imc4(1:111).repr]';
trgp1 = [ones(180,1); ones(220,1); ones(165,1)*0; ones(111,1)*0];
trgp2 = [ones(180,1); ones(220,1)*0; ones(165,1); ones(111,1)*0];

svms(1)= svmtrain(trcs,trgp1,'kernel_function','rbf','rbf_sigma',20);
svms(2)= svmtrain(trcs,trgp2,'kernel_function','rbf','rbf_sigma',20);
%confusion matrix
matcf1 = zeros(4,4);
matcf2 = matcf1;
matcftr = matcf1;

tr1 = [imc1(1:180).repr]';
tr2 = [imc2(1:220).repr]';
tr3 = [imc3(1:165).repr]';
tr4 = [imc4(1:111).repr]';
for i=1:4
    matcftr(1,i) = sum(myClassify(svms,tr1)==i);
    matcftr(2,i) = sum(myClassify(svms,tr2)==i);
    matcftr(3,i) = sum(myClassify(svms,tr3)==i);
    matcftr(4,i) = sum(myClassify(svms,tr4)==i);    
end

vali1 = [imc1(181:280).repr]';
vali2 = [imc2(221:320).repr]';
vali3 = [imc3(266:365).repr]';
vali4 = [imc4(112:211).repr]';

test1 = [imc1(281:380).repr]';
test2 = [imc2(321:420).repr]';
test3 = [imc3(166:265).repr]';
test4 = [imc4(212:311).repr]';

for i=1:4
    matcf1(1,i) = sum(myClassify(svms,vali1)==i);
    matcf1(2,i) = sum(myClassify(svms,vali2)==i);
    matcf1(3,i) = sum(myClassify(svms,vali3)==i);
    matcf1(4,i) = sum(myClassify(svms,vali4)==i);    
end
for i=1:4
    matcf2(1,i) = sum(myClassify(svms,test1)==i);
    matcf2(2,i) = sum(myClassify(svms,test2)==i);
    matcf2(3,i) = sum(myClassify(svms,test3)==i);
    matcf2(4,i) = sum(myClassify(svms,test4)==i);    
end
disp(matcftr)
disp(matcf1)
disp(matcf2)
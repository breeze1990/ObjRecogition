% clss,dict done;
% dict size_d*128 bins for descriptions
alpha = 1;
for i=1:180
    fp = imc1(i).pts;
    fp = fp(1:round(alpha*length(fp)));
    imc1(i).repr = imgrepr(fp,dict);
end
for i=1:220
    fp = imc2(i).pts;
    fp = fp(1:round(alpha*length(fp)));
    imc2(i).repr = imgrepr(fp,dict);
end
for i=1:165
    fp = imc3(i).pts;
    fp = fp(1:round(alpha*length(fp)));
    imc3(i).repr = imgrepr(fp,dict);
end
for i=1:111
    fp = imc4(i).pts;
    fp = fp(1:round(alpha*length(fp)));
    imc4(i).repr = imgrepr(fp,dict);
end

trcs = [imc1(1:180).repr, imc2(1:220).repr, imc3(1:165).repr, imc4(1:111).repr]';
trgp = [ones(180,1); ones(220,1)*2; ones(165,1)*3; ones(111,1)*4];

%{
validation sets
none: 181~280
cars: 221~320
bike: 266~365
person: 112~211
%}
for i=181:280
    fname = strcat('validation\none\',fn1,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    fp = fp(1:round(alpha*length(fp)));
    imc1(i).repr = imgrepr(fp,dict);
end
for i=221:320
    fname = strcat('validation\cars\',fn2,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    fp = fp(1:round(alpha*length(fp)));
    imc2(i).repr = imgrepr(fp,dict);
end
for i=266:365
    fname = strcat('validation\bike\',fn3,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    fp = fp(1:round(alpha*length(fp)));
    imc3(i).repr = imgrepr(fp,dict);
end
for i=112:211
    fname = strcat('validation\person\',fn4,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    fp = fp(1:round(alpha*length(fp)));
    imc4(i).repr = imgrepr(fp,dict);
end

% test cases

for i=281:380
    fname = strcat('test\none\',fn1,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    fp = fp(1:round(alpha*length(fp)));
    imc1(i).repr = imgrepr(fp,dict);
end
for i=321:420
    fname = strcat('test\cars\',fn2,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    fp = fp(1:round(alpha*length(fp)));
    imc2(i).repr = imgrepr(fp,dict);
end
for i=166:265
    fname = strcat('test\bike\',fn3,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    fp = fp(1:round(alpha*length(fp)));
    imc3(i).repr = imgrepr(fp,dict);
end
for i=212:311
    fname = strcat('test\person\',fn4,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    fp = fp(1:round(alpha*length(fp)));
    imc4(i).repr = imgrepr(fp,dict);
end
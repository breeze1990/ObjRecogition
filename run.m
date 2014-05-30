% bg_graz_000.bmp, bike_000.bmp, carsgraz_000.bmp, person_000.bmp;
fn1 = 'bg_graz_';
fn2 = 'carsgraz_';
fn3 = 'bike_';
fn4 = 'person_';
apd = '.bmp';
tstart = cputime;
vdesc = [];
alpha = 0.5;
% initialization. store feature points of every image

for i=1:180
    fname = strcat('train\none\',fn1,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    imc1(i).pts = fp;
    fp = fp(1:round(alpha*length(fp)));
    vdesc = [vdesc, fp.desc];
end
for i=1:220
    fname = strcat('train\cars\',fn2,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    imc2(i).pts = fp;
    fp = fp(1:round(alpha*length(fp)));
    vdesc = [vdesc, fp.desc];
end
for i=1:165
    fname = strcat('train\bike\',fn3,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    imc3(i).pts = fp;
    fp = fp(1:round(alpha*length(fp)));
    vdesc = [vdesc, fp.desc];
end
for i=1:111
    fname = strcat('train\person\',fn4,sprintf('%03d',i),apd);
    im = im2double(rgb2gray(imread(fname)));
    fp = getFeatures(im);
    imc4(i).pts = fp;
    fp = fp(1:round(alpha*length(fp)));
    vdesc = [vdesc, fp.desc];
end

vdesc = vdesc';
cntfp = size(vdesc,1);
[~,dict] = myKmeans(vdesc,700);
tend = cputime;
disp((tend-tstart)/3600);

representation;
classification;
testsvm;
function [ tgp ] = myClassify( svms,tdata )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

gtest1 = svmclassify(svms(1),tdata);
gtest2 = svmclassify(svms(2),tdata);
tgp = 4-(gtest1*2+gtest2);

end
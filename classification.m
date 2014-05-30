% validation set
trsl1 = myknnclassify(trcs,trgp,[imc1(181:280).repr]');
trsl2 = myknnclassify(trcs,trgp,[imc2(221:320).repr]');
trsl3 = myknnclassify(trcs,trgp,[imc3(266:365).repr]');
trsl4 = myknnclassify(trcs,trgp,[imc4(112:211).repr]');
sum(trsl1==1)
sum(trsl2==2)
sum(trsl3==3)
sum(trsl4==4)
% test set
trsl5 = myknnclassify(trcs,trgp,[imc1(281:380).repr]');
trsl6 = myknnclassify(trcs,trgp,[imc2(321:420).repr]');
trsl7 = myknnclassify(trcs,trgp,[imc3(166:265).repr]');
trsl8 = myknnclassify(trcs,trgp,[imc4(212:311).repr]');
sum(trsl5==1)
sum(trsl6==2)
sum(trsl7==3)
sum(trsl8==4)
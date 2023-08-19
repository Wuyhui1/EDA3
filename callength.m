function [len,lenjz]= callength(pop,popsize,A,GKT,TJ)
for i=1:popsize
    A1=A(pop(i,:));
    [NH,NHJZ]=fitn(A1,GKT,TJ);
    len(i,1)=NH;%总会车次数
    lenjz(i,:)=NHJZ;
end
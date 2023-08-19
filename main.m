
clc;
close all;
load A;
%load B;
%load C;
GKT=xlsread('各卡车路段行程时间.xlsx');
popsize= 50;                  % 种群规模
maxgen= 1000;                   % 最大迭代次数
citysize=82;        % 任务总数
TJ=3;               %间隔时间
p= ones(citysize, citysize);   % 概率矩阵
sn= ceil(popsize * 0.5);       % 优势群体规模
bestlists= zeros(maxgen, citysize);    % 记录每代最优解
bestfits= zeros(1, maxgen);            % 记录每代最优解适应度值
avgfits= zeros(1, maxgen);% 记录每代平均适应度值
bfit1=100;
for gen =1:maxgen
    pop = makepop(popsize, citysize, p);    % 制作种群
    [fitness, lenjz]= callength(pop,popsize,A,GKT,TJ);
    [bfit, bfiti] = min(fitness);
    if bfit<bfit1
       bfit1=bfit;
       bfiti1=bfiti;
       Dbest=pop(bfiti1, :);
    end 
    bestlists(gen, :) = Dbest;
    bestfits(1, gen) = bfit1;
    avgfits(1, gen) = sum(fitness) / popsize;
    spop = selection(pop, sn, fitness);     % 选择优势群体
    p = makep(spop);                        % 更新概率矩阵
end
Zuiyoujie=bestlists(end,:);

FIT=bestfits*2.5;
FIT=FIT';
figure
plot(bestfits,'-b');
title('分布估计算法优化适应度曲线');
xlabel('迭代次数');
ylabel('Fitness value/min');
%[fitness,lenjz] =callength(bestlists,popsize,A,B,C);

%[bfit, bfiti]= min(fitness);
%fprintf("最短距离:%f\n", bfit);
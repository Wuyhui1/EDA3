%% 适应度函数fit.m
function fitness=fit(len,m,maxlen,minlen)%%输入的值分别种群当中不同个体对应的距离，适应度加速淘汰指数，最大距离值和最小距离值
    fitness=len;
    for i =1:length(len)
        fitness(i,1)=(1-(len(i,1)-minlen)/(maxlen-minlen+0.0001)).^m;%%为了使得优化速度更快，这里就把目标函数故意求平方
    end
end

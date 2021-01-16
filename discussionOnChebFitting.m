close all

freq = 100;
anguVelo = @(x) sin(2*pi*freq*x);
T = 1/(1000)

subPlotColNum = 2;
dotNumArray = [10 15 20 40];
plotRow = length(dotNumArray)

figure(1)
for i = 1:plotRow
    dotNum = dotNumArray(i);
    t = (0:1:(dotNum-1))*T;
    y = sin(2*pi*freq*t)
    %%%%##########@@@@@@@@@@@@
    cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
    chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
    subplot(plotRow,subPlotColNum,(i-1)*2+1)
    fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
    % set(gca,'Color',[0.5 0.5 0.5])
    title('Chebyshev');
    %%%%##########@@@@@@@@@@@@
    npFunc = matlabFunction(MonomialInpterpolateN(dotNum, T , y ))
    npErrorFunc = @(x) npFunc(x) - anguVelo(x)
    subplot(plotRow,subPlotColNum,i*2)
    fplot(npErrorFunc,[0, t(end)],'k','LineWidth',1);
    % set(gca,'Color',[0.5 0.5 0.5])
    title('monomial');
end

figure(2)
for i = 1:plotRow
    dotNum = dotNumArray(i);
    t = (0:1:(dotNum-1))*T;
    y = sin(2*pi*freq*t)
    %%%%##########@@@@@@@@@@@@
    cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
    chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))-1) - anguVelo(x)
    subplot(plotRow,subPlotColNum,(i-1)*2+1)
    fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
    % set(gca,'Color',[0.5 0.5 0.5])
    title('Chebyshev');
    %%%%**********___________
    npFuncTrans = matlabFunction(MonomialInpterpolateNtrans(dotNum, T , y ))
    npErrorFuncTrans = @(x) npFuncTrans(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
    subplot(plotRow,subPlotColNum,i*2)
    fplot(npErrorFuncTrans,[0, t(end)],'k','LineWidth',1);
    % set(gca,'Color',[0.5 0.5 0.5])
    title('monomial');
    
end

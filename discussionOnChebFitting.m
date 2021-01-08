close all

stepN = 10
freq = 100;
anguVelo = @(x) sin(2*pi*freq*x);
T = 1/(1000);
subPlotColNum = 2;
plotRow = 4

figNum = 1;
figure(figNum)

dotNum = 10;
t = (0:1:(dotNum-1))*T;
y = sin(2*pi*freq*t)
%%%%##########@@@@@@@@@@@@
cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,3)
% fplot(cheFunc,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby');
chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,1)
fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
title('Chebyshev');

%%%%##########@@@@@@@@@@@@
npFunc = matlabFunction(MonomialInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,5)
% fplot(npFunc,[0, t(end)],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('np'); 
npErrorFunc = @(x) npFunc(x) - anguVelo(x)
subplot(plotRow,subPlotColNum,2)
fplot(npErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
title('monomial');



dotNum = 20;
t = (0:1:(dotNum-1))*T;
y = sin(2*pi*freq*t)
%%%%##########@@@@@@@@@@@@
cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,3)
% fplot(cheFunc,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby');
chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,3)
fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby err');
%%%%##########@@@@@@@@@@@@
npFunc = matlabFunction(MonomialInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,5)
% fplot(npFunc,[0, t(end)],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('np'); 
npErrorFunc = @(x) npFunc(x) - anguVelo(x)
subplot(plotRow,subPlotColNum,4)
fplot(npErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('np err');


dotNum = 40;
t = (0:1:(dotNum-1))*T;
y = sin(2*pi*freq*t)
%%%%##########@@@@@@@@@@@@
cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,3)
% fplot(cheFunc,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby');
chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,5)
fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby err');
%%%%##########@@@@@@@@@@@@
npFunc = matlabFunction(MonomialInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,5)
% fplot(npFunc,[0, t(end)],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('np'); 
npErrorFunc = @(x) npFunc(x) - anguVelo(x)
subplot(plotRow,subPlotColNum,6)
fplot(npErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('np err');


dotNum = 50;
t = (0:1:(dotNum-1))*T;
y = sin(2*pi*freq*t)
%%%%##########@@@@@@@@@@@@
cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,3)
% fplot(cheFunc,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby');
chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,7)
fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby err');
%%%%##########@@@@@@@@@@@@
npFunc = matlabFunction(MonomialInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,5)
% fplot(npFunc,[0, t(end)],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('np'); 
npErrorFunc = @(x) npFunc(x) - anguVelo(x)
subplot(plotRow,subPlotColNum,8)
fplot(npErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('np err');




%%%%% Fig 2
figNum = 2;
figure(figNum)

dotNum = 10;
t = (0:1:(dotNum-1))*T;
y = sin(2*pi*freq*t)
%%%%##########@@@@@@@@@@@@
cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,3)
% fplot(cheFunc,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby');
chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,1)
fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
title('Chebyshev');
%%%%**********___________
npFuncTrans = matlabFunction(MonomialInpterpolateNtrans(dotNum, T , y ))
% subplot(1,subPlotColNum,7)
% fplot(npFuncTrans,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('npT'); 
npErrorFuncTrans = @(x) npFuncTrans(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,2)
fplot(npErrorFuncTrans,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
title('monomial');


dotNum = 20;
t = (0:1:(dotNum-1))*T;
y = sin(2*pi*freq*t)
%%%%##########@@@@@@@@@@@@
cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,3)
% fplot(cheFunc,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby');
chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,3)
fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby err');
%%%%**********___________
npFuncTrans = matlabFunction(MonomialInpterpolateNtrans(dotNum, T , y ))
% subplot(1,subPlotColNum,7)
% fplot(npFuncTrans,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('npT'); 
npErrorFuncTrans = @(x) npFuncTrans(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,4)
fplot(npErrorFuncTrans,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('npT err');

dotNum = 40;
t = (0:1:(dotNum-1))*T;
y = sin(2*pi*freq*t)
%%%%##########@@@@@@@@@@@@
cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,3)
% fplot(cheFunc,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby');
chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,5)
fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby err');
%%%%**********___________
npFuncTrans = matlabFunction(MonomialInpterpolateNtrans(dotNum, T , y ))
% subplot(1,subPlotColNum,7)
% fplot(npFuncTrans,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('npT'); 
npErrorFuncTrans = @(x) npFuncTrans(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,6)
fplot(npErrorFuncTrans,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('npT err');

dotNum = 50;
t = (0:1:(dotNum-1))*T;
y = sin(2*pi*freq*t)
%%%%##########@@@@@@@@@@@@
cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ))
% subplot(1,subPlotColNum,3)
% fplot(cheFunc,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby');
chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,7)
fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('cheby err');
%%%%**********___________
npFuncTrans = matlabFunction(MonomialInpterpolateNtrans(dotNum, T , y ))
% subplot(1,subPlotColNum,7)
% fplot(npFuncTrans,[-1, 1],'k--');
% set(gca,'Color',[0.5 0.5 0.5])
% title('npT'); 
npErrorFuncTrans = @(x) npFuncTrans(2*x/(T*(dotNum-1))- 1) - anguVelo(x)
subplot(plotRow,subPlotColNum,8)
fplot(npErrorFuncTrans,[0, t(end)],'k','LineWidth',1);
% set(gca,'Color',[0.5 0.5 0.5])
% title('npT err');
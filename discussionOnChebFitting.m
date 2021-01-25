close all

freq = 100;
anguVelo = @(x) sin(2*pi*freq*x);
T = 1/(1000)

subPlotColNum = 2;
dotNumArray = [10 15 20 40];
plotRow = length(dotNumArray);

figure(1)
for i = 1:plotRow
    dotNum = dotNumArray(i);
    t = (0:1:(dotNum-1))*T;
    y = sin(2*pi*freq*t);
    %%%%##########@@@@@@@@@@@@
    [poly, ~] = ChebyInpterpolateN(dotNum, T , y );
    cheFunc = matlabFunction(poly);
    chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))- 1) - anguVelo(x);
    subplot(plotRow,subPlotColNum,(i-1)*2+1)
    fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
    ylabel("N="+( dotNum))
    % set(gca,'Color',[0.5 0.5 0.5])
    if i==1
        title('Chebyshev');
    end
    %%%%##########@@@@@@@@@@@@
    [poly, ~] = MonomialInpterpolateN(dotNum, T , y );
    npFunc = matlabFunction(poly);
    npErrorFunc = @(x) npFunc(x) - anguVelo(x);
    subplot(plotRow,subPlotColNum,i*2)
    fplot(npErrorFunc,[0, t(end)],'k','LineWidth',1);
    % set(gca,'Color',[0.5 0.5 0.5])
    if i==1
    	title('Monomial');
    end
end

figure(2) % plot the fitted error of Chebyshev and monomial with centering and scaling
for i = 1:plotRow
    dotNum = dotNumArray(i);
    t = (0:1:(dotNum-1))*T;
    y = sin(2*pi*freq*t);
    %%%%##########@@@@@@@@@@@@
    cheFunc = matlabFunction(ChebyInpterpolateN(dotNum, T , y ));
    chebyErrorFunc = @(x) cheFunc(2*x/(T*(dotNum-1))-1) - anguVelo(x);
    subplot(plotRow,subPlotColNum,(i-1)*2+1)
    fplot(chebyErrorFunc,[0, t(end)],'k','LineWidth',1);
    ylabel("N="+( dotNum))
    % set(gca,'Color',[0.5 0.5 0.5])
    if i==1
        title('Chebyshev');
    end
    %%%%**********___________
    npFuncTrans = matlabFunction(MonomialInpterpolateNtrans(dotNum, T , y ));
    npErrorFuncTrans = @(x) npFuncTrans(2*x/(T*(dotNum-1))- 1) - anguVelo(x);
    subplot(plotRow,subPlotColNum,i*2)
    fplot(npErrorFuncTrans,[0, t(end)],'k','LineWidth',1);
    % set(gca,'Color',[0.5 0.5 0.5])
    if i==1
        title('CS-Monomial');
    end
    
end

figure(3)    % plot the coefficients of Cheby and vanilla mono
for i = 1:1
    dotNum = dotNumArray(i);
    t = (0:1:(dotNum-1))*T;
    y = sin(2*pi*freq*t);
    yyaxis left
    [~, coeffsCheby] = ChebyInpterpolateN(dotNum, T , y );
    semilogy(0:(dotNum-1),abs(coeffsCheby),'LineWidth',1)
    hold on
    
    [~, coeffs] = MonoInterpoTransPower2(dotNum, T , y)
    semilogy(0:(dotNum-1),abs(coeffs),'LineWidth',1)
    
    [~, coeffsMonoTrans] = MonomialInpterpolateNtrans(dotNum, T , y );
    semilogy(0:(dotNum-1),abs(coeffsMonoTrans),'LineWidth',1)
    
    ylabel('Coefficients')
    xlabel('Polynomial Order')
    
    hold off
    yyaxis right
    [~, coeffsMono] = MonomialInpterpolateN(dotNum, T , y );
    % log function is always positive, but the coefficients can be 0 
    % and cannot be shown on semilog plot.
    % the following if condition is to handle this 
    if abs(coeffsMono(1)) < 0.001 % this if condition is to handle 
        coeffsMono(1) = 0.001;
    end
    semilogy(0:(dotNum-1),abs(coeffsMono),'LineWidth',1)
    
    ylabel('Coefficients')
    legend('Cheby', 'CSPMono', 'CSMono', 'VaMono');
%     set(gca,'Color',[0.5 0.5 0.5])
end

% figure(4)    % plot the coefficients of Cheby and vanilla mono
% for i = 1:1
%     dotNum = dotNumArray(i);
%     t = (0:1:(dotNum-1))*T;
%     y = sin(2*pi*freq*t)
%     yyaxis left
%     [poly, coeffsCheby] = ChebyInpterpolateN(dotNum, T , y );
%     coeffsCheby
%     semilogy(1:dotNum,abs(coeffsCheby),'LineWidth',1)
%     ylabel('Chebyshev Coefficients')
%     xlabel('Polynomial Order')
%     
%     yyaxis right
%     [poly, coeffsMonoTrans] = MonomialInpterpolateNtrans(dotNum, T , y )
%     coeffsMonoTrans
%     semilogy(1:dotNum,abs(coeffsMonoTrans),'LineWidth',1)
%     ylabel('CS Monomial Coefficients')
% 
%     set(gca,'Color',[0.5 0.5 0.5])
% end

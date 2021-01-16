function [outputArg1, coeffs] = MonomialInpterpolateN(orderNum, SamplingPeriod, samples)
%%%% T is the sampling period

    if orderNum <= 0 || orderNum > 100
        msg = 'order is assigned incorrectly.';
        error(msg)
    end

    syms x 
    T = sym(SamplingPeriod);
    order  = orderNum;

    %%%% construct the chebyshev polynomials
    monoBasis = sym([]);
    monoBasis(1) = sym(1);
    monoBasis(2) = x;
    for i = 3:100
        monoBasis = [monoBasis x*monoBasis(end)];
    end

    %%%% define the coefficents 
    coeff = sym('coeff',[1,order]);
    
    %%%% construct the angular velocity by multiplying the basis and the
    %%%% corresponding coefficients and then add up all of them 
    wPolynomial = sym(0);
    for i = 1:order
        wPolynomial = wPolynomial + coeff(i)*monoBasis(i);
    end
%     equals
    equals = sym([]);
    for i =1:order
%         equals = [equals int((order)/2*T*wPolynomial,x,-1+(i-1)*2/(order),-1+i*2/(order))==samples(i)];
        equals = [equals subs(wPolynomial , x, (i-1)*SamplingPeriod) == samples(i)];
    end
    coeff_solve = solve(equals, coeff);

    fields = fieldnames(coeff_solve);
    wPolynomial = sym(0);
    coeffs = [];
    for i = 1:order
        wPolynomial = wPolynomial + getfield(coeff_solve(1), fields{i})*monoBasis(i);
        coeffs = [coeffs vpa(getfield(coeff_solve(1), fields{i}))];
    end
    outputArg1 = wPolynomial;
end


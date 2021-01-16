function [outputArg1,coeffs] = ChebyInpterpolateN(orderNum, SamplingPeriod, samples)
%%%% T is the sampling period

    if orderNum <= 0 || orderNum > 100
        msg = 'order is assigned incorrectly.';
        error(msg)
    end

    syms x 
    T = sym(SamplingPeriod);
    order  = orderNum;

    %%%% construct the chebyshev polynomials
    chebyBasis = sym([]);
    chebyBasis(1) = sym(1);
    chebyBasis(2) = x;
    for i = 3:100
        chebyBasis = [chebyBasis collect(2*x*chebyBasis(end)-chebyBasis(end-1))];
    end

    %%%% define the coefficents 
    coeff = sym('coeff',[1,order]);

    %%%% construct the angular velocity by multiplying the basis and the
    %%%% corresponding coefficients and then add up all of them 
    wPolynomial = sym(0);
    for i = 1:order
        wPolynomial = wPolynomial + coeff(i)*chebyBasis(i);
    end

    equals = sym([]);
    
    for i =1:order
%         equals = [equals int((order)/2*T*wPolynomial,x,-1+(i-1)*2/(order),-1+i*2/(order))==samples(i)];
        equals = [equals subs(wPolynomial , x, -1+(i-1)*2/(order - 1))==samples(i)];
    end
%     equals
    coeff_solve = solve(equals, coeff);

    fields = fieldnames(coeff_solve);
    wPolynomial = sym(0);
    coeffs = [];
    for i = 1:order
        wPolynomial = wPolynomial + getfield(coeff_solve(1), fields{i})*chebyBasis(i);
        coeffs = [coeffs vpa(getfield(coeff_solve(1), fields{i}))];
    end
    outputArg1 = wPolynomial;
end


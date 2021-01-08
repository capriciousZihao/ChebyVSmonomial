function [outputArg1] = ChebyInpterpolateN(orderNum, SamplingPeriod, samples)
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
%     chebyBasis

    %%%% define the coefficents 
    coeff = sym('coeff',[1,order]);

    %%%% define the samples and transform the range of the coordinate
    %%%%  to [-1,1] from [0, (order+1)*T]
%     samples = sym('samples',[1,order])
    % samplesTime = 

    %%%% construct the angular velocity by multiplying the basis and the
    %%%% corresponding coefficients and then add up all of them 
    wPolynomial = sym(0);
    for i = 1:order
        wPolynomial = wPolynomial + coeff(i)*chebyBasis(i);
    end
%     wPolynomial;
    %%%% integerate angular velocity from -1 to the first 
    equals = sym([]);
    for i =1:order
%         equals = [equals int((order)/2*T*wPolynomial,x,-1+(i-1)*2/(order),-1+i*2/(order))==samples(i)];
        equals = [equals subs(wPolynomial , x, -1+(i-1)*2/(order - 1))==samples(i)];

    end
%     equals
    coeff_solve = solve(equals, coeff);

    fields = fieldnames(coeff_solve);
    wPolynomial = sym(0);
    for i = 1:order
        wPolynomial = wPolynomial + getfield(coeff_solve(1), fields{i})*chebyBasis(i);
    end
    outputArg1 = wPolynomial;

end


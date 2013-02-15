function v = order(p)
% ORDER  order of variables in a multivariate polynomial
%
% The order of a variable in a polynomial is the largest
% exponent of that variable occurring in monomials with
% non-zero coefficients. Thus x y^3 + x^2 y^2 has order
% 2 in x and 3 in y.  This function returns the orders of
% the variables of its argunent in a vector.
%
% This function will exit with an error if passed the 
% zero polynomial.
    
    sz = size(p.coef);
    nd = numel(sz);
    sub = cell(1, nd);
    [sub{:}] = ind2sub(sz, find(p.coef));
    v = max([sub{:}],[],1) - 1;
    if numel(v) == 0
        error('order undefined for zero mvpoly');
    end

end
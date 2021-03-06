function d = homdeg(p)
% HOMDEG - homogeneous degree of multivariate polynomial
%
% The homogeneous degree of a monomial is the sum of its
% exponents (so x has homogeneous degree 1, xy^2 has 
% homogeneous degree 3 and so on).  The homogeneous degree
% of a multivariate polynomial is the maximal homogeneous
% degree of its monomial with nonzero coefficients.
%
% Note that a polynomial with only zero coefficients does
% not have a homogeneous degree, and this this case the 
% function will raise an error.
    
    sz = size(p.coef);
    nd = numel(sz);
    sub = cell(1, nd);
    [sub{:}] = ind2sub(sz, find(p.coef));
    d = max(sum([sub{:}] - 1, 2));
    if numel(d) == 0
        error('homdeg undefined for zero mvpoly');
    end
    
end
    
function y = polyval(p, x) 
%POLYVAL  evaluate a multivariate polynomial
%
%    This function is a wrapper around polyval_cube

    y = polyval_cube(p.coef, x);

end

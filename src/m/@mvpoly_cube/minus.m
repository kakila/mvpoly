function c = minus(a, b)
% MINUS - subtract multivariate polynomials
%
% The call
%
%   c = minus(a,b)
%
% (or equvalently, c = a-b) will return the difference
% of the polynomials a and b.  The arguments need not be
% of the same size, nor of the same number of variables.
%
% See also @mvpoly_cube/plus, @mvpoly_cube/uminus
    
    c = a + (-b);

end
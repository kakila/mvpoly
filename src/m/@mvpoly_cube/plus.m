function q = plus(p1, p2)
% PLUS - add multivariate polynomials
%
% The call
%
%   c = plus(a, b)
%
% (equivalently c = a+b) returns the sum of the polynomials
% a and b.  The summmands need not be of the same size nor
% of the same number of varaibles
%
% See also @mvpoly_cube/minus, @mvpoly_cube/uminus
    
    q = mvpoly_cube(pluspad(p1.coef, p2.coef));    

end

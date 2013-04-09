function q = plus(p1, p2)
% PLUS - add multivariate polynomials
%
% The call
%
%   c = plus(a, b)
%
% (equivalently c = a+b) returns the sum of the polynomials
% a and b.  The summmands need not be of the same size nor
% of the same number of variables.  One of the arguments may
% be a scalar, and will then be interpreted as one would 
% expect
%
% See also @mvpoly_cube/minus, @mvpoly_cube/uminus
    
    if isa(p1, 'mvpoly_cube')
        c1 = p1.coef;
    else
        c1 = p1;
    end

    if isa(p2, 'mvpoly_cube')
        c2 = p2.coef;
    else
        c2 = p2;
    end
    
    q = mvpoly_cube(pluspad(c1, c2));    

end

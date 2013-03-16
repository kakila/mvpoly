function p = mvpoly_cube(a)
% MVPOLY_CUBE - Create multivariate polynomial
%
% Creates a multivariate polynomial object with an ND-array 
% used to store the coefficients, this is for dense 
% polyomials, those with few zero coefficients. The call
%
%   p = mvpoly_cube(a)
%
% creates a polynomial p with coefficients given by the 
% n-dimensional arrary a. In contrast to the convention
% used in Matlab's polyval, the constant term is a(1,1,..,)
% and a(n,m,...) corresponds to the coefficient of 
% x^(n+1) y^(m+1) ... However, it is more intuitive to assign
% the coefficients with the mvpoly_cube assignment method:
%
%   p = mvpoly_cube(eye(2,2))
%
% and
%
%   p = mvpoly_cube(); p(0,0) = p(1,1) = 1;
%
% produce the same object.
%
% See also @mvpoly_cube/subsasgn

    classname = 'mvpoly_cube';
    if nargin == 0
        p.coef = [0];
        p = class(p, classname);
    elseif nargin == 1
        if isa(a, classname)
            p = a;
        elseif isnumeric(a)
            p.coef = a;
            p = class(p, classname);
        else
            error('%s: bad constructor argument', classname);
        end
    else
        print_usage();
    end
    
end

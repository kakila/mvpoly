function p = mvpoly_cube(a)
% MVPOLY_CUBE  Create multivariate polynomial
%
% Creates a multivariate polynomial object with 
% an ND-array used to store the coefficients,
% this is for dense polyomials, those with few
% zero coefficients.
    
    classname = 'mvpoly_cube';
    if (nargin == 0)
        p.coef = [0];
        p = class(p, classname);
    elseif (nargin == 1)
        if (strcmp(class(a), classname))
            p = a;
        elseif (ismatrix(a) && isnumeric(a))
            p.coef = a;
            p = class(p, classname);
        else
            error('%s: bad constructor argument', classname);
        end
    else
        print_usage();
    end
    
end

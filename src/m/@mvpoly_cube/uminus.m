function b = uminus(a)
% UMINUS - negate a multivariate polynomial
%
% The call 
%
%     uminus(p)
%
% (equivalently -p) returns the polynomial whose
% coeficients are the negative of those of p.
    
    b = mvpoly_cube( -(a.coef) );

end
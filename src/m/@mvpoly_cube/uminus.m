function b = uminus(a)
% UMINUS  negate a multivariate polynomial
    
    b = mvpoly_cube( -(a.coef) );

end
function b = uminus(a)
% UMINUS  negate a multivariate polynomial
    b = mvpoly_dmd( -(a.coef) );
end
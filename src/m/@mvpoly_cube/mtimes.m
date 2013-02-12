function q = mtimes(p1, p2)
% MMULT  multiply multivariate polynomials
%
% For a cubic representation of a multivariate
% polynomial, multiplication is easy and fast,
% since is can be performed by convolution which
% is just the FFT.
    
    if isnumeric(p1)
        m1 = p1;
    else
        m1 = p1.coef;
    end
    
    if isnumeric(p2)
        m2 = p2;
    else
        m2 = p2.coef;
    end
    
    q = mvpoly_cube( convn(m1, m2) );
    
end

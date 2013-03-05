function q = mtimes(p1, p2)
% MTIMES - multiply multivariate polynomials
%
% The call
%
%    c = mtimes(a, b)
%
% (or equvalently, c = a*b) returns the product of
% polynomials a and b.
%
% For a cubic representation of a multivariate
% polynomial, this product is easy and fast since is 
% can be performed by convolution (via the FFT).
%
% See also fft
    
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
    
    if (numel(m1) == 1) || (numel(m2) == 1)
        m3 = m1 * m2;
    else
        m3 = convn(m1, m2);
    end
        
    q = mvpoly_cube(m3);
    
end

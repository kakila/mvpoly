function q = mpower(p, n)
% MPOWER - raise a polynomial to an integer power
%
% A call to mpower(p, n), or equivalently to p^n,
% returns the mutivariate polynomial p*p...*p where
% the usual mutiplication of polynomials is applied.
    
% Note, the implementation here is simple but hopelessly 
% inefficient, it will be replaced by FFT based code
% in due course
    
    if nargin ~= 2
        error('mpower requires exactly 2 arguments');
    end
    
    if n<0
        error('mpower needs a non-negative power');
    elseif n == 0
        q = mvpoly_cube([1]);
        return;
    end
    
    q = p;
    
    for i = 2:n
        q = q*p;     
    end

end

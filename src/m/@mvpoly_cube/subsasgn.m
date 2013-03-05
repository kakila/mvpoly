function x = subsasgn(x, ss, val)
% SUBSASGN - assignment of polynomial coeffiecients
%
% Given an mvpoly_cube object p, assign the coefficient
% of x^n y^m ... to C with the call
%
%   p(n,m,...) = C
%
% i.e., this is just as with the usual Matlab indexing
% except that the indicies start from zero.
%
% See also @mvpoly_cube/subsref
    
    ss.subs = subsnorm(cellfun(@exp2sub, ss.subs, 'UniformOutput', false));
    x.coef = subsasgn(x.coef, ss, val);

end


function q = subsref(p, s)
% SUBSREF - subscript access to multivariate polynomial
%
% References a polynomial using the object subsripting
% mechanism.  The call
%
%    p.coef
%
% returns the n-dimensional array which is used to store
% the coefficients of the polynomial p.
%
% The call p(a,b,..) access the coefficient determined
% by a, b, ..., which may be ranges (such as 1:5) or the
% "magic colon", returning the full range of that variable.
%
% The "brace subscripts" p{} are not defined for 
% mvpoly_cube objects.    
%
% See also subsref, subsasgn, @mvpoly_cube/subsasgn
    
    if (isempty(s))
        error('@mvpoly_cube/subsref: missing index');
    end

    switch ( s(1).type )
      
      case '()'
        subs = subsnorm(cellfun(@exp2sub, s(1).subs, 'UniformOutput', false));
        s(1).subs = subs;
        q = subsref(p.coef, s);
      
      case '.'
        switch ( s.subs )
          case 'coef'
            q = p.coef;
          otherwise
            error('@mvpoly_cube/subsref: invalid property %s', s.subs);
        end

      otherwise
        error('invalid subscript type');

    end
    
end



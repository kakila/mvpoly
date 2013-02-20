function q = compose(p, varargin)
% COMPOSE  compose multivariate polynomials
%
% If p is a mutlivariate polynomial in n variables and
% X, Y, ... are multivariate polynomaials then
%
%  q = compose(p, X, Y, ...)
%
% returns the polynomial obtained by subtituting 
% X, Y, ... into the variables of p. As an example,
% if p = X^2 + 2Y, the substuting X = x+y, Y = y
% gives
%
%  (x+y)^2 + 2(y) = x^2 + 2xy + y^2 + 2y
%
    
    sz   = order(p);
    nvar = numel(sz);
    coef = p.coef;
    
    if nvar != numel(varargin)
        error('wrong number of arguments');
    end
        
    % precompute powers of X, Y, ...
    
    pv = cell(nvar, 1);
    
    for i = 1:nvar
        v = cell(sz(i), 1);
        vi = varargin{i};
        v{1} = vi;
        for j = 2:sz(i)
            v{j} = v{j-1} * vi;
        end
        pv{i} = v;
    end

    % return value
    
    q = mvpoly_cube();
    
    % iterate over monomials with nonzero coefficients
    
    csz = size(coef);
    sub = cell(nvar,1);
    nzi = find(coef);

    for i = 1:numel(nzi)

        % get v, monomial for this coefficient
        
        [sub{:}] = ind2sub(csz, nzi(i));
        v = mvpoly_cube(1);
        for j = 1:numel(sub)
            if sub{j} > 1
                v = v * pv{j}{sub{j} - 1};
            end
        end

        q = q + coef(nzi(i)) * v;
    
    end
    
end
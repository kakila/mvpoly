function q = compose(p, varargin)
% COMPOSE - compose multivariate polynomials
%
% If p is a mutlivariate polynomial in n variables and
% X, Y, ... are multivariate polynomaials then
%
%   q = compose(p, X, Y, ...)
%
% returns the polynomial obtained by subtituting 
% X, Y, ... into the variables of p. As an example,
% if p = X^2 + 2Y, the substuting X = x+y, Y = y
% gives
%
%   (x+y)^2 + 2(y) = x^2 + 2xy + y^2 + 2y
%
% This is not particularly fast since we do quite a
% bit of iteration in the interpreter
    
    ords = order(p);
    N    = numel(ords);
    C    = p.coef;
    
    if N ~= numel(varargin)
        error('wrong number of arguments');
    end
        
    % precompute powers of polynomials to substitute,
    % stored in the cell array of cell arrays X, 
    % X{i}{n} is the n-th power of the i-th polynomial 
    % to substitute
    
    X = cell(N, 1);
    
    for i = 1:N
        Xi = cell(ords(i), 1);
        Xi1 = varargin{i};
        Xi{1} = Xi1;
        for n = 2:ords(i)
            Xi{n} = Xi{n-1} * Xi1;
        end
        X{i} = Xi;
    end

    % return value
    
    q = mvpoly_cube();
    
    % iterate over monomials with nonzero coefficients
    
    Csz = size(C);
    sub = cell(N,1);
    nz  = find(C);

    for i = 1:numel(nz)

        % get M, monomial for this coefficient
        
        [sub{:}] = ind2sub(Csz, nz(i));
        M = mvpoly_cube(1);
        for j = 1:numel(sub)
            n = sub{j} - 1;
            if n
                M = M * X{j}{n};
            end
        end

        q = q + C(nz(i)) * M;
    
    end

end

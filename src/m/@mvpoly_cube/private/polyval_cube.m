function y = polyval_cube(p, x) 
% POLYVAL_CUBE - evaluate a multivariate polynomial
%
% The n-variate polynomial p, represented as an n-dimensional
% array, is evaluated for each value in the array x. The last 
% dimension of x should be of size n corresponding to the n
% variables in the polynomial.
% 
% In contrast to the convention used in the Matlab builtin
% polyval(), the lowest order coefficient of the polynomial 
% comes first in the array, and we take the first index to 
% be the index of the x-coefficient, the second of the 
% y-coefficient and so on. For a bivariate polynomial the array 
% is a matrix and we have this sort of structure
%
%     [  1,    y, ... ,    y^m 
%        x,   xy, ... ,   xy^m  
%        :     :, ... ,    :
%      x^n, x^ny, ... , x^ny^m
%    
% Example: the polynomial x^2 + 2y^2 - 1 
%
%      p = [-1, 0, 2;
%            0, 0, 0;
%            1, 0, 0]
%
% Evaluated at x=1, y=2 
%
%      polyval_cube(p, [1,2])
%      ans = 8
% 
% Evaluated at x,y = 1,..,5: we generate a 5x5x2 array xy
% with the x values in xy(:,;,1), the y values in xy(:,:,2)
%
%      [x,y] = meshgrid(1:5)
%      xy = cat(3, x, y)
%      polyval_cube(p, xy)
%      ans =
%          2    5   10   17   26
%          8   11   16   23   32
%         18   21   26   33   42
%         32   35   40   47   56
%         50   53   58   65   74
%
% The evaluation method is a nested Horner's rule which is
% implemented recursively. No attempt is made to exploit the 
% sparsity (if any) of the polynomial. 
%
% NOTE - this file is based on the polyvaln.m by the same
% author, the files differ in whether or not they interpret 
% the input array in the same way as Matlab builtin polyval.
%
% Copyright (c) 2013, J.J. Green

    if nargin ~= 2
        error('exactly 2 arguments required')
    end

    % size of last dimension of x

    dx = size(x);    
    if isvector(x)
        ndx  = 1;
        sldx = dx(2);
    else
        ndx  = numel(dx);
        sldx = dx(ndx);
    end
    
    % number of dimensions of p
   
    if isvector(p)
        db = numel(p);
        ndp = 1;
    else
        dp = size(p);
        ndp = numel(dp);
    end
 
    % check dimensions match
    
    if ndp ~= sldx
        error('size of last dim of x should equal number of dims of p')
    end
    
    % reshape x if needed
    
    if ndx > 1
        x = reshape(x, prod(dx(1:ndx-1)), sldx);
    end
    
    % call recursive subfunction
    
    y = pvn2(p, x);
    
    % reshape y to the same pattern as x if needed
    
    if ndx > 2
        y = reshape(y, dx(1:ndx-1));
    end
    
end
  
% recurse over the dimensions of p, evaluating using
% polyval() at the leaves of the recursion but pvn3()
% as we accumulate the totals

function y = pvn2(p, x) 

    if isvector(p)
        y = polyval(flipdim(p(:), 1), x);
        return;
    end

    d  = size(p);
    nd = numel(d);
    
    c(1:nd-1) = {':'};
    x0 = x(:, 2:nd);
    
    for i = 1:d(1)
        p0 = squeeze(p(i, c{:}));
        p1(:, i) = pvn2(p0, x0);
    end
    
    y = pvn3(p1, x(:, 1));

end

% this is like polyval() except that p is an matrix
% with the same number of rows as x 

function y = pvn3(p, x) 

    n = size(p, 2);
    y = p(:, n);
    for k = (n-1):-1:1
        y = y.*x + p(:, k);
    end 

end

function y = polyval_cube(p, x) 
% POLYVAL_CUBE - evaluate a multivariate polynomial
%
% The n-variate polynomial p, represented as an n-dimensional
% array, is evaluated for each value in the array x. The first 
% dimension of x should be of size n corresponding to the n
% variables in the polynomial (ie, the number of dimensions
% of the array of coefficients of p).
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
%      x^n, x^ny, ... , x^ny^m ]
%    
% Example: the polynomial x^2 + 2y^2 - 1 
%
%      p = [-1, 0, 2;
%            0, 0, 0;
%            1, 0, 0]
%
% Evaluated at x=1, y=2 
%
%      polyval_cube(p, [1 2]')
%      ans = 8
% 
% (note that the second argument is a column vector)
% 
% Evaluated at x,y = 1,..,5: we generate a 2x5x5 array xy
% with the x values in xy(1,:,:), the y values in xy(2,:,:)
%
%      [x,y] = meshgrid(1:5)
%      xy(1,:,:) = x
%      xy(2,:,:) = y
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
    
    % number of variables of p
   
    dp = size(p);
    if iscolumn(p)
        nvp = 1;
    else
        nvp = numel(dp);
    end

    vp = dp(1:nvp);
    
    % size of first dimension of x

    dx = size(x);
    if iscolumn(x)
        ndx = 1;
    else
        ndx = numel(dx);
    end

    % check dimensions match
    
    if nvp ~= dx(1)
        error(strcat('size of first dim of x (%i)',...
                     ' should equal number of dims of p (%i)'),...
              dx(1), nvp);
    end
    
    % reshape x if needed and call recursive function
    
    if ndx == 1
        y = pvn2(p, vp, nvp, x);
    else
        x = reshape(x, dx(1), prod(dx(2:ndx)));
        y = pvn2(p, vp, nvp, x);
        y = reshape(y, dx(2:ndx));
    end
     
end

function y = pvn2(p, vp, nvp, x)

    if nvp == 1
        y = polyval(flipdim(p(:), 1), x);
        return;
    end
    
    c(1:nvp-1) = {':'};
    
    for i = 1:vp(nvp)
        p0 = squeeze(p(i, c{:}));
        p1(i, :) = pvn2(p0, vp(1:nvp-1), nvp-1, x(2:nvp, :));
    end

    y = pvn3(p1, vp(1), x(1, :));
    
end

function y = pvn3(p, n, x) 

    y = p(n, :);
    for k = (n-1):-1:1
        y = y.*x + p(k, :);
    end 

end

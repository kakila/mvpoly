function y = polyval(p, x) 
% POLYVAL - evaluate a multivariate polynomial
%
% The n-variate polynomial p, is evaluated for each value in 
% the array x. The last dimension of x should be of size n 
% corresponding to the n variables in the polynomial.
% 
% Example: the polynomial x^2 + 2y^2 - 1 
%
%    p = polyval_cube(); 
%    p(0, 0) = -1;
%    p(2, 0) = 1;
%    p(0, 2) = 2;
%
% Evaluated at x=1, y=2 
%
%    polyval(p, [1,2])
%    ans = 8
% 
% Evaluated at x,y = 1,..,5: we generate a 5x5x2 array xy
% with the x values in xy(:,;,1), the y values in xy(:,:,2)
%
%    [x,y] = meshgrid(1:5)
%    xy = cat(3, x, y)
%    polyval(p, xy)
%    ans =
%        2    5   10   17   26
%        8   11   16   23   32
%       18   21   26   33   42
%       32   35   40   47   56
%       50   53   58   65   74
%
% See also @mvpoly_cube/private/polyval_cube

    y = polyval_cube(p.coef, x);

end

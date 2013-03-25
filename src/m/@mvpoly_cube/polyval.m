function y = polyval(p, varargin) 
% POLYVAL - evaluate a multivariate polynomial
%
% The n-variate polynomial p, is evaluated for one or more
% values of the variables of p.
% 
% Example: the polynomial x^2 + 2y^2 - 1 
%
%    p = polyval('cube'); 
%    p(0, 0) = -1;
%    p(2, 0) =  1;
%    p(0, 2) =  2;
%
% Evaluated at x=1, y=2 
%
%    polyval(p, 1, 2)
%    ans = 8
% 
% Evaluated at x,y = 1,..,5
%
%    [x,y] = meshgrid(1:5)
%    polyval(p, x, y)
%    ans =
%        2    5   10   17   26
%        8   11   16   23   32
%       18   21   26   33   42
%       32   35   40   47   56
%       50   53   58   65   74
%
% One can also pass the variable data to polyval using
% a single array with variables ranging over the first
% dimension of the argument, thus
%
%    [x,y] = meshgrid(1:5)
%    xy(1,:,:) = x);
%    xy(2,:,:) = y);
%    polyval(p, xy);
%
% produces the same result as the second example above.
% Note that the requirement that the variable range over
% the first dimension of the variable argument implies
% that the first example above would need to be written
% with a column vector,
%
%   polyval(p, [1, 2]');   
%
% See also @mvpoly_cube/private/polyval_cube

    y = polyval_cube(p.coef, varargin{:});

end

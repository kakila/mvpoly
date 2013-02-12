function s2 = subsnorm(s1)
% SUBSNORM  normalise sub(script) cell array
%
% A cell-array is used to represent a subscripting
% of an array object, so the expression a(1:3,2) has
% its subscript converted to the cell array 
%
%  {
%    [1, 1] => [1, 2, 3]
%    [1, 2] => 2 
%   }
%
% A peculiarity of Matlab/Octave is that a single dimension
% index such as a(1:n) refers to the first row, and so is 
% equivalent to a(1, 1:n) (rather than a(1:n, 1), which would
% seem more natural in the context of ND-arrays).  This 
% function changes this behaviour -- if the input cell-array
% is a singleton it adds second element, the scalar 1
%
% See SUBSREF and SUBSASGN for example usage.
    
    s2 = s1;
    
    if (numel(s2) == 1)
        s2{2} = 1;
    end
    
end

function c = pluspad(a, b)
% PLUSPAD  add ND-arrays of different dimensions
%
% If A and B are ND-arrays of different dimensions
% and sizes, then 
% 
%    C = PLUSPAD(A,B)
%
% is the ND-array which has the dimension of the 
% larger of those of A and B, likewise with the
% sizes of those dimensions. Thus if A is 2x2x2
% and B is 3x3, then C is 3x3x2.  The contents of
% C is the sum of A and B padded to have the same
% dimension as C.
%
% For example
%
% pluspad([2 2], eye(3))
% ans =
%
%   3   2   0
%   0   1   0
%   0   0   1
%
   
    [idxa, idxb, sz] = padidx(a, b);
    c = zeros(sz);
    c = subsasgn(c, idxa, a);
    c0 = subsref(c, idxb) + b;
    c = subsasgn(c, idxb, c0);
    
end

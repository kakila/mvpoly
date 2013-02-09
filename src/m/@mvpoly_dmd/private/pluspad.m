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
   
    sa = size(a);
    sb = size(b);
    da = numel(sa);
    db = numel(sb);
    dc = max(da, db);
    sa = [ sa ones(dc-da, 1) ];
    sb = [ sb ones(dc-db, 1) ];
    sc = max(sa, sb);
    c  = zeros(sc);
    
    for i = 1:da
        suba{i} = 1:sa(i);
    end
    idx = substruct('()', suba);
    c = subsasgn(c, idx, a);
    
    for i = 1:db
        subb{i} = 1:sb(i);
    end
    idx = substruct('()', subb);
    c0 = subsref(c, idx) + b;
    c = subsasgn(c, idx, c0);
    
end

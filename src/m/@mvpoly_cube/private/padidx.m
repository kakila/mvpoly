function [idxa, idxb, sz] = padidx(a, b)
% PADIDX  indices and sizes of padded arrays
%
% If A and B are ND-arrays of different dimensions
% and sizes, then 
% 
%    [IDXA, IDXB, SZ] = PADIDX(A,B)
%
% returns the size SZ of padded ND-array, one which
% is large enoung (in dimension and and order) to 
% hold both of the ND-arrays A and B. SZ is an 
% integer array of the orders of the padded array.
%
% The index objects IDXA, IDXB are structures 
% describing the position of A (respectively B)
% within the padded array, and these can be passed
% to SUBSREF or SUBSASGN. 
%
% Note that the padded array is not created by this
% function
    
    sa = size(a);
    sb = size(b);
    da = numel(sa);
    db = numel(sb);
    d  = max(da, db);
    sa = [ sa ones(d-da, 1) ];
    sb = [ sb ones(d-db, 1) ];

    sz = max(sa, sb);
    
    for i = 1:da
        suba{i} = 1:sa(i);
    end
    idxa = substruct('()', suba);
    
    for i = 1:db
        subb{i} = 1:sb(i);
    end
    idxb = substruct('()', subb);
    
end

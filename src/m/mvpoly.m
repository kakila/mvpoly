function p = mvpoly(storage, varargin)
% MVPOLY - multivariate polynomial class constructor
%
% A call to
%
%    p = mvpoly(storage, ...)
%
% will create a mutivariate polynomial object with the
% coefficient storage method (i.e., underlying data 
% representation) as specified by the (string) first
% argument. Storage methods are
%
% cube - coefficients stored in an ND-array with as 
%   many dimensions as the polynomial has variables,
%   suitable for polyomials with few or no nonzero 
%   coefficients.
% 
% sparse - not implemented yet, may be more than one ...
%
% This function returns an object of the class specialised
% by the storage type, thus mvpoly('cube',...) returns 
% an object of class mvpoly_cube.  See the help on these
% classes for details of the other arguments to mvpoly(),
% as these are passed directly to these subclasses.
%
% A particular application of this method is to convert
% a polynomial from one storage method to another, thus
%
%   p = mvpoly('cube', p);
%
% will convert p to use the cube storage method. 
%
% See also @mvpoly_cube/mvpoly_cube
    
    switch storage
      case 'cube'
        p = mvpoly_cube(varargin{:});
      otherwise
        error('bad mvpoly storage type : %s', name);
    end

end
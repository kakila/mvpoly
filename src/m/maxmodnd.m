function [M, t, h, evals] = maxmodnd(p, epsilon, verbose, i0)
% MAXMODND - maximum modulus of an n-variate polynomial on the polydisc
%
% The maximum modulus of a complex n-variate polynomial p on 
% the unit n-polydisc is estimated using a method of repeated 
% subdivision of [0,2pi]^n and rejection of non-maximizing 
% n-cubes. 
%
% The rejection criterion is based on a lemma of S.B. Steckin,
% extended to n-variate polynomials by G. De La Chevrotière [1]
%
%   [M, t, h, evals] = MAXMODND(p, epsilon, verbose, i0)
%
%   p        the multivatiate polynomial, a mvpoly object
%   epsilon  relative precision required [0.5e-8]
%   verbose  set non-zero for run-time information
%   i0       initial number of intervals, an N-vector of integers [5*N]
%
%   M        estimate of the maximum modulus of p
%   t        n-column matrix whose rows are the midpoints of non-rejected 
%            n-cubes
%   h        a length vectot of half-width of non-rejected n-cubes 
%   evals    total number of evaluations of the polynomial
%    
% The algorithm is based in that described in [1] and [2]
%
% References
%
% [1] G. De La Chevrotière. "Finding the maximum modulus of a
%     polynomial on the polydisk using a generalization of 
%     Steckin's lemma", SIAM Undergrad. Res. Online, 2, 2009.
%
% [2] J.J. Green. "Calculating the maximimum modulus of a polynomial
%     with Steckin's lemma". SIAM J. Numer. Anal., 83:211-222, 2000. 
%    
% Copyright (c) J.J.Green 2012, 2013
%
% Note that this file is derived from the file of the same name
% distributed as a stand-alone file for Matlab/Octave; the 
% difference with that file is that it uses an n-dimensional
% array to represent the polynomial p, whereas this file uses
% an mvpoly object.
%
% See also mvpoly
    
% get options

    if nargin < 1
        error('too few args')
    end
    
    d  = order(p);
    n  = numel(d);
    hd = homdeg(p);
        
    if nargin < 2
        epsilon = 0.5e-8;
    end
    
    if nargin < 3
        verbose = 0;
    end
    
    % intial intervals
    
    if nargin < 4
        i0 = 3*hd; 
    end
    
    if nargin > 4
        error('too many args');
    end
    
    if verbose
        fprintf('polynomial of %i variables, degree %i\n', n, hd);
    end
    
    % sanity bounds on input
    
    if i0 <= 2*hd
        error('i0 must be at least twice the degree of p');
    end
        
    M2min = 0;      
    M2max = inf;
    
    % initial interval-set - t is a matrix whose rows
    % are the midpoints of the n-intervals
    
    h = pi./i0;

    t0 = [0:i0-1];
    t  = t0;
    
    for i = 2:n
        t = [repmat(t, 1, i0) 
             kron(t0, ones(1, i0^(i-1)))];
    end
    
    clear t0;
    
    t = 2*h*t + h;
    
    % start the iteration
    
    if (verbose)
      fprintf('lower bound\tupper bound\tevals\trejected\n'); 
    end

    % per-iteration and running total of polynomial evaluations

    eval0 = 0;
    evals = 0;
    
    while 1
      
        % evaluate polynomial

        z  = exp(t .* 1i);
        pz = polyval(p, z);
        qz = real(pz).^2 + imag(pz).^2;
        
        eval0 = numel(qz);
        evals = evals + eval0;

        % evaluate bounds
        
        M2min = max(M2min, max(qz));
        SC    = cos(hd*h);
        M2max = M2min/SC;

        % this could be done after the rejection stage
        % to get a better (smaller) set t, but that would
        % be wasteful if you only want to know M, which 
        % will usually be the case
        
        if M2max-M2min < 4*epsilon*M2min
            if verbose
                fprintf('%f\t%f\t%i\t-\n',...
                        sqrt(M2min),...
                        sqrt(M2max),...
                        eval0);
            end
            break;
        end
            
        % rejection
        
        rT  = M2min * SC;
        ind = find(qz > rT);

        if verbose
            nrej = size(t, 2) - numel(ind);
            fprintf('%f\t%f\t%i\t%i\n',...
                    sqrt(M2min),...
                    sqrt(M2max),...
                    eval0,nrej);
        end

        t = t(:, ind);
        
        % subdivision
	% 
	% In the univariate implementation of the maxmod 
	% algorithm it seemed sensible to use a triadic 
	% subdivision, since this "reused" the polynomial
	% evaluation at the middle interval.  For the 
	% n-variate case, rather than saving 1/3 of the
	% evaluations, a triadic subdivision saves only 
	% 1/3^n of them; at the same time it means that 
	% the subdivision step increases the size of the
	% midpoint matrix by a factor of 3^n rather than
	% the 2^n for the dyadic division.
	%
	% Hence we use a dyadic subdivision, which makes
	% the coding a bit simpler too

	h = h/2;

        % record previous size of t
        
	m = size(t, 2);
        
        % make 2^n copies of it
        
	t = repmat(t, 1, 2^n);
 
        % add +/- h to the columns of t in a similar
        % vectorised fashion to that of the initial 
        % constuction of t
        
        for i = 1:n
	    t(i, :) = t(i, :) + ...
                h * repmat(kron([1,-1], ones(1, m*2^(i-1))),...
                           1, 2^(n-i));
        end
    end
    
    % we can only get here from the break above
    
    M = sqrt((M2min+M2max)/2);
    
    if verbose
        fprintf('maxmod %.8f in %i evaluations\n', M, evals);
    end
    
end


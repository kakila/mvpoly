function bool = array_equal(a, b, epsilon)
% array_equal - test whether arrays are equal

    if nargin < 3
        epsilon = 0;
    end
    
    bool = (numel(find(abs(a-b) > epsilon)) == 0);
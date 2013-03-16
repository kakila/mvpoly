function bool = array_equal(a, b)
% array_equal - test whether arrays are equal
    bool = (numel(find(a ~= b)) == 0);
function test_mvpoly_cube_addition()
% mvpoly_cube add/subtract unit tests
    
    p = mvpoly_cube();
    q = mvpoly_cube();
    p(1, 0) = 1; 
    q(0, 1) = 1;
    r = p + q;
    assert(isa(r,'mvpoly_cube'), 'class for simple sum');
    assert(r.coef == [0, 1 ; 1, 0], 'simple sum');

    p = mvpoly_cube(ones(2, 2, 2)) + mvpoly_cube(ones(3, 3));
    assert(size(p.coef) == [3 3 2], 'sum of different sizes');

    p = mvpoly_cube(ones(2, 2, 2)) - mvpoly_cube(ones(3, 3));
    assert(size(p.coef) == [3, 3, 2], ...
           'difference of different sizes');


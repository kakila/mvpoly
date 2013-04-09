function test_mvpoly_cube_addition()
% mvpoly_cube add/subtract unit tests
    
    p = mvpoly_cube();
    q = mvpoly_cube();
    p(1, 0) = 1; 
    q(0, 1) = 1;
    r = p + q;
    assert(isa(r,'mvpoly_cube'), 'class for simple sum');
    assert(array_equal(r.coef, [0, 1 ; 1, 0]), 'simple sum');

    r = p + q + 1;
    assert(isa(r,'mvpoly_cube'), 'class for poly plus scalar');
    assert(array_equal(r.coef, [1, 1 ; 1, 0]), 'poly plus scalar');

    r = 1 + p + q;
    assert(isa(r,'mvpoly_cube'), 'class for scalar plus poly');
    assert(array_equal(r.coef, [1, 1 ; 1, 0]), 'scalar plus poly');
    
    p = mvpoly_cube(ones(2, 2, 2)) + mvpoly_cube(ones(3, 3));
    assert(array_equal(size(p.coef), [3 3 2]), 'sum of different sizes');

    p = mvpoly_cube(ones(2, 2, 2)) - mvpoly_cube(ones(3, 3));
    assert(array_equal(size(p.coef), [3, 3, 2]), ...
           'difference of different sizes');


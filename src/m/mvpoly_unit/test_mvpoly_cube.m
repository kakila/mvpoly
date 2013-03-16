function test_mvpoly_cube()
% mvpoly_cube constructor unit tests
    
    p = mvpoly_cube();
    assert(isa(p, 'mvpoly_cube'), 'constructor without argument');

    p = mvpoly_cube(ones(2));
    assert(isa(p, 'mvpoly_cube'), 'constructor with argument');

    a = rand(5, 5, 5);
    p = mvpoly_cube(a);
    assert(array_equal(p.coef, a), 'constructor data retention');


function test_mvpoly_cube()
    
    p = mvpoly_cube();
    assert(isa(p, 'mvpoly_cube'), 'constructor without arg, wrong class');

    p = mvpoly_cube(ones(2));
    assert(isa(p, 'mvpoly_cube'), 'constructor with arg, wrong class');

    a = rand(5, 5, 5);
    p = mvpoly_cube(a);
    assert(p.coef == a, 'raw constructor data lost');


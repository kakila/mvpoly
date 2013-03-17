function test_mvpoly_cube_compose()
% mvpoly_cube composition unit tests
    
    p = mvpoly_cube(rand(3));
    x = mvpoly_cube(); 
    x(1,0) = 1;
    y = mvpoly_cube(); 
    y(0,1) = 1;
    q = compose(p, x, y);
    assert(array_equal(p.coef, q.coef, eps),...
           'variable exchange I');

    q = compose(p, y, x);
    assert(array_equal(p.coef, transpose(q.coef), eps),...
           'variable exchange II');
    p = mvpoly_cube(rand(3));
    x = mvpoly_cube(rand(3));
    y = mvpoly_cube(rand(3));
    v = rand(1,2);
    A = polyval(compose(p, x, y), v);
    B = polyval(p, [polyval(x, v), polyval(y, v)]);
    assert(abs((A - B)/(A + B)) < eps, 'distribute evaluate over compose');

    p = mvpoly_cube();
    p(2) = 1; 
    p(0) = 5;
    x = mvpoly_cube();
    x(0,1) = 1;
    x(1,0) = 1;
    q = compose(p, x);
    assert(array_equal(q.coef, [5, 0, 1;
                        0, 2, 0;
                        1, 0, 0], eps), 'simple example');

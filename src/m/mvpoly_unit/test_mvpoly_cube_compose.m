function test_mvpoly_cube_compose()
    
    p = mvpoly_cube(rand(3));
    x = mvpoly_cube(); 
    x(1,0) = 1;
    y = mvpoly_cube(); 
    y(0,1) = 1;
    err = abs(p.coef - compose(p, x, y).coef);
    assert(err < eps, 'variable exchange I');
    err = abs(p.coef - transpose(compose(p, y, x).coef));
    assert(err < eps, 'variable exchange II');

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
    x(0,1) = x(1,0) = 1;
    q = compose(p, x);
    err = abs(q.coef - [5, 0, 1;
                        0, 2, 0;
                        1, 0, 0]);
    assert(err < eps, 'simple example');

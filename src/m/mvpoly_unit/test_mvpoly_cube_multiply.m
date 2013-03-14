function test_mvpoly_cube_multiply()
% mvpoly_cube multiplication unit tests
    
    p = mvpoly_cube(); q = mvpoly_cube();
    p(0, 0) = 1; q(0, 0) = 1; p(1, 0) = 1; q(0, 1) = 2;
    r = p * q;
    assert(abs(r.coef - [1,2;1,2]) < eps, 'simple compose')

    p = mvpoly_cube(rand(3, 3, 3)); 
    q = mvpoly_cube(rand(4, 4, 4));
    x = rand(1,3);
    err = abs(1 - (polyval(p, x) * polyval(q, x)) / polyval(p*q, x));
    assert(err < 2*eps, 'distribute over evaluation');

    p = mvpoly_cube(); 
    p(0) = 1; 
    p(1) = 1;
    q = mvpoly_cube();
    q(0, 0) = 1; 
    q(0, 1) = 1;
    r = p * q;
    assert(abs(r.coef - [1, 1 ; 1, 1]) < eps, 'dimension promote I');

    p = mvpoly_cube();
    p(0) = 1; 
    p(1) = 1;
    q = mvpoly_cube();
    q(0, 0, 0) = 1; 
    q(1, 0, 0) = 1;
    r = p * q;
    assert(abs(r(0, 0) - 1) < eps && ...
           abs(r(1, 0) - 2) < eps && ...
           abs(r(2, 0) - 1) < eps, ...
           'dimension promote II');


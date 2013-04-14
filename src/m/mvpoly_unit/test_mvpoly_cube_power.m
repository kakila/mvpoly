function test_mvpoly_cube_power()
% tests for mpower
    
    p = mvpoly_cube(rand(5));
    q = p^0;
    assert(array_equal(q.coef, [1], eps), 'power zero');
    q = p^1;
    assert(array_equal(q.coef, p.coef, eps), 'power one');
    q = p^2; 
    r = p*p;
    assert(array_equal(q.coef, r.coef, eps), 'power two');
    
    x = mvpoly_cube();
    x(1,0) = 1;
    y = mvpoly_cube();
    y(0,1) = 1;
    p = (x + y^2)^2;
    c = [0 0 0 0 1
         0 0 2 0 0
         1 0 0 0 0];
    assert(array_equal(p.coef, c, eps), 'simple expression');
         
end
    
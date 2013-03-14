function test_mvpoly_cube_order()
% mvpoly_cube order unit tests
    
    p = mvpoly_cube(zeros(4,4,4));

    p(1,1,0) = 1; 
    assert(order(p) == [1,1,0], 'simple case');
    p(1,2,3) = 1;
    assert(order(p) == [1,2,3], 'simple case expanded');
    
    p = mvpoly_cube(); 
    p(12) = 1;
    assert(order(p) == [12], 'univariate');
    
    p = mvpoly_cube();
    p(0,0) = p(0,5) = 1;
    assert(order(p) == [0, 5], 'faux bivariate');


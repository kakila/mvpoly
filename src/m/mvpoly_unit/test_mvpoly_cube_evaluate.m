function test_mvpoly_cube_evaluate()
% mvpoly_cube evaluate unit tests

    p = mvpoly_cube();
    p(0) = -1; 
    p(2) =  1;
    assert(polyval(p, 2) == 3, 'univariate point evaluation');

    p = mvpoly_cube();
    p(0, 0) = -1; 
    p(2, 0) =  1; 
    p(0, 2) =  2;    
    assert(polyval(p, 1, 2) == 8, 'bivariate point evaluation I'); 
    assert(polyval(p, [1, 2]') == 8, ...
           'bivariate point evaluation II');
    
    [x,y] = meshgrid(1:2);
    xy(1,:,:) = x;
    xy(2,:,:) = y;
    assert(array_equal(polyval(p, x, y), [2, 5 ; 8, 11]), ...
           'bivariate grid evaluation I');
    assert(array_equal(polyval(p, xy), [2, 5 ; 8, 11]), ...
           'bivariate grid evaluation II');

    p = mvpoly_cube();
    p(0, 0, 0) = -1; 
    p(2, 0, 0) =  1; 
    p(0, 2, 0) =  2;    
    p(0, 0, 2) =  3;
    assert(polyval(p, 1, 2, 3) == 35, ...
           'trivariate point evaluation I');
    assert(polyval(p, [1, 2, 3]') == 35, ...
           'trivariate point evaluation II'); 
    
    % regression tests
    
    p = mvpoly_cube();
    p(2, 0) = 2;
    p(0, 1) = 3;
    assert(polyval(p, 1, 1) == 5, 'regression A');

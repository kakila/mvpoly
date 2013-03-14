function test_mvpoly_cube_evaluate()
% mvpoly_cube evaluate unit tests
    
    p = mvpoly_cube();
    p(0, 0) = -1; p(2, 0) = 1; p(0, 2) = 2;
    
    % point evaluation
    assert(polyval(p, [1,2]) == 8, 'point evaluation'); 
    
    % grid evaluation
    [x,y] = meshgrid(1:2);
    xy = cat(3, x, y);
    assert(polyval(p, xy) == [2, 5 ; 8, 11], 'grid evaluation');


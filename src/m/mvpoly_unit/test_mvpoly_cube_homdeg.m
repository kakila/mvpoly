function test_mvpoly_cube_homdeg()
% mvpoly_cube homogeneous degree unit tests
    
    p = mvpoly_cube();
    p(10, 1)  = 1; 
    p(6, 6)   = 1; 
    p(10, 10) = 0;
    h = homdeg(p);
    assert(h == 12, 'exact example');


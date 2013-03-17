function test_mvpoly_maxmodnd()
% mvpoly maxmodnb unit tests
    
    p = mvpoly_cube();
    p(0)  = 1; 
    p(10) = 1;
    M = maxmodnd(p, 1e-9);
    assert(abs(M-2)/2 < 1e-9, 'univariate');

    p = mvpoly_cube();
    p(0,0) = 8; 
    p(0,9) = 1; 
    p(9,9) = 1;
    M = maxmodnd(p, 1e-9);
    assert(abs(M-10)/10 < 1e-9, 'bivariate I');

    p = mvpoly_cube(ones(3,3,3));
    M = maxmodnd(p, 1e-9);
    assert(abs(M-27)/27 < 1e-9, 'bivariate II');

    p = mvpoly_cube();
    p(0,2,2) =  1;
    p(2,0,2) =  1;
    p(2,2,0) =  1;
    p(1,1,2) = -2;
    p(1,2,1) = -2;
    p(2,1,1) = -2;
    M = maxmodnd(p, 1e-5);
    assert(abs(M-5)/5 < 1e-5, 'kaijser-varopoulos');

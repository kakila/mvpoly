function q = plus(p1, p2)
% PLUS  add multivariate polynomials
    
    q = mvpoly_cube(pluspad(p1.coef, p2.coef));    

end

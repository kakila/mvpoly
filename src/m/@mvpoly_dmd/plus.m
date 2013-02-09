function q = plus(p1, p2)
    
    q = mvpoly_dmd(pluspad(p1.coef,p2.coef));    

end

function test_mvpoly()
    
    p = mvpoly('cube', ones(3));
    assert(isa(p, 'mvpoly_cube'), 'wrong class');


    
function test_mvpoly()
% mvpoly unit tests
    
    p = mvpoly('cube', ones(3));
    assert(isa(p, 'mvpoly_cube'), 'wrong class');


    
function test_mvpoly_cube_element_assign()
    
    p = mvpoly_cube();
    p(1, 2, 3) = 1;
    assert(p(1, 2, 3) == 1, 'bad explicit coefficient');
    assert(p(1, 1, 2) == 0, 'bad implicit coefficient');

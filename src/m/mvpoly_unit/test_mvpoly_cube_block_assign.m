function test_mvpoly_cube_block_assign()
    
    p = mvpoly_cube();

    p(0:1, 0:1) = eye(2);
    assert(p.coef == eye(2), 'bad assign of block');

    p(0:1, 0:1) = 1;
    assert(p.coef == ones(2), 'bad assign of scalar');


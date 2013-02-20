#! /usr/bin/octave -q
# unit tests for octave, this will not work in matlab

test("mvpoly_unit_octave", "normal");

%!# ------- mvpoly -------------

%!test "common constuctor";
%! p = mvpoly('cube', ones(3));
%! assert(isa(p, 'mvpoly_cube'), 'wrong class');

%!# ------- mvpoly_cube -------------

%!test "constructor class, no argument";
%! p = mvpoly_cube();
%! assert(isa(p,"mvpoly_cube"), "incorrrect class");

%!test "constructor class, with argument";
%! p = mvpoly_cube(ones(2));
%! assert(isa(p, "mvpoly_cube"), "incorrrect class");

%!test "retention of constructor data";
%! a = rand(5, 5, 5);
%! p = mvpoly_cube(a);
%! assert(p.coef == a, "raw constructor data lost");

%!test "element assign";
%! p = mvpoly_cube();
%! p(1, 2, 3) = 1;
%! assert(p(1, 2, 3) == 1, "bad coefficient");
%! assert(p(1, 1, 2) == 0, "bad coefficient");

%!test "block assign";
%! p = mvpoly_cube();
%! p(0:1, 0:1) = eye(2);
%! assert(p.coef == eye(2), "bad assign");
%! p(0:1, 0:1) = 1;
%! assert(p.coef == ones(2), "bad assign");

%!test "simple sum";
%! p = mvpoly_cube(); q = mvpoly_cube();
%! p(1, 0) = 1; q(0, 1) = 1;
%! r = p + q;
%! assert(isa(r,"mvpoly_cube"), "bad class for sum");
%! assert((r(0, 0) == 0) && (r(1, 0) == 1) && (r(0, 1) == 1), "bad sum");

%!test "sum of different orders";
%! p = mvpoly_cube(ones(2, 2, 2)) + mvpoly_cube(ones(3, 3));
%! assert(size(p.coef) == [3 3 2], "incorrect size");

%!test "difference of different orders";
%! p = mvpoly_cube(ones(2, 2, 2)) - mvpoly_cube(ones(3, 3));
%! assert(size(p.coef) == [3 3 2], "incorrect size");

%!test "evaluation";
%! p = mvpoly_cube();
%! p(0, 0) = -1; p(2, 0) = 1; p(0, 2) = 2;
%! assert(polyval(p, [1,2]) == 8, "incorrect point evaluation"); 
%! [x,y] = meshgrid(1:2);
%! xy = cat(3, x, y);
%! assert(polyval(p, xy) == [2, 5 ; 8, 11], "incorrect grid evaluation");

%!test "multiplication, simple bivariate";
%! p = mvpoly_cube(); q = mvpoly_cube();
%! p(0, 0) = 1; q(0, 0) = 1; p(1, 0) = 1; q(0, 1) = 2;
%! r = p * q;
%! assert(r(0, 0), 1, eps);
%! assert(r(1, 0), 1, eps);
%! assert(r(0, 1), 2, eps);
%! assert(r(1, 1), 2, eps);

%!test "multiplication, linearity of evaluation";
%! p = mvpoly_cube(rand(3, 3, 3)); 
%! q = mvpoly_cube(rand(4, 4, 4));
%! x = rand(1,3);
%! assert((polyval(p, x) * polyval(q, x)) / polyval(p*q, x), 1, 2*eps);

%!test "multiplication, dimension promotion I";
%! p = mvpoly_cube(); q = mvpoly_cube();
%! p(0) = 1; p(1) = 1;
%! q(0, 0) = 1; q(0, 1) = 1;
%! r = p * q;
%! assert(r(0, 0), 1, eps);
%! assert(r(1, 0), 1, eps);
%! assert(r(0, 1), 1, eps);
%! assert(r(1, 1), 1, eps);

%!test "multiplication, dimension promotion II";
%! p = mvpoly_cube(); q = mvpoly_cube();
%! p(0) = 1; p(1) = 1;
%! q(0, 0, 0) = 1; q(1, 0, 0) = 1;
%! r = p * q;
%! assert(r(0, 0), 1, eps);
%! assert(r(1, 0), 2, eps);
%! assert(r(2, 0), 1, eps);

%!test "homogeneous degree";
%! p = mvpoly_cube();
%! p(10,1) = 1; p(6,6) = 1; p(10,10) = 0;
%! assert(homdeg(p), 12);

%!test "order";
%! p = mvpoly_cube(zeros(4,4,4));
%! p(1,1,0) = 1; 
%! assert(order(p),[1,1,0]);
%! p(1,2,3) = 1;
%! assert(order(p), [1,2,3]);
%! p = mvpoly_cube(); p(12) = 1;
%! assert(order(p), [12]);

%!test "compose variable exchange";
%! p = mvpoly_cube(rand(3));
%! x = mvpoly_cube(); x(1,0) = 1;
%! y = mvpoly_cube(); y(0,1) = 1;
%! assert(p.coef, compose(p, x, y).coef, eps);
%! assert(p.coef, transpose(compose(p, y, x).coef), eps);

%!test "compose simple example";
%! p = mvpoly_cube();
%! p(2) = 1;
%! x = mvpoly_cube();
%! x(0,1) = x(1,0) = 1;
%! q = compose(p, x);

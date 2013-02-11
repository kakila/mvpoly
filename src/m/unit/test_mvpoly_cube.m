%!test
%! p = mvpoly_cube();
%! assert(class(p) == 'mvpoly_cube','has correct class');

%!test
%! a = [1 2 ; 3 4];
%! p = mvpoly_cube(a);
%! assert(p.coef == a, 'saves input array');
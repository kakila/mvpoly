addpath 'unit';
funs = { 'mvpoly_cube' };
for i = 1:length(funs)
    testname = sprintf('test_%s', funs{i});
    test(testname,'normal');
end
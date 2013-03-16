% simple octave/matlab test harness 

unit_path = mfilename('fullpath');
addpath(unit_path);

err = 0;

tfiles = dir(strcat(unit_path,'/','test_*.m'));
ntfiles = length(tfiles);

for i = 1:ntfiles

    tfile = tfiles(i).name;
    tfun = tfile(1:length(tfile)-2);

    try
        feval(tfun);
    catch
        fprintf('%s: %s\n', tfun, lasterr);
        err = err+1;
    end

end
    
rmpath(unit_path);

fprintf('passed %i/%i tests\n', ntfiles-err, ntfiles);


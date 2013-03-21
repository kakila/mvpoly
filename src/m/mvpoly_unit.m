% simple octave/matlab test harness 

pattern = 'evaluate';

warning('error', 'Octave:broadcast');
unit_path = mfilename('fullpath');
addpath(unit_path);

err = 0;

tfiles = dir(strcat(unit_path, '/', 'test_*', pattern, '.m'));
ntfiles = length(tfiles);

for i = 1:ntfiles

    tfile = tfiles(i).name;
    tfun = tfile(1:length(tfile)-2);

    try
        feval(tfun);
    catch
        fprintf('%s: %s\n', tfun, lasterr);
        L = lasterror;
        S = L.stack;
        for i = 1:numel(S)
            Si = S(i);
            fprintf('%s, line %i\n',Si.file, Si.line);
        end
        err = err+1;
    end

end
    
rmpath(unit_path);
fprintf('passed %i/%i tests\n', ntfiles-err, ntfiles);


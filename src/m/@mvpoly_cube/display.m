function display(p)
% DISPLAY  display a multivariate polynomial

    sz  = size(p.coef);
    nd  = numel(sz);
    if sz(nd) == 1
        nd = nd - 1;
    end
    fprintf('%s = \n', inputname(1));
    sub = cell(1,nd);
    for n = 1:numel(p.coef)
        [sub{:}] = ind2sub(sz, n);
        c = p.coef(sub{:});
        fprintf('    (%i',sub{1}-1);
        for m = 2:nd
            fprintf(',%i',sub{m}-1);
        end
        fprintf(') : ');
        if iscomplex(c)
            rc  = real(c);
            ic  = imag(c);
            if rc < 0
                src = '-';
            else
                src = ' ';
            end
            if ic < 0 
                sic = '-';
            else
                sic = '+';
            end
            fprintf('%c %f %c %f i', src, abs(rc), sic, abs(ic));
        else
            if c < 0
                fprintf('- %f', abs(c));
            else
                fprintf('  %f', c);
            end
        end
        fprintf('\n');
    end
    
end

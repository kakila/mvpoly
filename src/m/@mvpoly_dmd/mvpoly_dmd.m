function p = mvpoly_dmd(a)
    if (nargin == 0)
        p.array = [0];
        p = class(p, 'mvpoly_dmd');
    elseif (nargin == 1)
        if (strcmp(class(a), 'mvpoly_dmd'))
            p = a;
        elseif (ismatrix(a) && isnumeric(a))
            p.array = a;
            p = class(p, 'mvpoly_dmd');
        else
            error('mvpoly_dmd: bad constructor argument');
        end
    else
        print_usage();
    end
end

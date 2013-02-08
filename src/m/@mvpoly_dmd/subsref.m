% -*- matlab -*-

function q = subsref(p, s)
    
    if (isempty(s))
        error('mvpoly_dhd: missing index');
    end

    switch ( s(1).type )
      
      case '()'
        ind = s(1).subs;
        sizep = size(p.coef);
        nvar = numel(sizep);
        if (numel(ind) != nvar)
            error('mvpoly_dhd: need exactly %i indices',nvar);
        end
        for i = 1:nvar
            ind{i} = sizep(i) - ind{i}; 
        end
        s(1).subs = ind;   
        q = subsref(p.coef, s);
      
      case '.'
        fld = s.subs;
        if (strcmp (fld, 'coef'))
            q = p.coef;
        else
            error('mvpoly_dhd/subsref: invalid property %s', fld);
        end

      otherwise
        error('invalid subscript type');

    end

end

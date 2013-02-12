function q = subsref(p, s)
    
    if (isempty(s))
        error('mvpoly_dhd: missing index');
    end

    switch ( s(1).type )
      
      case '()'
        subs = subsnorm(cellfun(@exp2sub, s(1).subs, 'UniformOutput', false));
        s(1).subs = subs;
        q = subsref(p.coef, s);
      
      case '.'
        switch ( s.subs )
          case 'coef'
            q = p.coef;
          otherwise
            error('mvpoly_dhd/subsref: invalid property %s', s.subs);
        end

      otherwise
        error('invalid subscript type');

    end
    
end



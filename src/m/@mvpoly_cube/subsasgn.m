function x = subsasgn(x, ss, val)

    ss.subs = cellfun(@exp2sub, ss.subs, 'UniformOutput', false);
    x.coef = subsasgn(x.coef, ss, val);

end


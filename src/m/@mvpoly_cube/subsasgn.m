function x = subsasgn(x, ss, val)

    ss.subs = subsnorm(cellfun(@exp2sub, ss.subs, 'UniformOutput', false));
    x.coef = subsasgn(x.coef, ss, val);

end


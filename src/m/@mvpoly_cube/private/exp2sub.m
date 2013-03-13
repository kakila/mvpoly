function s = exp2sub(e)
% helper function for subsref() and subsasgn()    

    s = e;
    if s ~= ':'
        s = s + 1;
    end
    
end


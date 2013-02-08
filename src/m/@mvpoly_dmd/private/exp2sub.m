% -*- matlab -*-
% helper function for subsref() and subsasgn()

function s = exp2sub(e)
    
    s = e;
    if s != ':'
        s = s + 1;
    end
    
end


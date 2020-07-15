function mooreNeigh(i,j,nbL,nbC)
    valIdx = [];
    for x = range(i-1,i+1,length=3), y = range(j-1,j+1,length=3)
        if (x<=nbC && x>0 && y <= nbL && y> 0)  push!(valIdx, (Int(x),Int(y)))  end
    end
    return valIdx
end

function getNghbd(W::World)
    N = zeros(Int64,W.nbL,W.nbC);
    for i = 1:W.nbC, j =1:W.nbL
        #println("-> (",j,",",i,")")
        L =  mooreNeigh(i,j,nbL,nbC);
        while ~isempty(L)
            (x,y) = popfirst!(L)
            if ((x,y)!=(i,j))
                N[j,i] = N[j,i] + Int(W.act_grid[y,x]);
            end
        end
    end
    return N
end
###########################################################

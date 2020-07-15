function setRdmCell(W::World,rng)
    Pop = rand(rng,0:1,W.nbL,W.nbC)
    W.act_grid = Pop;
    return W;
end
function setMatCell(W::World,M::Array{Bool,2})
    W.act_grid = M
    W.nbL,W.nbC = size(M)
    W.nxt_grid = falses(W.nbL,W.nbC); W.nghbd = zeros(Int64,W.nbL,W.nbC)
    return W
end

function setPatCell()

end
###########################################################

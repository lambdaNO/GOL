###########################################################
mutable struct World
    nIt::Int64
    nbL::Int64
    nbC::Int64
    nbMvt::Int64
    nbCell::Int64;
    act_grid::Array{Bool,2}
    nxt_grid::Array{Bool,2}
    nghbd::Array{Int,2}
end
###########################################################
function World(nbL::Int64,nbC::Int64)
    World(0,nbL,nbC,typemax(Int64),typemax(Int64),falses(nbL,nbC),falses(nbL,nbC),zeros(Int64,nbL,nbC))
end

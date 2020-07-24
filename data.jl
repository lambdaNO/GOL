###########################################################
mutable struct Data
    nbL::Int64
    nbC::Int64
    nbIt::Int64
    #
    idxL::Array{Int64,1}
    nbMvt::Array{Int64,1}
    nbCell::Array{Int64,1}
    #
    rMvtL::Array{Float64,1}
    rNbCL::Array{Float64,1}
    #
    cntL::Array{}   # Stockée des listes {{lig,col}{lig,col}, ...}
    #
    cvgCrit::Bool
end
###########################################################
function data(L,C,I)
    Data(L,C,I,[],[],[],[],[],[],false)
end
###########################################################
function saveAsJLDFile(D::Data,r::Int64)
    L = D.nbL; C = D.nbC;
    if (r < 0)
        r = "std"
    end
    filename = "DATA/data_$L-$C-r$r.jld";
    jldopen(filename, "w") do file
        write(file, "D", D)  # alternatively, say "@write file A"
    end
end
###########################################################
function readAsJDLFile(S::String)
    D = jldopen("DATA/$S.jld","r") do file
        read(file, "D")
    end
    return D
end

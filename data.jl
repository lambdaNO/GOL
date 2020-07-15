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
end
###########################################################
function data(L,C,I)
    Data(L,C,I,[],[],[],[],[],[])
end
###########################################################
function saveAsMatFile(D::Data)
    L = D.nbL; C = D.nbC;
    filename = "data_$L-$C.mat";
    file = matopen(filename, "w")
        write(file, "D", D)
    close(file)
end
###########################################################
function readAsMatFile(S::String)
    # file = matopen("matfile.mat")
    # read(file, "varname") # note that this does NOT introduce a variable ``varname`` into scope
    # close(file)
    # vars = matread("matfile.mat")
end

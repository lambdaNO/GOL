using Random, CSV, MAT

###########################################################
include("./ExGrid/mat.jl");
include("world.jl");
include("data.jl")
include("setCell.jl")
include("neighborhood.jl")
include("generation.jl")
include("tools.jl")


###########################################################
function simulation(W::World,nbIt::Int64,delay::Float64,verbose::Bool)
    cptSim = 0;
    cptCvg = 0;
    drawGrid(W)
    Input("next")
    D = data(W.nbL,W.nbC,nbIt)
    while (cptSim < nbIt && W.nbMvt !=0 && cptCvg <=10)
        nextDay(W)
        if verbose run(`clear`);drawGrid(W);sleep(delay) else printInfo(W) end
        cptSim = cptSim + 1;

        push!(D.idxL,cptSim);push!(D.nbMvt,W.nbMvt);push!(D.nbCell,W.nbCell);
        rMvt = cvgCrit(D.nbMvt,cptSim);
        rNbC = cvgCrit(D.nbCell,cptSim);
        push!(D.rMvtL,rMvt);push!(D.rNbCL,rNbC);

        if (rMvt <= 1. && rNbC <= 1.)
            cptCvg = cptCvg + 1;
        else
            cptCvg = 0;
        end
        println("CVG ? nbMvt = $rMvt - nbCell = $rNbC -> cpt = $cptCvg")
        #println("")
        #sleep(0.5)
        cur_cntL = []
        cur_cnt = findall(W.act_grid)
        for c in cur_cnt
            #println(c[1],"-",c[2])
            push!(cur_cntL,(Int(c[1]),Int(c[2])))
        end
        push!(D.cntL,cur_cntL)
        #Input("next")
    end
    if !verbose drawGrid(W) end
    return D
end
###########################################################
# Note : Ne fonctionne pas dans le cas de certains patterns où là il faut
# chercher des periodicité dans les nbMvt et nbCell
function cvgCrit(L::Array{Int64,1},nIt::Int64)
    # Critère de d'Alembert interprété
    r = 2;
    if (nIt!=1)
        r = L[nIt]/L[nIt-1];
    end
    return round(r,digits =3)
end
###########################################################



global rng = MersenneTwister(123456);
nbL = 50;
nbC = 75;
verbose = true
W = World(nbL,nbC)
setRdmCell(W,rng)
D = simulation(W,1500,0.05,verbose)
# x = D.idxL; y = D.nbMvt; z = D.nbMvt
# mat"
#     hold on
#     plot($x,$y,"k-")
#     plot($x,$z,"r-")
# "


#setMatCell(W,mat1)
#
#
#
#
#

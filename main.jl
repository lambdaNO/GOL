using Random, CSV
include("./ExGrid/mat.jl");
include("world.jl");
include("setCell.jl")
include("neighborhood.jl")
include("generation.jl")
include("tools.jl")
###########################################################

###########################################################
function simulation(W::World,nIt::Int64,delay::Float64,verbose::Bool)
    cptSim = 0;
    cptCvgNbCell = 0;
    curNbCell = 0;
    drawGrid(W)
    Input()
    while (cptSim < nIt && W.nbMvt !=0 && cptCvgNbCell < 15)
        if verbose run(`clear`) end
        nextDay(W)
        if verbose drawGrid(W) else printInfo(W) end
        sleep(delay)
        cptSim = cptSim + 1;
    end
end

###########################################################
global rng = MersenneTwister(12345);
nbL = 50;
nbC = 45;
verbose = false
W = World(nbL,nbC)
setRdmCell(W,rng)
#setMatCell(W,mat1)

simulation(W,1000,0.05,false)

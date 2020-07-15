function Input()
    print("next"); readline()
end
###########################################################
function drawGrid(W::World)
    println("Iter ",W.nIt,"     -    #(Cell) = ",W.nbCell,"     -    #(Mvt) = ",W.nbMvt)
    for i = 1:size(W.act_grid,1)
        for j = 1:size(W.act_grid,2)
            W.act_grid[i,j] ? print(" 🁢 ") : print(" . ")
            #W.act_grid[i,j] ? print("🁢") : print(".")
        end
        println()
    end
end
###########################################################
function printInfo(W::World)
    println("Iter ",W.nIt,"     -    #(Cell) = ",W.nbCell,"     -    #(Mvt) = ",W.nbMvt)
end

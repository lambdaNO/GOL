function nextDay(W::World,rSet::Int64)
    cptMvt =  0; W.nbMvt = 0;
    W.nIt = W.nIt + 1;
    #printGrid(W.nIt,W.act_grid,W.nbMvt)
    if (rSet == -1)
        W.nghbd = getNghbd(W);
        for i=1:W.nbL, j = 1:W.nbC
            bMvt = false;
            if (W.act_grid[i,j] == 1 && W.nghbd[i,j]<2)
                W.nxt_grid[i,j] = 0;
                #println("($i,$j) -> ",Int(W.act_grid[i,j])," / N = ",W.nghbd[i,j],"  -> Cas : Cell isolée")
                bMvt = true;
            elseif (W.act_grid[i,j]==1 && W.nghbd[i,j]>3)
                W.nxt_grid[i,j] = 0;
                #println("($i,$j) -> ",Int(W.act_grid[i,j])," / N = ",W.nghbd[i,j],"  -> Cas : Cell surPop")
                bMvt = true;
            elseif (W.act_grid[i,j]==0 && W.nghbd[i,j]==3)
                W.nxt_grid[i,j] = 1; mvt =  1;
                #println("($i,$j) -> ",Int(W.act_grid[i,j])," / N = ",W.nghbd[i,j], "  -> Cas : Nvle Cell")
                bMvt = true;
            else
                W.nxt_grid[i,j] = W.act_grid[i,j];
                bMvt = false;
             end
             if bMvt
                W.nbMvt = W.nbMvt + 1;
             end
            #Input()
        end
    else
        fn = Symbol("r_$rSet")
        for i=1:W.nbL, j = 1:W.nbC
            p,q,r = getWNghbf(W,i,j)
            nq = getfield(Main, fn)(p,q,r)
            pP = p ? "🁢" : "."; pQ = q ? "🁢" : "."; pR = r ? "🁢" : "."; pnQ = nq ? "🁢" : ".";
            #   -----
            #if (nq) println("$i,$j  [$pP $pQ $pR]   =>  [$pnQ]")    end
            if (nq) W.nbMvt = W.nbMvt + 1 end
            W.nxt_grid[i,j] = nq;
        end
    end

    W.act_grid = W.nxt_grid;
    W.nbCell = length(findall(W.act_grid))
    #printGrid(W.nIt,W.act_grid,W.nbMvt)
end
###########################################################
###########################################################
###########################################################
###########################################################



function binaryDecop(I::Int64)
    # println("I = $I q = $q r = $r")
    D = []
    while length(D) != 8
        q = div(I,2); r = rem(I,2)
        push!(D,r); I = q;
    end
    D = reverse(D)
end

###########################################################
###########################################################
###########################################################
###########################################################

function printGrid(nIt::Int64,G::Array{Bool,2},nbMvt::Int64)
    println("Day : ", nIt)
    println("#(Mvt|",nIt-1," -> ",nIt,") = ",nbMvt)
    for i = 1:size(G,1)
        for j = 1:size(G,2)
            print("[",Int(G[i,j]),"]")
            if (j == size(G,2))
                print(" - [$i]")
            end
        end
        println()
    end
    for j = 1:size(G,2)
        print("[$j]")
    end
    println()
    println("---")
end

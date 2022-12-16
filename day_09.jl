function to_tail_position(hx, hy, tx, ty)
    if (hx-tx == 0) & (hy-ty == 2) #up
        return tx, ty+1
    elseif (hx-tx == 0) & (ty-hy == 2) #down
        return tx, ty-1
    elseif (tx-hx == 2) & (hy-ty == 0) #left
        return tx-1, ty
    elseif (hx-tx == 2) & (hy-ty == 0) #right
        return tx+1, ty
    elseif (hx-tx == 1) & (hy-ty == 2) #Diag up-up-right
            return tx+1, ty+1
    elseif (tx-hx == 1) & (hy-ty == 2) #Diag up-up-left
        return tx-1, ty+1
    elseif (hx-tx == 1) & (ty-hy == 2) #Diag down-down-right
        return tx+1, ty-1
    elseif (tx-hx == 1) & (ty-hy == 2) #Diag down-down-left
        return tx-1, ty-1
    elseif (tx-hx == 2) & (hy-ty == 1) #Diag up-left-left
        return tx-1, ty+1
    elseif (hx-tx == 2) & (hy-ty == 1) #Diag up-right-right
        return tx+1, ty+1
    elseif (tx-hx == 2) & (ty-hy == 1) #Diag down-left-left
        return tx-1, ty-1
    elseif (hx-tx == 2) & (ty-hy == 1) #Diag down-right-right
        return tx+1, ty-1
    else
        return tx, ty
    end
end

# part-01
dict_spaces = Dict((0,0)=>1)
hx, hy = 0,0
tx, ty = 0,0

io = open("input_09.txt", "r")
for line in eachline(io)
    letter = match(r"\w+", line).match[:]
    digit = match(r"\d+", line).match[:]
    for x in 1:parse(Int,digit)
        if letter == "D"
            hy -= 1
        elseif letter == "U"
            hy += 1
        elseif letter == "R"
            hx += 1
        elseif letter == "L"
            hx -= 1
        end
        tx, ty = to_tail_position(hx, hy, tx, ty)
        if !haskey(dict_spaces,(tx,ty))
            dict_spaces[(tx,ty)] = 1
        end
    end
end
println(length(dict_spaces))
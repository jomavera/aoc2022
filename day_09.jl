function to_tail_position(hx, hy, tx, ty)
    dif_x = hx - tx
    dif_y = hy - ty
    if abs(dif_x) >= 2 & abs(dif_y) >= 2
        return tx<hx ? hx-1 : hx + 1, ty < hy ? hy-1 : hy + 1
    elseif abs(dif_x) >= 2
        return tx<hx ? hx-1 : hx+1, hy
    elseif abs(dif_y) >= 2
        return hx, ty<hy ?  hy-1 : hy+1
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

# part-02
hx, hy = 0,0
tails = [(0,0) for x in 1:9]
spaces = Set([(0,0)])
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
        hxt, hyt = hx, hy
        for y in 1:9
            (txt, tyt) = tails[y]
            hxt, hyt = to_tail_position(hxt, hyt, txt, tyt)
            tails[y] = (hxt, hyt)
        end
        push!(spaces,(hxt, hyt))
    end
end
println(length(spaces))
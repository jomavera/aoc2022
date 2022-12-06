# part-01
io = open("input_02.txt", "r")
counter = 1
score = 0
for row in eachline(io)
    m = eachmatch(r"\w+", row)
    matches = collect(m)
    oponent = string(matches[1].match[:])
    sol = string(matches[2].match[:])
    if sol == "X"
        score += 1
        if oponent == "A"
            score += 3
        elseif oponent == "C"
            score += 6
        end
    elseif sol == "Y"
         score += 2
         if oponent == "B"
            score += 3
        elseif oponent == "A"
            score += 6
        end
    elseif sol == "Z"
        score += 3
        if oponent == "C"
            score += 3
        elseif oponent == "B"
            score += 6
        end
    end
end
println(score)

# part-02
io = open("input_02.txt", "r")
counter = 1
score = 0
for row in eachline(io)
    m = eachmatch(r"\w+", row)
    matches = collect(m)
    oponent = string(matches[1].match[:])
    sol = string(matches[2].match[:])
    if sol == "X"
        if oponent == "A"
            score += 3
        elseif oponent == "B"
            score += 1
        elseif oponent == "C"
            score += 2
        end
    elseif sol == "Y"
        score += 3
        if oponent == "A"
            score += 1
        elseif oponent == "B"
            score += 2
        elseif oponent == "C"
            score += 3
        end
    elseif sol == "Z"
        score += 6
        if oponent == "A"
            score += 2
        elseif oponent == "B"
            score += 3
        elseif oponent == "C"
            score += 1
        end
    end
end
println(score)



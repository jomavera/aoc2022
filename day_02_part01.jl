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


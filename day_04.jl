# part-01
contador = 0
io = open("input_04.txt", "r")
for row in eachline(io)
    m = eachmatch(r"\w+-\w+", row)
    matches = collect(m)
    lb1 = parse(Int64,split(matches[1].match[:],"-")[1])
    ub1 = parse(Int64,split(matches[1].match[:],"-")[2])
    lb2 = parse(Int64,split(matches[2].match[:],"-")[1])
    ub2 = parse(Int64,split(matches[2].match[:],"-")[2])
    set1 = collect(range(lb1, ub1, step=1))
    set2 = collect(range(lb2,ub2, step=1))
    if issubset(set1, set2) | issubset(set2, set1)
        contador +=1
    end
end
println(contador)

# part-02
contador = 0
io = open("input_04.txt", "r")
for row in eachline(io)
    m = eachmatch(r"\w+-\w+", row)
    matches = collect(m)
    lb1 = parse(Int64,split(matches[1].match[:],"-")[1])
    ub1 = parse(Int64,split(matches[1].match[:],"-")[2])
    lb2 = parse(Int64,split(matches[2].match[:],"-")[1])
    ub2 = parse(Int64,split(matches[2].match[:],"-")[2])
    set1 = collect(range(lb1, ub1, step=1))
    set2 = collect(range(lb2, ub2, step=1))
    if length(intersect(set1, set2))>0
        contador +=1
    end
end
println(contador)

# part-01
value = 1
values = []
io = open("input_10.txt", "r")
for line in eachline(io)
    instr = match(r"\w+", line).match[:]
    if instr == "addx"
        num = match(r"\-*\d+", line).match[:]
        for x in 1:2
            push!(values, value)
        end
        value = value + parse(Int,num)
    elseif instr == "noop"
        push!(values, value)
    end 
end
signal = values .* ([x for x in 1:length(values)])
println(sum(signal[20:40:220]))

# part-02
line_str = ""
for (ix, val) in enumerate(values)
    if ((ix%40)==0)
        line_str *="\n"
    else
        if ((ix-1)%40) in [val-1, val, val+1]
            line_str *= "#"
        else
            line_str *= "."
        end
    end
end
println(line_str)
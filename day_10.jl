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
using DataStructures

els_1 = ['F', 'T', 'C', 'L', 'R', 'P', 'G', 'Q']
els_2 = ['N', 'Q', 'H', 'W', 'R', 'F', 'S', 'J']
els_3 = ['F', 'B', 'H', 'W', 'P', 'M', 'Q']
els_4 = ['V', 'S', 'T', 'D', 'F']
els_5 = ['Q','L', 'D', 'W', 'V', 'F', 'Z']
els_6 = ['Z', 'C', 'L', 'S']
els_7 = ['Z', 'B', 'M', 'V', 'D', 'F']
els_8 = ['T', 'J', 'B']
els_9 = ['Q', 'N', 'B', 'G', 'L', 'S', 'P', 'H']

list_els = [els_1, els_2, els_3, els_4, els_5, els_6, els_7, els_8, els_9]
function create_stack(els)
    s = Stack{Char}()
    for el in els
        push!(s, el)
    end
    return s
end

# part-01
stacks = map(create_stack, list_els)
io = open("input_05.txt", "r") # without graph of initial stacks
for row in eachline(io)
    m = eachmatch(r"\d+", row)
    matches = collect(m)
    cantidad = parse(Int64, matches[1].match[:])
    stack_origin = parse(Int64, matches[2].match[:])
    stack_destination = parse(Int64, matches[3].match[:])
    for paso in range(1,cantidad)
        ele = pop!(stacks[stack_origin])
        push!(stacks[stack_destination],ele)    
    end
end
result = ""
for stack in stacks
    result *= string(first(stack))
end
println(result)

# part-02
stacks = map(create_stack, list_els)
io = open("input_05.txt", "r") # without graph of initial stacks
contador = 0
for row in eachline(io)
    m = eachmatch(r"\d+", row)
    matches = collect(m)
    cantidad = parse(Int64, matches[1].match[:])
    stack_origin = parse(Int64, matches[2].match[:])
    stack_destination = parse(Int64, matches[3].match[:])
    temp_stack = Stack{Char}()
    for paso in range(1,cantidad)
        ele = pop!(stacks[stack_origin])
        push!(temp_stack,ele)
    end
    for paso in range(1,cantidad)
        ele = pop!(temp_stack)
        push!(stacks[stack_destination],ele)
    end
end
result = ""
for stack in stacks
    result *= string(first(stack))
end
println(result)
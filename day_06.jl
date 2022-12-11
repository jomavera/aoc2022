using DataStructures

# part-01
q = Queue{Char}()
io = open("input_06.txt", "r")
for row in eachline(io)
    for (idx, letra) in enumerate(row)
        enqueue!(q,letra)
        if length(q) > 4
            dequeue!(q)
        end
        if length(q) == 4
            if length(Set(collect(q))) == 4
                println(idx)
                break
            end
        end     
    end
end

# part-02
q = Queue{Char}()
io = open("input_06.txt", "r")
for row in eachline(io)
    for (idx, letra) in enumerate(row)
        enqueue!(q,letra)
        if length(q) > 14
            dequeue!(q)
        end
        if length(q) == 14
            if length(Set(collect(q))) == 14
                println(idx)
                break
            end
        end     
    end
end
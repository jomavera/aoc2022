datos = []
io = open("input_01.txt", "r")
counter = 1
lista = Array{Int64}(undef,0)
maximo = 0
idx_maximo = -1
for row in eachline(io)
    m = eachmatch(r"\w+", row)
    matches = collect(m)
    if length(matches)>0
        push!(lista,parse(Int64, string(matches[1].match[:])))
    else
        push!(datos,sum(lista))
        lista = Array{Int64}(undef,0)
    end
    counter += 1
end
sort!(datos,rev=true)
println(sum(datos[1:3]))

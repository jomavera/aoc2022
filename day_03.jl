letras = ["a" ,"b" ,"c" ,"d" , "e", "f","g" , "h", "i" ,"j" , "k" , "l" , "m", "n", "o", "p", "q" , "r", "s", "t" , "u", "v", "w", "x", "y" , "z"]
letras_dict = Dict()
for (index, letra) in enumerate(letras)
    letras_dict[letra] = index
    letras_dict[uppercase(letra)] = index+26
end

# part-01
prioridades = []
io = open("input_03.txt", "r")
for row in eachline(io)
    m = eachmatch(r"\w+", row)
    matches = collect(m)
    rucksack = string(matches[1].match[:])
    largo = length(rucksack)
    mitad = Int64(largo/2)
    letra = intersect(collect(string(SubString(rucksack, 1, mitad))), collect(string(SubString(rucksack, mitad+1, largo))))[1]
    push!(prioridades,letras_dict[string(letra)])
end
println(sum(prioridades))

# part-02
filas = []
io = open("input_03.txt", "r")
for row in eachline(io)
    m = eachmatch(r"\w+", row)
    matches = collect(m)
    rucksack = string(matches[1].match[:])
    push!(filas,rucksack)
end
prioridades = []
for idx in 1:3:length(filas)-2
    letra = intersect(collect(string(filas[idx])), collect(string(filas[idx+1])), collect(string(filas[idx+2])))[1]
    push!(prioridades,letras_dict[string(letra)])
end
println(sum(prioridades))
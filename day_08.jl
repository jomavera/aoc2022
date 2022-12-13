tree_matrix = Array{Int64}(undef,0,99)
io = open("input_08.txt", "r")
for line in eachline(io)
    m = match(r"\d+", line)
    row_ = [parse(Int64,x) for x in split(m.match[:],"")]
    tree_matrix = [tree_matrix; reshape(row_, (1,99))]
end

(num_rows, num_cols)  = size(tree_matrix) 

# part-01
function check(height, row, col )
    top = true
    bottom = true
    left = true
    right = true
    for ix in range(1,row-1)
        if tree_matrix[ix,col] >= height
            top = false
        end
    end
    for ix in range(row+1,num_rows)
        if tree_matrix[ix,col] >= height
            bottom = false
        end
    end
    for ix in range(1,col-1)
        if tree_matrix[row, ix] >= height
            left = false
        end
    end
    for ix in range(col+1,num_cols)
        if tree_matrix[row, ix] >= height
            right = false
        end
    end
    return top || bottom || left || right
end

count = (num_cols*2 + (num_rows-2)*2)
for row in range(2,num_rows-1)
    for col in range(2,num_cols-1)
        tree_height = tree_matrix[row,col]
        if check(tree_height, row, col)
            count += 1
        end
    end
end

println(count)

# part-02
function check_ss(height, row, col)
    top = 0
    bottom = 0
    left = 0
    right = 0
    for ix in reverse(range(1, row-1))
        if tree_matrix[ix,col] < height
            top += 1
        else
            top += 1
            break
        end
    end
    for ix in range(row+1,num_rows)
        if tree_matrix[ix,col] < height
            bottom += 1
        else
            bottom += 1
            break
        end
    end
    for ix in reverse(range(1,col-1))
        if tree_matrix[row,ix] < height
            left += 1
        else
            left += 1
            break
        end
    end
    for ix in range(col+1, num_cols)
        if tree_matrix[row,ix] < height
            right += 1
        else
            right += 1
            break
        end
    end
    return top * bottom * right * left
end

highest_ss = 0
for row in range(2,num_rows-1)
    for col in range(2,num_cols-1)
        tree_height = tree_matrix[row,col]
        if check_ss(tree_height, row, col) > highest_ss
            highest_ss = check_ss(tree_height, row, col)
        end
    end
end
println(highest_ss)
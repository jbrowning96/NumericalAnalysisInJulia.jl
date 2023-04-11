module NALinAlg
using LinearAlgebra

function eliminate_row!(i, j, A::AbstractArray)
    pivot = A[i, i]
    target = A[j, i]
    multiplier = target / pivot

    A[j, :] .-= multiplier * A[i, :]
end

function make_augmented_form(A::AbstractArray, b::AbstractArray)
    A = Float64.(A)
    b = Float64.(b)

    if size(A, 1) == size(A, 2)
        return hcat(A, b)
    else
        error("Matrix is not square! Exiting With Error")
    end
end

function swap_rows!(currentPivotRow, maxRow, A)
    A[[currentPivotRow, maxRow], :] = A[[maxRow, currentPivotRow], :]
end

function partial_pivot!(i, A::AbstractArray)
    max = abs(A[i, i])
    maxRow = i

    for row in i:size(A, 1)
        if abs(A[row, i]) > max
            max = abs(A[row, i])
            maxRow = row
        end
    end

    swap_rows!(i, maxRow, A)
end

function gauss_jordan_partial_pivot(A::AbstractArray, b::AbstractArray)
    A = make_augmented_form(A, b)

    for i in 1:size(A, 1)
        partial_pivot!(i, A)
        for j in (i + 1):size(A, 1)
            eliminate_row!(i, j, A)
        end
    end

    for i in size(A, 1):-1:1
        for j in (i - 1):-1:1
            eliminate_row!(i, j, A)
        end
    end

    for i in 1:size(A, 1)
        A[i, :] ./= A[i, i]
    end

    return A[:, end]
end

function JacobiMethod(A::AbstractArray)
end
function GaussSedal(A::AbstractArray)
end
function SuccessiveOverRelaxation(A::AbstractArray, ω)
end

end
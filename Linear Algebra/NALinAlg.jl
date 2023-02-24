module NALinAlg
# Many of these functions are already implemented, probably already in much better ways... We start by implementing them in the naive way and try to
# Find better ways of doing the same procedure.

using LinearAlgebra
function EliminateRow(i,j, A::AbstractArray)
    pivot = A[i,i]
    target = A[j,i]
    multiplier =  target/pivot

    A[j,:] = A[j,:] - (multiplier * A[i,:])
    return copy(A)
end

function MakeAugmentedForm(A::AbstractArray, b::AbstractArray)
    ## Error Checking
    A = Float64.(A)
    b = Float64.(b)
    if size(A)[1] == size(A)[2]
        A = copy(hcat(A,b))
        return A
    else
        println("Matrix is not square! Exiting With Error Code -1")
        return -1
    end
end

function SwapRows(currentPivotRow, maxRow, A::DataType)
    Dummy = copy(A[currentPivotRow,:])
    A[currentPivotRow,:] = copy(A[maxRow,:])
    A[maxRow,:] = copy(Dummy)
    return A
end

function PartialPivot(i, A::AbstractArray)
    # Finding Max Element
    max = A[i,i]
    maxRow = i
    for row in range(i,size(A)[1])
        if A[row,i] > max
            max = A[row,i]
            maxRow = row
        end
    end
    # Swap the Row with the Maximum Value with the current Pivot Row
    A = copy(SwapRows(i,maxRow, A))
end


## Main Functions
function NaiveGaussJordan(A::AbstractArray, b::AbstractArray)
    A = Float64.(A)
    b = Float64.(b)

    A = copy(MakeAugmentedForm(A,b))
    if A == -1
        return
    end
    for i in range(1,size(A)[1])
        for j in range(i+1, size(A)[1])
            #Checking for 0's:
            if A[j,i] != 0
                EliminateRow(i,j,A)
                #display(A)
            else
                #display(A)
                continue
            end
        end
    end
    return A
end

function GaussJordanPartialPivot(A::AbstractArray, b::AbstractArray)
    A = Float64.(A)
    b = Float64.(b)

    A = copy(MakeAugmentedForm(A,b))
    if A == -1
        return
    end

    for i in range(1,size(A)[1])
        PartialPivot(i,A)
        for j in range(i+1, size(A)[1])
            #Checking for 0's:
            if A[j,i] != 0
                EliminateRow(i,j,A)
            else
                continue
            end
        end
    end
    return A
end

function JacobiMethod(A::AbstractArray)
end
function GaussSedal(A::AbstractArray)
end
function SuccessiveOverRelaxation(A::AbstractArray, ω)
end

end
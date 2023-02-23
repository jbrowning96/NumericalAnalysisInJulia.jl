# Many of these functions are already implemented, probably already in much better ways.
using LinearAlgebra

function NaiveGaussJordan(A::AbstractArray)
    #Checking for square matrix
    if size(A)(1) == size(A)(2)
        n = size(A)(1)
    else
        println("Matrix is not square, cannot perform Gauss Jordan")
    end

    # Reducing the matrix by taking making all values under the row a 0, so as to upper triangularize the system.
    pivot = 0
    target = 0
    for j in range(n-1)
        if abs(A[j,j])isapprox(0)
            error("Zero Pivot Encountered")
            break
        end

        for j+1 in range(n)
            pivot = A[j,j]
            target = A[j+1,j]
            mult = target/pivot
            A[j+1,:] = copy((mult)*A[i,:])
        end
    end
end

function GaussJordanPartialPivot(A::AbstractArray)
    #Checking for square matrix
    if size(A)(1) == size(A)(2)
        n = size(A)(1)
    else
        println("Matrix is not square, cannot perform Gauss Jordan")
    end
    #Doing any exchanges so that the largest value for this diagonal exists in the a(j,j)th diagonal.
    for i in range(n)
        for j in range(n)
            if A[i,j] > A[i,i]
                #Swap
                temp = copy(A[i,:])
                A[i,:] = copy(A[j,:])
                A[j,:] = copy(temp)
            end
        end
    end

    # Reducing the matrix by taking making all values under the row a 0, so as to upper triangularize the system.
    pivot = 0
    target = 0
    for j in range(n-1)
        if abs(A[j,j])isapprox(0)
            error("Zero Pivot Encountered")
            break
        end

        for j+1 in range(n)
            pivot = A[j,j]
            target = A[j+1,j]
            mult = target/pivot
            A[j+1,:] = copy((mult)*A[i,:])
        end
    end
end

function JacobiMethod(A::AbstractArray)
end
function GaussSedal(A::AbstractArray)
end
function SuccessiveOverRelaxation(A::AbstractArray, ω)
end
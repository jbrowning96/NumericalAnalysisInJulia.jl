# Many of these functions are already implemented, probably already in much better ways.
using LinearAlgebra

function NaiveGaussJordan(A::AbstractArray)
    #Checking for square matrix
    if size(A)(1) == size(A)(2)
        n = size(A)(1)
    else
        println("Matrix is not square, cannot perform Gauss Jordan")
    end

    pivot = 0
    target = 0
    # Reducing the matrix by taking making all values under the row a 0, so as to upper triangularize the system.

    for j in range(n-1)
        if abs(A[j,j])isapprox(0)
            error("Zero Pivot Encountered")
            break
        end

        for j+1 in range(n)
            pivot = A[j,j]
            target = A[j+1,j]
            mult = target/pivot
            A[j+1,:] = (mult)*A[i,:]
        end
    end
end

function GaussJordan(A::AbstractArray)
    #Checking for square matrix
    if size(A)(1) == size(A)(2)
        n = size(A)(1)
    else
        println("Matrix is not square, cannot perform Gauss Jordan")
    end

    pivot = 0
    target = 0
    # Reducing the matrix by taking making all values under the row a 0, so as to upper triangularize the system.
    # This means we take
    for j in range(n-1)
        if abs(A[j,j])isapprox(0)
            error("Zero Pivot Encountered")
            break
        end

        for j+1 in range(n)
            pivot = A[j,j]
            target = A[j+1,j]
            mult = target/pivot
            A[j+1,:] = (mult)*A[i,:]
        end
    end
end

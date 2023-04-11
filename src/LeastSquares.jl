module LeastSquares

include("NALinAlg.jl")

using LinearAlgebra

#TODO: Switching function that generates the A array based on 
#based on data points and user input between linear and quadratic.


function evaluateNormal(A, bVec)
    norm_A = copy(transpose(A) * A)
    norm_B = copy(transpose(A) * bVec)
    x = NALinAlg.gauss_jordan_partial_pivot(norm_A, norm_B)
    println("AᵀAx = Aᵀb results in x = ", x)

    return x
end

function root_mean_square_error(A, bVec, x)
    bVec = copy(bVec)
    A = copy(A)
    x = copy(x)

    bVec = broadcast(abs, bVec - (A * x))
    println("Errors are given by: ", bVec)

    bVec = bVec .^ 2

    SquareError = sum(bVec)

    println("2-Norm Error is: ", sqrt(SquareError))

    MeanSquareError = SquareError/length(bVec)
    RootMeanSquareError = sqrt(MeanSquareError)

    println("The RMSE is: ", RootMeanSquareError)
    return RootMeanSquareError
end

function least_squares_na(A, bVec)
    x = evaluateNormal(A, bVec)
    root_mean_square_error(A, bVec, x)
end


end
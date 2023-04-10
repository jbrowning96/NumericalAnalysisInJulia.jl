module PolynomialInterpolation

using LinearAlgebra
using Plots
include("NALinAlg.jl")

function LagrangeMethod(xVec::Vector, yVec::Vector)

end

function divided_differences(x::Vector{Float64}, y::Vector{Float64})
    n = length(x)
    F = zeros(n, n)
    F[:, 1] = y

    for j in 2:n
        for i in 1:(n - j + 1)
            F[i, j] = (F[i + 1, j - 1] - F[i, j - 1]) / (x[i + j - 1] - x[i])
        end
    end

    return F
end

function newton_interpolation(x::Vector{Float64}, y::Vector{Float64}, xi::Float64)
    F = divided_differences(x, y)
    n = length(x)
    result = F[1, 1]
    product_term = 1.0

    for i in 1:(n - 1)
        product_term *= (xi - x[i])
        result += product_term * F[1, i + 1]
    end

    return result
end

end
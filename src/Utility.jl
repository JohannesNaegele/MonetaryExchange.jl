"""
This is the generic example for a bounded and strictly concave utility function.
"""
function generic(consumption)
    return 1 - exp(-prod(consumption))
end

"""
This is the generic example after a logarithmic transformation.
"""
function log_generic(consumption)
    return -prod(consumption)
end

"""
This is a Cobb-Douglas type utility function.
"""
function cobb_douglas(consumption, α)
    return prod(consumption.^α)
end

"""
Logistic transformation.
"""
logistic_transformation(x) = 1 / (1 + exp(-x))

"""
This is a Cobb-Douglas type utility function after a logistic-type transformation.

The derivative of this function is:
    f'(x) = exp(-x) / (1 + exp(-x))^2 * exp(-x)'
"""
function bounded_cobb_douglas(consumption, α)
    return (logistic_transformation ∘ cobb_douglas)(consumption, α)
end
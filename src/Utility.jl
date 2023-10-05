"""
This is a Cobb-Douglas type utility function.
"""
function cobb_douglas(consumption, α)
    return (consumption .^ α)
end

"""
Logistic transformation.
"""
logistic_transformation(x) = 1 / (1 + exp(x))

"""
This is a Cobb-Douglas type utility function after a logistic-type transformation
"""
function bounded_cobb_douglas(consumption, α)
    return logistic_transformation(cobb_douglas(consumption, α))
end
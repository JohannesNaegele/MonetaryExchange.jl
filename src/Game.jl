struct Group
    agents::Vector{Agents}
end

mutable struct Game
    groups::Vector{Group}
    time::Float64
end
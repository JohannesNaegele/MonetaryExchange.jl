import Base

@Base.kwdef struct Group
    agents::Vector{Agent}
    utility_mask
end

@Base.kwdef mutable struct Game
    groups::Vector{Group}
    time::Float64
    const μ::Float64 # probability of meeting another agent in a discrete time step
    const n_goods::Int64 # number of goods without money
end

function DefaultGame(; repr_agent::Agent, agents_per_group)
    n_groups = length(repr_agent.inventory) - 1
    Game(
        groups=[
            Group(
                agents=[deepcopy(repr_agent) for j in 1:agents_per_group],
                utility_mask=[(j == i) || (j + 1 == i) for j in 1:(n_groups + 1)]
            )
            for i in 1:n_groups
        ],
        time=0.0,
        μ=0.5,
        n_goods=n_groups
    )
end

Base.getindex(game::Game, elements...) = game.groups[elements[1]].agents[elements[2]]
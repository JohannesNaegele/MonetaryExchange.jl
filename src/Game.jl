import Base

@Base.kwdef struct Group
    agents::Vector{Agent}
    utility_mask
    production
end

@Base.kwdef mutable struct Game
    const groups::Vector{Group}
    const n_agents::Int64
    const realized_prices::Matrix{Float64} # keeps track of the realized prices of last period (if trades of good took place)
    const realized_trades::Vector{Int64} # keeps track of the realized number of trades (if trades of good took place)
    const μ::Float64 # probability of meeting another agent in a discrete time step
    const n_goods::Int64 # number of goods without money
    time::Float64
end

function DefaultGame(; repr_agent::Agent, agents_per_group)
    n_groups = length(repr_agent.inventory) - 1
    groups = [
        Group(
            agents=[deepcopy(repr_agent) for j in 1:agents_per_group],
            utility_mask=[(j == i) || (j + 1 == i) for j in 1:(n_groups + 1)],
            production=[(j == i) ? 1.0 : 0.0 for j in 1:(n_groups + 1)]
        )
        for i in 1:n_groups
    ]
    n_agents=sum(g -> length(g.agents), groups)
    Game(
        groups=groups,
        n_agents=n_agents,
        realized_prices=zeros(Int(ceil(n_agents / 2)), n_groups),
        realized_trades=zeros(n_groups),
        μ=0.5,
        n_goods=n_groups,
        time=0.0
    )
end

Base.getindex(game::Game, elements...) = game.groups[elements[1]].agents[elements[2]]
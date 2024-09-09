"""
We loop through all agents; an agent draws a matching with Poisson(h * μ / 2), we sample the partner uniformly from the rest.
"""
function sequential_matching(game::Game)
end

"""
Choose n agents where n ∼ Poisson(h * μ * total number of agents). If n is not an even number, we take n - 1. Then we randomly assign partners with uniform probability.
"""
function simultaneous_matching(game::Game)
    poi = Poisson(game.h * game.μ * n_agents(game))
    n_old = rand(poi)
    n = n_old % 2 == 0 ? n_old : n_old - 1
    matched_agents = sample(1:n_agents(game), n, replace=false)
    pairs = matched_agents[start:div(n, 2)] .=> matched_agents[(div(n, 2) + 1):end]
    return pairs
end
using Distributions

"""
Return utility given an consumption vector. The mask ensures that only the relevant goods are fed into the utility function.
"""
function utility(agent::Agent, consumption, mask)
    return agent.utility(consumption[mask])
end

"""
We loop through all agents; one agent draws a matching with probability p = μ/2, we sample the partner uniformly from the rest.
Thus, each agent has a probability p + (n - 1)/(n - 1)p = μ of matching with one of the other agents.
"""
function sequential_matching(game::Game)
    pairs::Array{Pair} = [] # ?
    return pairs
end

"""
Build (number_of_agents * μ) pairs. If this product is not an even number:
Choose with the appropriate Bernoulli probability p between the upper and the lower number of pairs.
"""
function simultaneous_matching(game::Game)
    for group in game.group
        for agent in group.agents
            nothing
        end
    end
    pairs::Array{Pair} = [] # ?
    return pairs
end

"""
Change the state of the game by going forward in time by amount `dt`.
"""
function step!(game::Game, dt)

    util = utility(agent, cons, group.utility_mask)
    game.time += dt
end
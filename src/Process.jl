using Distributions

"""
Return utility given an consumption vector. The mask ensures that only the relevant goods are fed into the utility function.
"""
function utility(agent::Agent, consumption, mask)
    return agent.utility(consumption[mask])
end

"""
Change the state of the game by going forward in time by amount `dt`.
"""
function step!(game::Game, dt)

    util = utility(agent, cons, group.utility_mask)
    game.time += dt
end
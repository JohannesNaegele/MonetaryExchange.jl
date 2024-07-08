using Distributions

# struct EmpiricalDistribution
#     n
# end

"""
Sample from the empirical distribution of prices. If no trade has ever taken, sample from  the prior of the agent.
"""
function sample_observed_price_dist(game::Game, agent::Agent, good)
    n_trades = game.realized_trades[good]
    if n_trades > 0
        dist = DiscreteUniform(1, n_trades)
        return game.realized_prices[rand(dist)]
    else
        return rand(agent.price_prior)
    end
end

"""
Change the state of the game by going forward in time by amount `dt`. The concrete type of matchings between the agents can be specified.
"""
function step!(game::Game, dt, matching=sequential_matching)
    # update_inventory!()
    pairs = matching(game)
    approximate_optimality!(game)
    trade!(game, pairs)

    game.time += dt
end
using ReinforcementLearning
using IntervalBoxes

Base.@kwdef mutable struct MatchingEnv <: AbstractEnv
    const μ::Float64 # Poisson intensity
    const inventory::Vector{Float64} # inventory of goods for our agent
    const prices::Vector{Float64} # Courrent prices of goods (part of the state)
    price_dist # Empirical distribution of encountered prices
    utility
    current_consumption
end

action_space(env::MatchingEnv) = IntervalBox(-Inf..Inf, -Inf..Inf,)
state(env::MatchingEnv) = env.inventory
state_space(env::MatchingEnv) = IntervalBox(0..Inf, 0..Inf, 0..Inf, 0..1, 0..1, 0..Inf)
reward(env::MatchingEnv)
is_terminated(env::MatchingEnv) = false
function reset!(env::MatchingEnv)
end
function act!(env::MatchingEnv, action)

end

# Define the environment
run(
    RandomPolicy(),
    MatchingEnv(),
    StopAfterNSteps(1_000),
    TotalRewardPerEpisode()
)
using MonetaryExchange
using Distributions

game = DefaultGame(
    repr_agent=Agent(
        [1.0 for i in 1:4],
        x -> bounded_cobb_douglas(x, [0.5, 0.5]),
        0.01,
        [Exponential(1) for i in 1:2]
    ),
    agents_per_group=10
)
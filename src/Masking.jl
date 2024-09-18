"""
This function maps a vector of inputs from 0.0 to 1.0 to the desired post-trade inventories.

Consider an input of [0.5, 0.25], inventory of [1.0, 1.0, 1.0] and prices of [1.0, 2.0, 3.0].
Then, we can at most buy 5.0 of good one i.e. that our post-trade inventory is 0.5 * (5.0 + 1.0) = 3.0.
*After* this trade (requiring 1 of good 2), we can at most possess (1.0 - 1.0 + 3.0/2.0) = 1.5 of good 2 i.e. our post-trade inventory is 0.375.
The remaining post-trade inventory of good 3 is thus 1.0 - (2.0 * 1.0 - 0.625 * 2.0) / 3.0 = 0.75.

The output will thus be [3.0, 0.375, 0.75].
"""

inventory_value(inventory, prices) = inventory' * prices

function mask(action, inventory, prices)
    new_inventory = copy(inventory)
    total_value = inventory_value(inventory, prices)
    remaining_value = total_value
    max_amount = remaining_value / prices[1]

    for i in eachindex(inventory)[begin:end-1]
        println(max_amount)
        new_inventory[i] = action[i] * max_amount
        remaining_value -= new_inventory[i] * prices[i]
        max_amount = remaining_value / prices[i + 1]
    end
    new_inventory[end] = max_amount 

    return new_inventory
end

mask([0.5, 0.25], [1.0, 1.0, 1.0], [1.0, 2.0, 3.0])
struct Agent
    inventory
    utility # utility for goods in which our agent is generally interested
    ρ::Float64 # time preference rate
    price_prior
end

"""
Return utility given an consumption vector. The mask ensures that only the relevant goods are fed into the utility function.
"""
function utility(agent::Agent, consumption, mask)
    return agent.utility(consumption[mask])
end

function update_inventory!(agent::Agent, consumption, production)
    agent.inventory += (production - consumption)
end
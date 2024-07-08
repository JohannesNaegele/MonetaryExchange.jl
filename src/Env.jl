function step!(agent::Agent, group::Group, action) # agent in our case is also part of env since her utility function determines reward
    update_inventory!(agent, action, group.production)
    util = utility(agent, action, group.utility_mask)
    return util # reward
end
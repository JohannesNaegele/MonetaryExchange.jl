using Plots

# Create a grid for the plot
x = range(0.1, stop=10, length=50)
y = range(0.1, stop=10, length=50)
z = [bounded_cobb_douglas([xi, yi], [0.6, 0.4]) for xi in x, yi in y]

# Generate the surface plot
surface(x, y, z, xlabel="Consumption 1", ylabel="Consumption 2", zlabel="Utility", title="Bounded Cobb-Douglas Utility Function")
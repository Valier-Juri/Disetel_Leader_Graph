% Parameters
p = 2; % Number of child in 1st tree
q = 2; % Number of child in 2nd tree
layers = 3% Height

% Initialize arrays
x_coords = [];
y_coords = [];
z_coords = [];

% Loop
for h = 1:layers
    % Calculate the number of vertices and spacing for this layer
    num_vertices = p^h;
    pspace = p^(layers - h);
    
    % Calculate the horizontal coordinate of the first node at this height
    x_start = pspace / 2 - 0.5;
    
    % Loop through the vertices at this height
    for i = 1:num_vertices
        % Calculate the x, y, and z coordinates for each vertex
        x = x_start + (i - 1) * pspace;
        y = 0; % On the y = 0 plane
        z = h; % Height
        
        % Append the coordinates to the arrays
        x_coords = [x_coords, x];
        y_coords = [y_coords, y];
        z_coords = [z_coords, z];
    end
end

% Create a 3D scatter plot
scatter3(x_coords, y_coords, z_coords, 'filled', 'MarkerFaceColor', 'r');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Tree Plot');
grid on;

% Loop through the q children at height n
for child = 1:q
    % Calculate x and z coordinates for the child at height n
    child_pshift = child * (pshift / q); % Calculate child's pshift as described
    x_child = (pshift / q) - 0.5 + pshift + child_pshift;
    z_child = n - 1;
            
    % Plot
    plot3([x_node, x_child], [0, 0], [z_node, z_child], '-b'); % Use blue lines for edges
end



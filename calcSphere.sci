// calcBlock.sci

function patches = calcSphere(r, radius, resolution)
    // Generate patches data of a sphere geometry

    // Generate spherical coordinates
    [theta, phi] = meshgrid(linspace(0, %pi, resolution), linspace(0, 2*%pi, resolution));
    
    // Convert spherical coordinates to Cartesian coordinates
    x = r(1) + radius * sin(theta) .* cos(phi);
    y = r(2) + radius * sin(theta) .* sin(phi);
    z = r(3) + radius * cos(theta);

    // Reshape coordinates for plotting
    x = matrix(x, size(x, 1) * size(x, 2), 1);
    y = matrix(y, size(y, 1) * size(y, 2), 1);
    z = matrix(z, size(z, 1) * size(z, 2), 1);

    // Create patches structure
    patches.x = x;
    patches.y = y;
    patches.z = z;
endfunction

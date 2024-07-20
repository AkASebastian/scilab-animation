function vertices = transver(vertices_0, r, R)
// Transform vertices by translation vector r and rotation matrix R

vertices = vertices_0*R + repmat(r', size(vertices_0, 1), 1);

endfunction

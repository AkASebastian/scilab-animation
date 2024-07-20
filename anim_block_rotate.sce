clear; 

exec('eulerXYZ.sci', -1);
exec('transver.sci', -1);
exec('calcSphere.sci', -1);


radius = 0.2;


t = (0:0.0003:1)';             
position = [0*t, 0*t, 0.40*-abs(sin(2*%pi*t))];  
angles = [2*%pi*t, 0*t, 0*t]; 


h_fig = figure;
h_fig.background = 8;
drawlater();
patches = calcSphere([0;0;0], radius, 20); 
h_pat = plot3d(patches.x, patches.y, patches.z); 
h_pat.color_mode = 4;
h_pat.foreground = 1;
h_pat.hiddencolor = 4;


xlabel("x"); ylabel("y"); zlabel("z");
h_axes = gca();
h_axes.isoview = "on";
h_axes.box = "off";
h_axes.rotation_angles = [63.5, -127];
h_axes.data_bounds = [-0.5, -0.5, -0.5; 0.5, 0.5, 0.5];
xgrid;


for i = 1:length(t)
    r = position(i,:)'; 
    R = eulerXYZ(angles(i,1), angles(i,2), angles(i,3)); 
    patches = calcSphere(r, radius, 20); 

    h_pat.data.x = patches.x; 
    h_pat.data.y = patches.y; 
    h_pat.data.z = patches.z; 
    drawnow();
end

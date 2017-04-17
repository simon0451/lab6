function [Y] = NACA0012(x,c)
%units are in meters
%this function returns the y-axis point on an airfoil given an x-axis
%point, and the chord of the wing, according to the NACA 0012 airfoil
%formula
t = .12; %this is the thickness to chord length ratio, .12 on a NACA 0012 airfoil
Y = 5*t*c*(.2969*sqrt(x./c)-.1260*(x./c)-.3516*((x./c).^2)+.2843*((x./c).^3)-.1015*((x./c).^4));
end
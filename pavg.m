function [avgPressures] = pavg(pressures)
%this function creates pressures that correspond to the areas drawn between
%pressure tap positions
for i = 1:1:(length(pressures)-1)
    avgPressures(i) = (pressures(i)+pressures(i+1))/2;
end
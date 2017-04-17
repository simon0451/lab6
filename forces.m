function [xforce,yforce] = forces(pavgupper,pavglower,uppertapsx,uppertapsy,lowertapsx,lowertapsy)
%this function takes the average pressures, the x values, and the y values
%and finds the lift and drag

%assuming 300 mm span
b = 300; %mm
pavgupper = pavgupper.*0.000001; %converting to Newtons per square millimeter
pavglower = pavglower.*0.000001;

for i = 1:1:length(pavgupper)
    M = sqrt((uppertapsx(i+1)-uppertapsx(i)).^2+(uppertapsy(i+1)-uppertapsy(i).^2)); %not mass, just a variable M - line length
    upperforces(i) = b*M*pavgupper;
    upperangles(i) = atand((uppertapsy(i+1)-uppertapsy(i))./(uppertapsx(i+1)-uppertaps(i)));
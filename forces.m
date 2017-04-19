function [xforce,yforce] = forces(alpha,pavgupper,pavglower,uppertapsx,uppertapsy,lowertapsx,lowertapsy)
%this function takes the average pressures, the x values, and the y values
%and finds the lift and drag

%assuming 300 mm span
b = 300; %mm
pavgupper = pavgupper.*0.000001; %converting to Newtons per square millimeter
pavglower = pavglower.*0.000001; 

for i = 1:1:(length(uppertapsx)-1)
    M(i) = sqrt(((uppertapsx(i+1)-uppertapsx(i)).^2)+((uppertapsy(i+1)-uppertapsy(i)).^2)); %not mass, just a variable M - line length
    upperforces(i) = b*M(i)*pavgupper(i);
    upperangles(i) = atand((uppertapsy(i+1)-uppertapsy(i))./(uppertapsx(i+1)-uppertapsx(i)));
    upperlifts(i) = -1.*(upperforces(i).*cosd(upperangles(i)));
    upperformdrags(i) = upperforces(i).*sind(upperangles(i));
end
% disp(upperlifts) %debugging information
% disp(upperformdrags) %debugging information

for i = 1:1:(length(lowertapsx)-1)
    M(i) = sqrt((lowertapsx(i+1)-lowertapsx(i)).^2+((lowertapsy(i+1)-lowertapsy(i)).^2)); %not mass, just a variable M - line length
    lowerforces(i) = b*M(i)*pavglower(i);
    lowerangles(i) = atand((lowertapsy(i+1)-lowertapsy(i))./(lowertapsx(i+1)-lowertapsx(i)));
    lowerlifts(i) = lowerforces(i).*cosd(lowerangles(i));
    lowerformdrags(i) = lowerforces(i).*sind(lowerangles(i));
end
% disp(lowerlifts) %debugging information
% disp(lowerformdrags) %debugging information


xforceaf = sum(upperformdrags)+sum(lowerformdrags); %summing both sides of the airfoil to find drags
yforceaf = abs(sum(upperlifts)+sum(lowerlifts)); %taking absolute for sign convention

xforce = yforceaf.*sind(alpha)-xforceaf.*cosd(alpha);
yforce = yforceaf.*cosd(alpha)+xforceaf.*sind(alpha);
end


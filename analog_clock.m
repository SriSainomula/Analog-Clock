clc;clear;clf;
%% Draw a Circle with Radius 10
x=0;y=0;r=10;
hold on;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit,yunit,'k');title('INDIA');
%% Used For loop to get Darker Circle by drawing circles with different radius
for r=10:0.005:10.2
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit,yunit,'k');
end
%% Marks hours[1-12] which are 30 degrees apart from each other
r=8; s=[1]; 
for th = pi/6: pi/6: 2*pi
 ytemp = r * cos(th);
 xtemp = r * sin(th);  
 text(xtemp,ytemp,num2str(s));
 s = s+1;
end
%% Start an infinite loop to mark the current time
while(1)
c = clock;%Format-year,month,date,hours,minutes,seconds
c = c(1,4:6);%Get only Time and remove date
min =c(1,2);%Getting minutes 
sec=c(1,3);%Getting Seconds
%% Check whether system clock is in 24-hours and bring that to 12-hour format
if (c(1,1)>12)  
   hr = c(1,1)-12; 
else
    hr = c(1,1);
end
%% Plotting the time using Logic
min1 = ceil(min/12);
theta = (hr*pi)/6 + (min1*pi)/30;%Hour hand moves 30 degrees per each hour
f=figure(1); axis off;hold on;
ytemp = 3 * cos(theta); Y = [0 ytemp]; 
xtemp = 3 * sin(theta); X = [0 xtemp];
p=plot(X,Y,'r-','LineWidth',6);hold on;
theta1 = (min*pi)/30;
ytemp1 = 5 * cos(theta1); Y1 = [0 ytemp1]; 
xtemp1 = 5 * sin(theta1); X1 = [0 xtemp1];
p1=plot(X1,Y1,'b','LineWidth',5);
theta2 = (sec*pi)/30;
ytemp2 = 7 * cos(theta2); Y2 = [0 ytemp2]; 
xtemp2 = 7 * sin(theta2); X2 = [0 xtemp2];
p2=plot(X2,Y2,'g','LineWidth',3);
pause(1);%Pause for one second,clear present plots and start loop again
delete(p2);
delete(p1);
delete(p);
end
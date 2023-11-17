hold off;
plot(0.0)
grid
hold on

if exist('tq6.mat')
load('tq6.mat')
plot(g.wm/2/pi*60,g.to,'b')
end

if exist('tq3.mat')
load('tq3.mat')
plot(g.wm/2/pi*60,g.to,'r')
end

if exist('tq1.5.mat')
load('tq1.5.mat')
plot(g.wm/2/pi*60,g.to,'g')
end

hold off

xlabel('n [rpm]')
ylabel('torque')
%legend('6','3','1.5','Location', 'SouthWest')
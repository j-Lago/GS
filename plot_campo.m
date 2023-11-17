function plot_campo(s,a, cor, linewidth)

M=[cos(a), sin(a); -sin(a), cos(a)];

rm = .23*s;
rM = .90*s; 
dy = rM/6;
cy = dy+rm;
cx = rM-rm;

N = 100;

x = linspace(0, rM, N);

y1 = (x <= cx).* dy + (x > cx).* (-sqrt(rm^2-(x-cx).^2)+cy);
y2 = sqrt((rM+.075*s)^2-x.^2);


XY=real(M*[x;y1]);
xr1=XY(1,:);
yr1=XY(2,:);
XY=real(M*[x;y2]);
xr2=XY(1,:);
yr2=XY(2,:);

XY=real(M*[-x;-y1]);
xr3=XY(1,:);
yr3=XY(2,:);
XY=real(M*[-x;-y2]);
xr4=XY(1,:);
yr4=XY(2,:);

XY=real(M*[-x;y1]);
xr5=XY(1,:);
yr5=XY(2,:);
XY=real(M*[-x;y2]);
xr6=XY(1,:);
yr6=XY(2,:);

XY=real(M*[x;-y1]);
xr7=XY(1,:);
yr7=XY(2,:);
XY=real(M*[x;-y2]);
xr8=XY(1,:);
yr8=XY(2,:);

plot([xr1;xr2;xr3;xr4;xr5;xr6;xr7;xr8]', [yr1;yr2;yr3;yr4;yr5;yr6;yr7;yr8]',cor, 'LineWidth', linewidth)
%plot([xr1; xr2]', [yr1; yr2]','m', 'LineWidth', 2)
%plot([xr3; xr4]', [yr3; yr4]','m', 'LineWidth', 2)
%plot([xr5; xr6]', [yr5; yr6]','m', 'LineWidth', 2)
%plot([xr7; xr8]', [yr7; yr8]','m', 'LineWidth', 2)

%plot([x; x]', [y1; y2]',cor, 'LineWidth', 2)
%Plot([-x; -x]', [-y1; -y2]',cor, 'LineWidth', 2)
%plot([x; x]', [-y1; -y2]',cor, 'LineWidth', 2)
%plot([-x; -x]', [y1; y2]',cor, 'LineWidth', 2)


end
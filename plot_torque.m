function plot_torque(d, cor, linewidth)

th=linspace(0,2*pi,200);

plot(d*cos(th),d*sin(th),cor,'LineWidth',linewidth)

end
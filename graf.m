global t
global pm
global fe
global e

global ref_source

global dt
global RUN
global LINHAS
global R_FLUX
global S_FLUX
global COLOR_FLUX
global CLOSE
global RES_ONLY
global SR_FLUX
global R_PLOT
global E_DISTR
global TORQUE
global k
global eMAX
global V
global fref

global START
global pmMIN
global pmMAX


fe=60;
X = 1.2;
H = 0.001;
D = 200;

%curva capabilidade
Slim = 1.3;
Plim = 1.2;
Flim = [1.4 3.65];
F0 = -3/X;
%K1lim = 1.5;
%K0lim = 1;



Dt=.0003;
t=0;
t0=0;
phir0 = [0,0,0];
thm=0;
dthref=0;
thref0 = 0;
the=0;
ref_source = 0;

Pe = 0;
Qe = 0;



ir=0;
gcount=0;

k=0;
kmax=10000;
g.wm=NaN(1,kmax);
g.to=NaN(1,kmax);
g.i=NaN(1,kmax);

phiR0 = [0,0,0];

we = 2*pi*fe;
xdelta = 0:0.01:pi;
delta = 0;
wr = we;

while 1


axes(handles.axes1);

de=2;
dr=1.55;
Bscale = 1.2;

if COLOR_FLUX
    cor_e = 'rgbc';
    cor_r = 'mycm';
    cor_ef = 'rgbc';
    cor_rf = 'mycm';
else
    cor_e = 'cccc';
    cor_r = 'mmmm';
    cor_rf = 'mmmm';
    cor_ef = 'bbbc';
end

alpha=2*pi/3;

    
if RUN
    t=t+Dt;

    E = e;
    Pm = pm;
    
    
    
    dwr = (wr/H*(Pm-3*V*E/X*sin(delta)) -(wr-we)*D)* Dt;
    wr = wr + dwr;

    thm = thm + wr*Dt;
    the = the + 2*pi*fe*Dt;
    
    delta = thm - the;

    switch ref_source
        case 0
            thref = 0;
        case 1
            thref = thm;
        otherwise
            thref = the;
    end 


a=2*pi/3;

Pe = 3*V*E/X*sin(delta);
Qe = -3*V*(V-E)/X*cos(delta);
Se = sqrt(Pe^2-Qe^2);
phi = atan(Qe/Pe);

gama = phi+delta;

%Barm=(V-E*exp(1i*(delta)))/1i;
%Barm = (E*exp(1i*(delta))-V)*exp(1i*thm);

B1 = E*exp(1i*thm);
B2 = V*exp(1i*the);
Barm = B2-B1;
amp = 2/3*abs(Barm);
ang = (angle(Barm));

%orientação bobinas estator
vecS(1) = exp(1i*(0));
vecS(2) = exp(1i*(a));
vecS(3) = exp(1i*(-a));

%modulo indução enrolamentos estator
Bs(1) = amp*cos(ang);
Bs(2) = amp*cos(-a+ang);   
Bs(3) = amp*cos(a+ang);  

%vetor indução enrolamentos estator
vecBs(1) = Bs(1) * vecS(1);
vecBs(2) = Bs(2) * vecS(2);  
vecBs(3) = Bs(3) * vecS(3);
vecBs_eq = sum(vecBs);

%orientação bobinas rotor
vecR(1) = exp(1i*(0+thm));
vecR(2) = exp(1i*(pi/2+thm));
vecR(3) = exp(1i*(pi/2+thm));
Br = [E,0,0];

vecBr(1) = Br(1) * vecR(1);
vecBr(2) = Br(2) * vecR(2);  
vecBr(3) = Br(3) * vecR(3);
vecBr_eq = sum(vecBr);    

vecBliq_eq = vecBr_eq+vecBs_eq;


ang = angle(vecBliq_eq);
amp = 2/3*abs(vecBliq_eq);
Bliq(1) = amp*cos(ang);
Bliq(2) = amp*cos(-a+ang);   
Bliq(3) = amp*cos(a+ang); 


end


if gcount>=0
    %subplot(2,1,1)
    plot(0,0)
    %title(['fm = ', num2str(fm),' | torque = ', num2str(torque)]);
    %title([num2str(Zr),' || ','fe = ', num2str(fe), 'Hz | ', 'fm = ', num2str(fm),' | torque = ', num2str(torque), ' | s = ', num2str(s)]);

    titulo=sprintf( 'Pm = %1.2f  Pe = %1.2f  Qe = %1.2f  E = %1.2f  delta = %2.1f' , Pm, Pe, Qe, E, delta/pi*180);
    title(titulo,'FontSize',16);
    
    hold on;
    
    if E_DISTR
        plot_estator(thref, de, cor_e, 4)
    else
        plot_estator(thref, de, cor_e, 1)
    end
    
    if R_PLOT
        plot_rotor(thref,thm, dr, cor_r)
    end

    if S_FLUX
        plot_cge(thref, Bscale*Bs, de, cor_ef,RES_ONLY, a, 1);
    end

    if R_FLUX
        plot_cge(thref-thm, Bscale*Br, dr, cor_rf, RES_ONLY, 0, 1);
    end 
    
    plot_cge(thref, Bscale*Bliq, de, 'yyyy', 1 , a, 0);

    

    hold off
    
    set(gca,'XTickLabel',[])
    set(gca,'YTickLabel',[])
    %pause(DELAY)

    axes(handles.axes2);
    dd = 0.02;
    xdelta = 0:dd:90;
    plot(xdelta, 3*V*E/X*sind(xdelta), 'b', 'LineWidth', 1.5)
    hold on
    xdelta = 90:dd:180;
    plot(xdelta, 3*V*E/X*sind(xdelta), ':b')
    xdelta = -180:dd:0;
    plot(xdelta, 3*V*E/X*sind(xdelta), ':b')
    plot([-180,180], [Pm, Pm], 'r', 'LineWidth', 1.5)
    
    
    
    plot((mod(delta+pi,2*pi)-pi)/pi*180, Pe, 'ok', 'LineWidth', 1.2)
    plot((mod(delta+pi,2*pi)-pi)/pi*180, Pe, '+k', 'LineWidth', 1)
    xlim([-180,180])
    set(gca,'xtick',[-180 -135 -90 -45 0 45 90 135 180])
    ylim([-3,3])
    grid
    hold off
    
    
    
    xl=[-1,1]*(Slim+0.2);
    yl=[-1,1]*(Slim+0.2);
    axes(handles.axes3);
    
    lw = 0.2;
    cl = '-.m';
    plot([0,0], yl, cl, 'LineWidth', lw)
    hold on
    plot(xl, [0,0], ':k', 'LineWidth', lw)
   
    
    plot([Plim, Plim], yl, cl, 'LineWidth', lw)
    
    ang = -pi/2:0.01:pi/2;
    plot(Slim*cos(ang), Slim*sin(ang), cl, 'LineWidth', lw)
    
    ang = 0:0.01:pi/2; %1.725
    plot(Flim(1)*cos(ang), Flim(1)*sin(ang)+F0, cl, 'LineWidth', lw)
    
    ang = 0:0.01:pi/2; %1.29
    plot(Flim(2)*cos(ang), Flim(2)*sin(ang)+F0, cl, 'LineWidth', lw)

    qy = -2:0.1:0;
    plot(0.6355.*qy.^2+2.2151*qy+2.3188, qy, cl, 'LineWidth', lw)
    
    %px = 0:0.1:Slim*2;
    %plot(px, px*K1lim+F0*K0lim, cl, 'LineWidth', lw)
    
    plot([Pm, Pm], yl, '-r', 'LineWidth', lw)
    plot(Pe,Qe, 'ok', 'LineWidth', 1.2)
    plot(Pe,Qe, '+k', 'LineWidth', 1)
    
    xlim(xl)
    ylim(yl)
    %grid
    pbaspect([1 1 1])
    hold off
    
    drawnow
    pause(dt)
    
    gcount=0;
    
    
    end




t0 = t;

   shg
   

   if CLOSE
       %save(['tq',num2str(x_r) ,'.mat'],'g');
       break;
   end
end
close all;
%if START
%graf_torque
%end
function []=plot_estator(thref, de, cor_abc, Nesp)

   alpha = 2*pi/3;

   dth = 2*pi/299;
   th = 0:dth:2*pi;
   
   % raio rotor .875
   plot(cos(th)'*[.91 1.2]*de,sin(th)'*[.925 1.2]*de,'-k','LineWidth',3)
   
   %plot(cos(th)'*[0.5, 1, 1.5],sin(th)'*[0.5, 1, 1.5],':k','LineWidth',0.2)
   
   %arc = 2*pi/3;
   %thr = -arc/2:dth:arc/2;
   %thr = [thr, pi+thr, thr(1)];
   %plot(cos(thr)'*[.875]*de,sin(thr)'*[.875]*de,'-k','LineWidth',3)
   
   axis([-1, 1, -1, 1]*2.5)
   pbaspect([1 1 1])

   thref = thref-pi/(Nesp*3)*(Nesp/2-1/2);
   
   for k=1:Nesp
   
       
   plot(real(exp(-1i*(alpha+pi/2+thref)))*[-de,de],imag(exp(-1i*(alpha+pi/2+thref)))*[-de,de],'o','Color', cor_abc(2),'MarkerSize',25,'LineWidth',3)
   plot(real(exp(-1i*(alpha+pi/2+thref)))*[de],imag(exp(-1i*(alpha+pi/2+thref)))*[de],'x','Color', cor_abc(2),'MarkerSize',18,'LineWidth',3)
   plot(real(exp(-1i*(alpha+pi/2+thref)))*[-de],imag(exp(-1i*(alpha+pi/2+thref)))*[-de],'o','Color', cor_abc(2),'MarkerSize',3,'LineWidth',3)
   
   plot(real(exp(-1i*(-alpha+pi/2+thref)))*[-de,de],imag(exp(-1i*(-alpha+pi/2+thref)))*[-de,de],'o','Color', cor_abc(3),'MarkerSize',25,'LineWidth',3)
   plot(real(exp(-1i*(-alpha+pi/2+thref)))*[de],imag(exp(-1i*(-alpha+pi/2+thref)))*[de],'x','Color', cor_abc(3),'MarkerSize',18,'LineWidth',3)
   plot(real(exp(-1i*(-alpha+pi/2+thref)))*[-de],imag(exp(-1i*(-alpha+pi/2+thref)))*[-de],'o','Color', cor_abc(3),'MarkerSize',3,'LineWidth',3)
   
   plot(real(exp(-1i*(pi/2+thref)))*[-de,de],imag(exp(-1i*(pi/2+thref)))*[-de,de],'o','Color', cor_abc(1),'MarkerSize',25,'LineWidth',3)
   plot(real(exp(-1i*(pi/2+thref)))*[de],imag(exp(-1i*(pi/2+thref)))*[de],'x','Color', cor_abc(1),'MarkerSize',18,'LineWidth',3)
   plot(real(exp(-1i*(pi/2+thref)))*[-de],imag(exp(-1i*(pi/2+thref)))*[-de],'o','Color', cor_abc(1), 'MarkerSize',3,'LineWidth',3)

   thref = thref+pi/(3*Nesp);
   
   end
   
   
   
   
   
   
   
   
   
end
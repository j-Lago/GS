function []=plot_rotor(thref, thm, dr, cor_abc)

   %alpha = 2*pi/3;
   thm = -thm;
   
   dth = 2*pi/299;
   th = 0:dth:2*pi;
   
   arc = 2*pi/3;
   thr = -arc/2-thref-thm:dth:arc/2-thref-thm;
   thr = [thr, pi+thr, thr(1)];
   plot(cos(thr)'*[1.04]*dr,sin(thr)'*[1.04]*dr,'-k','LineWidth',3)
   
   %plot(real(exp(-1i*(pi/2+thm+alpha+thref)))*[-dr,dr],imag(exp(-1i*(pi/2+thm+alpha+thref)))*[-dr,dr],'o', 'Color', cor_abc(2),'MarkerSize',25,'LineWidth',3)
   %plot(real(exp(-1i*(pi/2+thm+alpha+thref)))*[dr],imag(exp(-1i*(pi/2+thm+alpha+thref)))*[dr],'x', 'Color', cor_abc(2),'MarkerSize',18,'LineWidth',3)
   %plot(real(exp(-1i*(pi/2+thm+alpha+thref)))*[-dr],imag(exp(-1i*(pi/2+thm+alpha+thref)))*[-dr],'o', 'Color', cor_abc(2), 'MarkerSize',3,'LineWidth',3)
    

   %plot(real(exp(-1i*(pi/2+thm-alpha+thref)))*[-dr,dr],imag(exp(-1i*(pi/2+thm-alpha+thref)))*[-dr,dr],'o','Color', cor_abc(3),'MarkerSize',25,'LineWidth',3)
   %plot(real(exp(-1i*(pi/2+thm-alpha+thref)))*[dr],imag(exp(-1i*(pi/2+thm-alpha+thref)))*[dr],'x','Color', cor_abc(3),'MarkerSize',18,'LineWidth',3)
   %plot(real(exp(-1i*(pi/2+thm-alpha+thref)))*[-dr],imag(exp(-1i*(pi/2+thm-alpha+thref)))*[-dr],'o','Color', cor_abc(3),'MarkerSize',3,'LineWidth',3)

   plot(real(exp(-1i*(pi/2+thm+thref)))*[-dr,dr],imag(exp(-1i*(pi/2+thm+thref)))*[-dr,dr],'o','Color', cor_abc(1),'MarkerSize',25,'LineWidth',3)
   plot(real(exp(-1i*(pi/2+thm+thref)))*[dr],imag(exp(-1i*(pi/2+thm+thref)))*[dr],'x', 'Color', cor_abc(1),'MarkerSize',18,'LineWidth',3)
   plot(real(exp(-1i*(pi/2+thm+thref)))*[-dr],imag(exp(-1i*(pi/2+thm+thref)))*[-dr],'o','Color', cor_abc(1),'MarkerSize',3,'LineWidth',3)
   
end
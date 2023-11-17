function [phi]=plot_cge(thref, ie, de, cor_abc, only_res, alpha, MAGAXIS)

   %alpha = 2*pi/3;
   linha = 5;
   thref=-thref;
   
   phi(1)=ie(1);
   phi(2)=ie(2)*exp(1i*(+alpha));
   phi(3)=ie(3)*exp(1i*(-alpha));
   
   phir = phi*exp(1i*thref);
   
   if MAGAXIS
       plot(real(exp(1i*(-alpha+thref)))*[-de,de],imag(exp(1i*(-alpha+thref)))*[-de,de],'--','Color', cor_abc(2),'LineWidth',linha/10)
       plot(real(exp(1i*(alpha+thref)))*[-de,de],imag(exp(1i*(alpha+thref)))*[-de,de],'--','Color', cor_abc(3),'LineWidth',linha/10)
       plot(real(exp(1i*thref))*[-de,de],imag(exp(1i*thref))*[-de,de],'--','Color', cor_abc(1),'LineWidth',linha/10)
   end
   
   if ~only_res
       plot([0 real(phir(1))],[0 imag(phir(1))],'-o','Color', cor_abc(1),'LineWidth',linha)
       plot([0 real(phir(2))],[0 imag(phir(2))],'-o','Color', cor_abc(3),'LineWidth',linha)
       plot([0 real(phir(3))],[0 imag(phir(3))],'-o','Color', cor_abc(2),'LineWidth',linha)
   end
   
   plot([0 real(sum(phir))],[0 imag(sum(phir))],'-o','Color', cor_abc(4),'LineWidth',linha)
end
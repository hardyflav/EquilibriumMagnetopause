function dfdrk_expr = dfdrk_expr(k,theta_vec, phi_vec, delta_theta, delta_phi, rk, rkp1, rkm1, rkpN, rkmN)

    Bp = 20000*10^(-9);     % Equatorial field, T
    Rp = 60280*10^3;        % Planet radius, m
    
    mu_0 = 4*pi*10^(-7);
    Pswnpa = 0.02;
    
    b0 = sqrt(2*mu_0*Pswnpa*10^(-9));   % Field scale
    r0 = (2*Bp*Rp^3/b0)^(1/3);          % Distance scale
    M = (Bp/b0)*(Rp/r0)^3;

    
% Expression of derivative with //ComplexExpand//Simplify options in Mathematica
% 
%  dfdrk_expr =  (-1/4).*rk.^(-2).*((-2).*rk.*cos(theta_vec(k))+(-1).*delta_theta.^(-1).*( ...
%   (-1).*rkmN+rkpN).*sin(theta_vec(k))+4.*rk.*(M.^2.*rk.^(-8).*((rk.*cos( ...
%   phi_vec(k))+(-1).*delta_phi.^(-1).*((-1).*rkm1+rkp1).*sin(phi_vec(k))).^2+(( ...
%   1/2).*delta_theta.^(-1).*((-1).*rkmN+rkpN).*cos(phi_vec(k))+(-1/2).* ...
%   delta_phi.^(-1).*((-1).*rkm1+rkp1).*cot(theta_vec(k)).*sin(phi_vec(k))).^2+sin( ...
%   phi_vec(k)).^2.*(rk.*cos(theta_vec(k))+(-1).*delta_theta.^(-1).*((-1).*rkmN+ ...
%   rkpN).*sin(theta_vec(k))).^2)).^(1/2))+(1/4).*rk.^(-1).*((-2).*cos( ...
%   theta_vec(k))+4.*(M.^2.*rk.^(-8).*((rk.*cos(phi_vec(k))+(-1).*delta_phi.^(-1).* ...
%   ((-1).*rkm1+rkp1).*sin(phi_vec(k))).^2+((1/2).*delta_theta.^(-1).*((-1).* ...
%   rkmN+rkpN).*cos(phi_vec(k))+(-1/2).*delta_phi.^(-1).*((-1).*rkm1+rkp1).* ...
%   cot(theta_vec(k)).*sin(phi_vec(k))).^2+sin(phi_vec(k)).^2.*(rk.*cos(theta_vec(k))+(-1).* ...
%   delta_theta.^(-1).*((-1).*rkmN+rkpN).*sin(theta_vec(k))).^2)).^(1/2)+2.* ...
%   rk.*(M.^2.*rk.^(-8).*((rk.*cos(phi_vec(k))+(-1).*delta_phi.^(-1).*((-1).* ...
%   rkm1+rkp1).*sin(phi_vec(k))).^2+((1/2).*delta_theta.^(-1).*((-1).*rkmN+ ...
%   rkpN).*cos(phi_vec(k))+(-1/2).*delta_phi.^(-1).*((-1).*rkm1+rkp1).*cot( ...
%   theta_vec(k)).*sin(phi_vec(k))).^2+sin(phi_vec(k)).^2.*(rk.*cos(theta_vec(k))+(-1).* ...
%   delta_theta.^(-1).*((-1).*rkmN+rkpN).*sin(theta_vec(k))).^2)).^(-1/2).*( ...
%   M.^2.*rk.^(-8).*(2.*cos(phi_vec(k)).*(rk.*cos(phi_vec(k))+(-1).*delta_phi.^(-1) ...
%   .*((-1).*rkm1+rkp1).*sin(phi_vec(k)))+2.*cos(theta_vec(k)).*sin(phi_vec(k)).^2.*( ...
%   rk.*cos(theta_vec(k))+(-1).*delta_theta.^(-1).*((-1).*rkmN+rkpN).*sin( ...
%   theta_vec(k))))+(-8).*M.^2.*rk.^(-9).*((rk.*cos(phi_vec(k))+(-1).*delta_phi.^( ...
%   -1).*((-1).*rkm1+rkp1).*sin(phi_vec(k))).^2+((1/2).*delta_theta.^(-1).*(( ...
%   -1).*rkmN+rkpN).*cos(phi_vec(k))+(-1/2).*delta_phi.^(-1).*((-1).*rkm1+ ...
%   rkp1).*cot(theta_vec(k)).*sin(phi_vec(k))).^2+sin(phi_vec(k)).^2.*(rk.*cos(theta_vec(k))+( ...
%   -1).*delta_theta.^(-1).*((-1).*rkmN+rkpN).*sin(theta_vec(k))).^2)));


% Expression of derivative with //Simplify option in Mathematica

dfdrk_expr = (1/4).*delta_theta.^(-1).*rk.^(-2).*((-1).*rkmN+rkpN).*sin(theta_vec(k))+ ...
  (1/2).*(2.*M.^2.*rk.^(-8).*cos(phi_vec(k)).*(rk.*cos(phi_vec(k))+(-1).* ...
  delta_phi.^(-1).*((-1).*rkm1+rkp1).*sin(phi_vec(k)))+(-8).*M.^2.*rk.^(-9) ...
  .*(rk.*cos(phi_vec(k))+(-1).*delta_phi.^(-1).*((-1).*rkm1+rkp1).*sin( ...
  phi_vec(k))).^2+(-8).*M.^2.*rk.^(-9).*((1/2).*delta_theta.^(-1).*((-1).* ...
  rkmN+rkpN).*cos(phi_vec(k))+(-1/2).*delta_phi.^(-1).*((-1).*rkm1+rkp1).* ...
  cot(theta_vec(k)).*sin(phi_vec(k))).^2+2.*M.^2.*rk.^(-8).*cos(theta_vec(k)).*sin( ...
  phi_vec(k)).^2.*(rk.*cos(theta_vec(k))+(-1).*delta_theta.^(-1).*((-1).*rkmN+ ...
  rkpN).*sin(theta_vec(k)))+(-8).*M.^2.*rk.^(-9).*sin(phi_vec(k)).^2.*(rk.*cos( ...
  theta_vec(k))+(-1).*delta_theta.^(-1).*((-1).*rkmN+rkpN).*sin(theta_vec(k))) ...
  .^2).*(M.^2.*rk.^(-8).*(rk.*cos(phi_vec(k))+(-1).*delta_phi.^(-1).*((-1) ...
  .*rkm1+rkp1).*sin(phi_vec(k))).^2+M.^2.*rk.^(-8).*((1/2).*delta_theta.^( ...
  -1).*((-1).*rkmN+rkpN).*cos(phi_vec(k))+(-1/2).*delta_phi.^(-1).*((-1).* ...
  rkm1+rkp1).*cot(theta_vec(k)).*sin(phi_vec(k))).^2+M.^2.*rk.^(-8).*sin(phi_vec(k)) ...
  .^2.*(rk.*cos(theta_vec(k))+(-1).*delta_theta.^(-1).*((-1).*rkmN+rkpN).* ...
  sin(theta_vec(k))).^2).^(-1/2);


end
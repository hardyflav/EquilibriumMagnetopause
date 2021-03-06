function [F_values, Jacobian] = F_valuesJacobian_Numerical(r, r_eq, r_mer, rss, Max_deg_equ, Max_deg_phi_direction, delta_theta_deg, delta_phi_deg, Nb_points_grid, SystemParameters, epsilon)

    beta = SystemParameters.beta;
    F_values = ones(Nb_points_grid, 1);
    
    for k = 1:Nb_points_grid

          F_values(k) = PB_Cartesian( k, r, rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters );
          
    end

    Jacobian =  NumericalJacobian(Max_deg_equ, Max_deg_phi_direction, delta_theta_deg, delta_phi_deg, r, rss, r_eq, r_mer, SystemParameters, epsilon);

end

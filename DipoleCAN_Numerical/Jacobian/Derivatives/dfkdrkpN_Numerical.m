
function dfkdrkpN_Numerical = dfkdrkpN_Numerical(k,Max_deg_equ, Max_deg_phi_direction, delta_theta, delta_phi, r, rss, r_eq, r_mer, SystemParameters, epsilon)
    
    [~, ~,...
    N_theta, N_phi,...
    ~, ~] = GridDetails(Max_deg_equ, Max_deg_phi_direction, delta_theta*180/pi, delta_phi*180/pi);

    delta_theta_deg = delta_theta*180/pi;
    delta_phi_deg = delta_phi*180/pi;

    if k==1

        dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k,  r(k), r(k+1), r_eq(2), r(k+N_phi), rss, rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
         
    elseif k==N_phi*N_theta
    
%         dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k,  r(k), r_mer(N_theta+1), r(k-1), 0, r(k-N_phi), rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
        dfkdrkpN_Numerical = 0;
        
    elseif k==N_phi
        
        dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k,  r(k), r_mer(2), r(k-1), r(k+N_phi), rss, rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
           
    elseif k==N_phi*N_theta-N_phi+1        

%         dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k,  r(k), r(k+1), r_eq(N_theta+1), 0, r(k-N_phi), rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
        dfkdrkpN_Numerical = 0;

    elseif k>N_phi*N_theta-N_phi+1 && k<N_phi*N_theta  %%% right boundary
        
%         dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k, r(k), r(k+1), r(k-1), 0, r(k-N_phi), rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
        dfkdrkpN_Numerical = 0;
        
    elseif k>1 && mod(k,N_phi)==1 && k<N_phi*N_theta-N_phi+1    %%% bottom boundary

        dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k, r(k), r(k+1), r_eq( (k-1)/N_phi+2 ), r(k+N_phi), r(k-N_phi), rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
        
    elseif k>N_phi && mod(k,N_phi)==0 && k<N_phi*N_theta  %%% upper boundary
 
        dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k, r(k), r_mer(k/N_phi+1), r(k-1), r(k+N_phi), r(k-N_phi), rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
            
    elseif k>1 && k<N_phi   %%% left boundary
        
        dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k, r(k), r(k+1), r(k-1), r(k+N_phi), rss, rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
     
    else
        
        dfkdrkpN_Numerical = dfdrkpN_expr_Numerical(k, r(k), r(k+1), r(k-1), r(k+N_phi), r(k-N_phi), rss, r_eq, r_mer, delta_theta_deg, delta_phi_deg, Max_deg_equ, Max_deg_phi_direction, SystemParameters, epsilon);
         
    end
end


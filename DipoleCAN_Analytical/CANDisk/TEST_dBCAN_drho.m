




function [dBrho_drho] = TEST_dBCAN_drho(CAN_DiskParameters, rho, z)

    maxorder = 10;
    
    a = CAN_DiskParameters.a;
    D = CAN_DiskParameters.D;
    mu0I = CAN_DiskParameters.mu0I;
    
    tmp1 = ((abs(z)-D).^2+rho.^2);
    tmp2 = ((abs(z)+D).^2+rho.^2);
    tmp3 = ((abs(z)-D).^2+a.^2);
    tmp4 = ((abs(z)+D).^2+a.^2);
            
	dBrho_ext_k = ones(1, maxorder+1);
    dBrho_int_k = ones(1, maxorder+1);
    
    for k = 0:maxorder
        
    % Exterior to the disk: Brho
        temp1 = legendre(2*k,(abs(z)-D)./sqrt(tmp1)); 
        temp2 = legendre(2*k,(abs(z)+D)./sqrt(tmp2)); 

        p1 = 0;
        p2 = 2;        
       
        dBrho_ext_k(:,k+1) = sign(z) * mu0I/2 * (                                               ...
                                                                                                ...
                         (1/2) * (-1)^k/factorial(k)^2 * (a/2)^(2*k) *                          ...
                                     (                                                          ...
                             (1/tmp1)^(2*k+1) * (-1)^p1 * factorial(2*k-p1) * temp1(p1,:)       ...
                                    -                                                           ...
                             (1/tmp2)^(2*k+1) * (-1)^p1 * factorial(2*k-p1) * temp2(p1,:)       ...
                                      )                                                         ...
                          -                                                                     ...
                                                                                                ...
                          (1/2) * (-1)^k/factorial(k)^2 * (a/2)^(2*k) *                         ...
                                     (                                                          ...
                             (1/tmp1)^(2*k+1) * (-1)^p2 * factorial(2*k-p2) * temp1(p2,:)       ...
                                    -                                                           ...
                             (1/tmp2)^(2*k+1) * (-1)^p2 * factorial(2*k-p2) * temp2(p2,:)       ...
                                      )                                                         ...
                                                );
                                            
    % Interior to the disk: Brho
        temp3 = legendre(2*k,(D-z)./sqrt(tmp3)); 
        temp4 = legendre(2*k,(D+z)./sqrt(tmp4)); 

        p3 = 0;
        p4 = 2;        
       
        dBrho_int_k(:,k+1) =          mu0I/2 * (                                                ...
                                                                                                ...
                         (1/2) * (-1)^k/factorial(k)^2 * (rho/2)^(2*k) *                        ...
                                     (                                                          ...
                             (1/tmp3)^(2*k+1) * (-1)^p3 * factorial(2*k-p3) * temp3(p3,:)       ...
                                    -                                                           ...
                             (1/tmp4)^(2*k+1) * (-1)^p3 * factorial(2*k-p3) * temp4(p3,:)       ...
                                      )                                                         ...
                          -                                                                     ...
                                                                                                ...
                         (1/2) * (-1)^k/factorial(k)^2 * (rho/2)^(2*k) *                        ...
                                     (                                                          ...
                             (1/tmp3)^(2*k+1) * (-1)^p4 * factorial(2*k-p4) * temp3(p3,:)       ...
                                    -                                                           ...
                             (1/tmp4)^(2*k+1) * (-1)^p4 * factorial(2*k-p4) * temp4(p3,:)       ...
                                      )                                                         ...
                                               );          
                                           
    % Exterior to the disk: Bz

        p5 = 1;
       
        dBrz_ext_k(:,k+1) =            mu0I/2 * (-2)* (                                         ...
                                                                                                ...
                         (1/2) * (-1)^k/factorial(k)^2 * (a/2)^(2*k) *                          ...
                                      (                                                         ...
                             (1/tmp1)^(2*k+1) * (-1)^p5 * factorial(2*k-p5) * temp1(p5,:)       ...
                                    -                                                           ...
                             (1/tmp2)^(2*k+1) * (-1)^p5 * factorial(2*k-p5) * temp2(p5,:)       ...
                                      )                                                         ...
                                                        ...
                                                );     
                                            
    % Interior to the disk: Bz
                              
    
    
    
    end
   
     

    dBrho_ext = sum(dBrho_ext_k,2);
    dBrho_int = sum(dBrho_int_k,2);
    dBrho_drho = dBrho_int.' * (rho<=a) + dBrho_ext.' * (rho>a);
    
end
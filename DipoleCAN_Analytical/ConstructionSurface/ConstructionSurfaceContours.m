function ConstructionSurfaceContours = ConstructionSurfaceContours(Array, theta_span, phi_span)


angles_x = arrayfun(@sin, theta_span(1:end) ).'*arrayfun(@cos,  phi_span(1:end) );
angles_y = arrayfun(@sin, theta_span(1:end) ).'*arrayfun(@sin, phi_span(1:end) );
angles_z = arrayfun(@cos, theta_span(1:end) ).'*ones(1,size(phi_span,2));

X = Array .* angles_x;
Y = Array .* angles_y;
Z = Array .* angles_z;

%% Surface

    hold on

      C = Z;

      P1 = surf(Z, X, Y, C,'FaceAlpha', 0.3);
      P2 = surf(Z, X, -Y, C,'FaceAlpha', 0.3);
      P3 = surf(Z, -X, Y, C,'FaceAlpha', 0.3);
      P4 = surf(Z, -X, -Y, C,'FaceAlpha', 0.3);

      set(P1, 'EdgeColor', 'None', 'FaceColor', 'interp');  
      set(P2, 'EdgeColor', 'None', 'FaceColor', 'interp');  
      set(P3, 'EdgeColor', 'None', 'FaceColor', 'interp');  
      set(P4, 'EdgeColor', 'None', 'FaceColor', 'interp');  

%% Planet and Magnetic Moment

    Bp = 20000*10^(-9);     % Equatorial field, T
    Rp = 60280*10^3;        % Planet radius, m
    mu_0 = 4*pi*10^(-7);
    Pswnpa = 0.02;
    b0 = sqrt(2*mu_0*Pswnpa*10^(-9));   % Field scale
    r0 = (2*Bp*Rp^3/b0)^(1/3);          % Distance scale

    RpScaled = Rp/r0;
    [Xs, Ys, Zs] = sphere;
    Planet = surf(RpScaled*Xs, RpScaled*Ys, RpScaled*Zs);

    set(Planet,'FaceColor',[0.800    0.6000    0.4000],...
              'FaceAlpha', 1,...
              'LineStyle','none');
          
    Arrow = mArrow3([0, 0, 1/3],[0, 0, -1/3],'color','red','stemWidth', 0.01);
    set (Arrow, 'FaceAlpha', 0.4)
    
    
    
%% Plot options
    
        axes = gca;
        set(axes, 'FontName'   , 'Helvetica',...
                  'XAxisLocation', 'bottom',...
                  'YAxisLocation', 'origin',...
                  'FontSize', 16,...
                  'LineWidth'   , 1 ...
              );
        Ylabel = ylabel('X (r_0)');
        Xlabel = xlabel('Z (r_0)');  
        Zlabel = zlabel('Y (r_0)');  
        
        set([Xlabel, Ylabel, Zlabel], 'FontName'   , 'AvantGarde', 'FontSize', 18);
        axis equal
        grid on
        box on
        set(gcf,'color','w')    
    
        
%% Plot contours

% For corrected surface -> Add contours
    Delta = 1;
    Opacity = 0.2;
    for k = 1:Delta:size(theta_span, 2)

        Xc = X(k, :);
        Yc = Y(k, :);
        Zc = Z(k,:);
        p1 = plot3(Zc, Xc, Yc, '-k', 'LineWidth', 0.5);
        p2 = plot3(Zc, -Xc, Yc, '-k', 'LineWidth', 0.5);
        p3 = plot3(Zc, Xc, -Yc, '-k', 'LineWidth', 0.5);
        p4 = plot3(Zc, -Xc, -Yc, '-k', 'LineWidth', 0.5);

        p1.Color(4) = Opacity;
        p2.Color(4) = Opacity;
        p3.Color(4) = Opacity;
        p4.Color(4) = Opacity;

    end

hold off
end


function [] = spline_C2(P, rep, resolution)
  n = size(P, 2)-2;
  A = zeros(n+2);
  for (i=2:n+1)
    A(i, i) = 4;
    A(i, i-1) = 1;
    A(i, i+1) = 1;
  endfor
  A(1, 1) = 2;
  A(1, 2) = 1;
  A(n+2, n+1) = 1;
  A(n+2, n+2) = 2;
  X = 3*(P(1,3:n+2)-P(1,1:n))';
  X = [3*(P(1,2)-P(1,1)); X; 3*(P(1,n+2)-P(1,n+1))];
  T1 = A\X;
  Y = 3*(P(2,3:n+2)-P(2,1:n))';
  Y = [3*(P(2,2)-P(2,1)); Y; 3*(P(2,n+2)-P(2,n+1))];
  T2 = A\Y;
  T = [T1'; T2'];
  taille = size(P, 2);
  for j=0:taille-2
          pt_cont = calcul_b(P(:,j+1), P(:, j+2), T(:, j+1), T(:, j+2));
          if (rep == 1)
              plot(pt_cont(1,:), pt_cont(2,:), 'k', 'linewidth',2);
          endif
          Bezier_curve_points = eval_deCasteljau(pt_cont,j,j+1,resolution);
          plot(Bezier_curve_points(1,:),Bezier_curve_points(2,:),'g', 'linewidth',2);
       end
endfunction

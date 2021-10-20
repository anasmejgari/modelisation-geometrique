function [Lagrange_points] = eval_aitken(P, T, resolution)
   n = size(P, 2)-2;
   temps = T(1):(-T(1)+T(n+2))/resolution:T(n+2);
   P_copy = P;
   Lagrange_points = [];
   for t=temps
     P = P_copy;
     for k=0:n
       for i=0:n-k
          P(:,i+1) = ((T(i+k+2)-t)*P(:, i+1)+(t-T(i+1))*P(:, i+2))/(T(i+k+2)-T(i+1));
       endfor
       P = P(:, 1:n-k+1);
     endfor
     Lagrange_points = [Lagrange_points P(:,1)];
    endfor
    plot(Lagrange_points(1,:), Lagrange_points(2,:), 'r', 'linewidth', 2);
endfunction

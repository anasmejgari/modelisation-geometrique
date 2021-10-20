function [T] = tangente_extrem_2(P, U, c)
   N = size(U)(2);
   T = zeros(2, N);
   T(:, 1) = (1-c)*(-3*P(:,1)+4*P(:,2)-P(:, 3))/(U(3)-U(1));
   T(:, N) = (1-c)*(-3*P(:,N)+4*P(:,N-1)-P(:, N-2))/(U(N-2)-U(N));
   for(i=2:N-1)
      T(:, i) = (1-c)*(P(:,i-1)-P(:,i+1))/(U(i-1)-U(i+1));
   end

end
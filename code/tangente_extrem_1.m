function [T] = tangente_extrem_1(P, U, c)
   N = size(U)(2);
   T = zeros(2, N);
   T(:, 1) = (1-c)*(P(:,2)-P(:,1))/(U(2)-U(1));
   T(:, N) = (1-c)*(P(:,N-1)-P(:,N))/(U(N-1)-U(N));
   for(i=2:N-1)
      T(:, i) = (1-c)*(P(:,i-1)-P(:,i+1))/(U(i-1)-U(i+1));
   end

end
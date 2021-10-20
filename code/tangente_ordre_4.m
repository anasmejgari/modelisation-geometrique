function [T] = tangente_ordre_4(P, U, c)
   N = size(U)(2);
   T = zeros(2, N);
   T(:, 1) = (1-c)*(-3*P(:,1)+4*P(:,2)-P(:, 3))/(U(3)-U(1));
   T(:, 2) = (1-c)*(P(:,3)-P(:, 1))/(U(3)-U(1));
   T(:, N-1) = (1-c)*(P(:,N)-P(:, N-2))/(U(N)-U(N-2));
   T(:, N) = (1-c)*(-3*P(:,N)+4*P(:,N-1)-P(:, N-2))/(U(N-2)-U(N));
   for(i=3:N-3)
      T(:, i) = (1-c)*(P(:,i-2)-8*P(:,i-1)+8*P(:,i+1)-P(:, i+2))/12*(U(i+1)-U(i));
   end
endfunction

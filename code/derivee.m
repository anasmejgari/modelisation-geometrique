function [dB] = derivee(B, a, b)
     n = size(B, 2)-1;
     dB = zeros(2, n);
     for i=1:n
        dB(:,i) = n*(B(:,i+1)-B(:, i))/(b-a);
     end
end
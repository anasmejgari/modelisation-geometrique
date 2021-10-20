function [b] = calcul_b(P1, P2, m1, m2)
  b = [P1 P1+m1/3 P2-m2/3 P2];
end
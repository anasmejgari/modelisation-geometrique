function [C] = courbure(matrice, a, b, resolution)
     temps = a:(b-a)/resolution:b;
     C = zeros(1, length(temps));
     derivee_1 = derivee(matrice, a, b);
     derivee_2 = derivee(derivee_1, a, b);
     x_prime = eval_deCasteljau(derivee_1, a, b, resolution);
     x_2prime = eval_deCasteljau(derivee_2, a, b, resolution);
     for i=1:size(x_prime, 2)
        prod_vect = abs(x_prime(1,i)*x_2prime(2,i)-x_prime(2,i)*x_2prime(1,i));        
        norme = (sum(x_prime(:,i).^2))**(3/2);
        C(i) = prod_vect/norme;
     end
end
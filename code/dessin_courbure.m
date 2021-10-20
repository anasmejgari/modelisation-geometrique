function [] = dessin_courbure(P, U, c);
    M_4 = tangente_ordre_4(P, U, c);
    N = length(U);
    clf
    title("Dessin de la fonction de courbure"); 
    for i=1:N-1  
        matrice = calcul_b(P(:,i), P(:,i+1), M_4(:,i), M_4(:, i+1));
        C = courbure(matrice, U(i), U(i+1), 100);
        plot(U(i):(U(i+1)-U(i))/100:U(i+1), C, 'b' , 'linewidth',2);
        hold on
    end
    hold off
    
end
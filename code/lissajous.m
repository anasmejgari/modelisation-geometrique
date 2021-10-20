function [] = lissajous(resolution)
      clf                  % affichage d'une fenetre vide
      hold on              % tous les plot seront excuts sur cette meme fenetre
      axis([0 10 0 10])
      temps = -pi:2*pi/resolution:pi;
      const = 0:0.2:5;
      matrice = zeros(2, length(const)*length(temps))
      for j=1:length(const)
        for i=1:length(temps)
          matrice(1,(j-1)*length(const)+i) = const(j)*sin(2*temps(i))+5;
          matrice(2,(j-1)*length(const)+i) = const(j)*sin(3*temps(i))+5;
        end
      end
      taille = size(matrice, 2);
      m = tangente_ordre_4(matrice, 0:taille-1, 0);
      for j=0:taille-2
          pt_cont = calcul_b(matrice(:,j+1), matrice(:, j+2), m(:, j+1), m(:, j+2));
          Bezier_curve_points = eval_deCasteljau(pt_cont,j,j+1,resolution);
          plot(Bezier_curve_points(1,:),Bezier_curve_points(2,:),'b', 'linewidth',2);
      end
endfunction

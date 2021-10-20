function [Bezier_curve_points]= eval_deCasteljau(matrice,a,b,resolution)
  n=size(matrice,2)-1; % degre de courbe avec n+1 points de controle
  %temps=1:resolution;
  temps= a : ((b-a)/resolution) : b;
  cp = 0;
  Bezier_curve_points = [];
  matrice_copie = matrice;
  for t=temps
     % Calcul du point de la courbe x(t) avec l'algorithme de DeCasteljau
     matrice = matrice_copie;
    for k=1:n
      for i=0:n-k
         matrice(:, i+1) = (matrice(:, i+1)*(b-t)+ (t-a)*matrice(:, i+2))/(b-a);      
      end
      matrice = matrice(:, 1:n+1-k); 
    end
    Bezier_curve_points = [matrice(:, 1) Bezier_curve_points];
  end 

end
function []= Courbe_spline()

resolution=50;       % nombre de points evalues sur la courbe de Bezier
K=0;                 % variable d'etat
matrice=0;           % ensemble des points de controle

prompt = 'Entrez la valeur du paramètre de tension c: ';
c = input(prompt);
prompt_2 = 'Voudriez vous afficher le polygone de controle (Tapez 1 pour oui et 0 pour non): ';
rep = input(prompt_2);

prompt_3 = "Voulez vous faire un dessin pour l'interpolation de Larange aussi (Tapez 1 pour oui et 0 pour non): ";
lag = input(prompt_3);

prompt_4 = "Voulez vous faire un dessin pour les splines d'Hermite C2 aussi (Tapez 1 pour oui et 0 pour non): ";
spc2 = input(prompt_4);

while K~=2 % arrter
   K=menu('Que voulez-vous faire ?','NEW   (bouton souris, puis <ENTER>','ARRETER')
   if K==1 % NEW
      clf                  % affichage d'une fenetre vide
      hold on              % tous les plot seront excuts sur cette meme fenetre
      axis([0 10 0 10])    % les axes sont definitivement fixes
      %axis off
      matrice=0;
    %  title('Courbe pour c = 0.5');
      for i=1:1000         % on limite le nombre de points de controle  1000
         [X,Y]=ginput(1);  % prise en compte d'un clic de souris
         if isempty(X)     % si on appuie sur <ENTER>
            break
         end
   
        matrice(1,i)=X;   % coordonnees x des points de controle
        matrice(2,i)=Y;   % coordonnees y des points de controle
        plot(matrice(1,i),matrice(2,i), 'ob') % affichage du point de controle i
      end
      hold on
      taille = size(matrice, 2);
      
     %plot(matrice(1,:),matrice(2,:),'b');
      m = tangente_ordre_4(matrice, 0:taille-1, c);
      for j=0:taille-2
          pt_cont = calcul_b(matrice(:,j+1), matrice(:, j+2), m(:, j+1), m(:, j+2));
          if (rep == 1)
              plot(pt_cont(1,:), pt_cont(2,:), 'k', 'linewidth',2);
          endif

          Bezier_curve_points = eval_deCasteljau(pt_cont,j,j+1,resolution);
          plot(Bezier_curve_points(1,:),Bezier_curve_points(2,:),'b', 'linewidth',2);
       end
      if lag == 1  
          eval_aitken(matrice, 0:taille, resolution);
      end
      
      if spc2 == 1
        spline_C2(matrice, rep, resolution);
      end
end
end
close

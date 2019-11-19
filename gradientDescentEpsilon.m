function [trazap,trazav,trazad, i] = gradientDescentEpsilon(point, K, max_iter, epsilon)
  
  for i = 1:max_iter
    # Insertamos en la traza el punto y el valor de ese punto
    trazap(:,i) = point';
    trazav(i) = 10*(point(2) - point(1)^(2))^(2) + (1 - point(1))^(2);
    # Calculamos las derivadas respecto a 'x' e 'y'
    dx = 2*(20*point(1)^(3) - 20*point(1)*point(2)+point(1)-1);
    dy = 20*(point(2) - point(1)^(2));
    d = [dx,dy];
    trazad(i,:) = d;
    # Realizamos el descenso por gradiente
    point = point - (K/i)*d;
    dif = norm(trazap(:,i)' - point, 2);
    if(epsilon > dif)
      break;
    endif
  endfor

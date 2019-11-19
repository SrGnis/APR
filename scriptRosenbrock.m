function [resp,resk,dist] = scriptRosenbrock(ini,step,point,max_iter,epsilon)
  l = 1;
  for K = ini:-step:0+step
    [p,_,_,i] = gradientDescentEpsilon(point,K,max_iter,epsilon);
    resp(l,:) = p(:,end)';
    resk(l) = K;
    dist(l) = norm(p(:,end)' - [1,1], 2);
    l = l+1;
  endfor
  resk = resk';
  dist = dist';
  [dist,p] = sort(dist);
  resk = resk(p,:);
  resp = resp(p,:);
  longitud = size(dist);
  for x = 1:longitud(1,1)
    disp("a");
    if(isnan(dist(x)) == 1)
      dist = dist([1:x-1]);
      resk = resk([1:x-1]);
      resp = resp([1:x-1],:);
      break;
    endif
  endfor
  
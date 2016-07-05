function model = train_eldm(x , y, C ,nh ,lambda1 ,lambda2,fun)
    m = size( x , 1 ) ;
    x = [ ones(m,1) x ] ;
    g = activate_fun(fun);%¼¤»îº¯Êý
    W = 2*rand(size(x,2),nh)-1;%ÊäÈëÈ¨ÖØ
    H = g(x*W);%Òþ²Ø½áµãµÄÊä³ö
    mul = size(y,2)>1;
    k1 = 4* lambda2/(C*m) +1;
    k2 = 4*lambda2/(C*m);
    k3 = lambda1/(C*m) +1;
    if ~mul
    u = H' * y ;
    v = H' * H ;
    beta = ( speye( size( H , 2 ) )/C +k1*v- (k2/m)* (u*u') ) \ ( k3* u );
    else
      m = size(y,2);
      beta= zeros(size(H,2),m);
      y = 2*y-1;
      hh = H'*y;
      U = inv(k1*(H'*H) + speye(size(H,2))/C );
      v =  U*hh;
      for i =1:m
          hi = hh(:,i);
          vi = v(:,i);
          beta(:,i) = (U+(k2/m)*(vi*vi')/(1-(k2/m)*hi'*U*hi))*(k3*hi);

      end
    end
    model.W1   = W ;
    model.beta = beta ; 
    model.g = g ;

end


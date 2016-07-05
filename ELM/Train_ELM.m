function [ modelELM ] = Train_ELM( X,Y,n_h,C,fun)

        X = [ ones(size(X,1),1),X];
        
        g  = activate_fun(fun);
       
        [~,nv] = size(X);
        
        W1 =-1 +2*rand(nv,n_h);
        
        H = g(X * W1);
        if size(Y,2)>1
          Y = 2*Y-1;
        end
        
       if n_h < size(X,1)
        beta = (H'*H+(1/C)* speye(size(H,2)))\(H' * Y);
       else 
        beta =  H'*(((H*H')+(1/C)* speye(size(H,1)))\(Y));
       end

       modelELM.W1 = W1;
       modelELM.beta = beta;
       modelELM.g = g      ;
end


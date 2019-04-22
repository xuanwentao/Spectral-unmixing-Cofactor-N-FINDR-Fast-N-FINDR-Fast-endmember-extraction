function [loc,Dis_minus] = NFINDR(PCA_img,M,MaxIter,Np,M_img)
for r = 1:MaxIter
ind = unidrnd(Np, 1,M);
E   = ones(M);
E(2:end,:) = PCA_img(ind,:)';
dentor = factorial(M-1);
V_max  = abs(det(E))/dentor;
for i = 1:M  
    i_max = ind(i);
    for j = 1:Np  
        E(2:end,i) = PCA_img(j,:)';
        V = abs(det(E))/dentor;
        k = V>V_max;
        i_max(k) = j;
        V_max(k) = V;
    end
    E(2:end,i) = PCA_img(i_max,:)';
    ind(i) = i_max;
end
loc(r,:) = ind;
end
[Dis_minus] = Find_End(MaxIter,M_img,loc);
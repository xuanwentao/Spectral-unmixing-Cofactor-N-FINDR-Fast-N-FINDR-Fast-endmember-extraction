function [loc,Dis_minus] =  Cofactor_NFINDR(PCA_img,M,MaxIter,M_img)
N_pixels = size(PCA_img,2);
PCA_img =[ones(1,N_pixels); PCA_img];
ind = [46 1258 4775 1696];
loc = zeros(MaxIter,M);
for j = 1:MaxIter 
    E = PCA_img(:,ind);
    for i = 1:M
        D = det(E)*inv(E);
        A = D(i,:)*PCA_img;
        [temp, b] = max(A,[],2);
        b = b(1);
        E(:,i) = PCA_img(:,b);       
        ind(i) = b;
    end
  loc(j,:) = ind;
end
[Dis_minus] = Find_End(MaxIter,M_img,loc);

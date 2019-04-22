function [loc,Dis_minus] =  CofactorMatrix_NFINDR(PCA_img,M,MaxIter,M_img)
N_pixels = size(PCA_img,2);
PCA_img =[ones(1,N_pixels); PCA_img];
ind = [46 1258 4775 1696];
loc = zeros(MaxIter,M);
for i = 1:MaxIter 
    E = PCA_img(:,ind);
    D = det(E)*inv(E);    
    [temp, ind] = max(D*PCA_img,[],2); 
    loc(i,:) = ind;
end
[Dis_minus] = Find_End(MaxIter,M_img,loc);


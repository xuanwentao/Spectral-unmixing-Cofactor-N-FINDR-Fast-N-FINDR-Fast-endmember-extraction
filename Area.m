function[area,abu]=Area(min_angle_cou,M_img,M,Lab,Np,PCA_img)
E  = ones(M);
E(2:end,:) = PCA_img(Lab,:)';
C = zeros(M,Np);% abundance
for i = 1:Np
    p = double([1; PCA_img(i,:)']);
    C(:,i) = lsqnonneg(E, p);
end
abu=C(min_angle_cou,:);% Green algae abundance
area=sum(abu)*250000;% Green algae area

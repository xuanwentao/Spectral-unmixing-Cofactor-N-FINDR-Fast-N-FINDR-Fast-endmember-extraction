function [Dis_minus] = Find_End(MaxIter,M_img,loc)
%%
Dis = zeros(1,MaxIter);
for i = 1:MaxIter
Dis(i) = norm(M_img(loc(i,1),:))+norm(M_img(loc(i,2),:))+norm(M_img(loc(i,3),:))+norm(M_img(loc(i,4),:));
end 
c = Dis';
Dis_minus = zeros(MaxIter,1);
for i = 2:MaxIter
    Dis_minus(i) = c(i,:)-c(i-1,:);
end
Dis_minus = abs(Dis_minus);
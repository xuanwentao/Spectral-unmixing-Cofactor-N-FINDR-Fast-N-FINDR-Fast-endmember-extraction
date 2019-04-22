function [min_angle_cou,min_angle,angle] =  SAM(M_img,Lab)
E_sp=M_img(Lab,:);% endmember spectrum matrix
R_sp=load('standard spectrum.txt');%reference spectrum
ER=E_sp*R_sp;
S_E_sp=sum(E_sp,2);
S_R_sp=sum(R_sp,1);
RS_E_sp=1./S_E_sp;
RS_R_sp=1./S_R_sp;
KRS_E_sp=sqrt(RS_E_sp);
KRS_R_sp=sqrt(RS_R_sp);
fz=KRS_E_sp*KRS_R_sp;
cos=ER./fz;
angle=acos(cos);
[min_angle,min_angle_cou]=min(angle(:));


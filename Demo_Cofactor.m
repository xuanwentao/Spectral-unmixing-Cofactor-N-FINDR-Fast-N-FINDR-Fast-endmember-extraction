clear all
clc;
tic;
load('data');
MaxIter = 100;M = 4; % MaxIter:Number of epochs; M: Endmember number;
%% endmember extraction  
[loc,Dis_minus] =  Cofactor_NFINDR(PCA_img',M,MaxIter,M_img);
%[loc,Dis_minus] = CofactorMatrix_NFINDR(PCA_img',M,MaxIter,M_img);
%[loc,Dis_minus] = NFINDR(PCA_img,M,MaxIter,Np,M_img);
%% spectral angle mapping
Lab = loc(end,:);
[min_angle_cou,min_angle,angle] = SAM(M_img,Lab);
%% Area
[area,abu]=Area(min_angle_cou,M_img',M,Lab,Np,PCA_img);
%% The visualization result
V_img=reshape(abu,Nx,Ny,1);
imshow(V_img);
toc;
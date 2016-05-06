close all; clear all;

% Read the data
file1 = 'circle3d_1.txt';
file2 = 'circle3d_2.txt';
sData1 = dlmread(file1);
sData2 = dlmread(file2);

%Subtract the centroids so that both the spheres will have their centroid
%at the origin
sData1 = bsxfun(@minus,sData1,mean(sData1));
sData2 = bsxfun(@minus,sData2,mean(sData2));

% Plot the "before" data
figure(1); subplot(1,2,1);
plot3(sData1(:,1), sData1(:,2), sData1(:,3),'co');
hold on; 
plot3(sData2(:,1), sData2(:,2), sData2(:,3),'r.');
axis equal
title('Unaligned 3D circles')

% Now perform the PCA. R1 and R2 are the rotation matrices
R1 = pca(sData1); 
R2 = pca(sData2); 

% Do a matrix multiplication of the data with its rotational matrix to get
% a new matrix
sData1R = sData1*R1;
sData2R = sData2*R2;

%Plot the new matrix
figure(1); subplot(1,2,2);
plot3(sData1R(:,1), sData1R(:,2), sData1R(:,3),'co');
hold on; 
plot3(sData2R(:,1), sData2R(:,2), sData2R(:,3),'r.');
axis equal
title('3D circles aligned using PCA')
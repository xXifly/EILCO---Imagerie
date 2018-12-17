clc; 
clear all; 
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% TP1 : Segmentation d'images couleur sous Matlab %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Partie 1

I = imread('POM_COUL.TIF');

% On décompose l'image en 3 images composants (monochrome)
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);


BW1 = im2bw(R,200/255);
BW1bis = (R >= (200));

BW2 = im2bw(G,115/255);

BW = or(BW1,BW2);
BWbis = ( (R >= 200) | (G >= 115) );


% On affiche les histogrammes de ces 3 composantes
figure;
subplot(5,3,1); imshow(I);
title('Image originelle');
subplot(5,3,3); imshow(I);
title('Image originelle');
subplot(5,3,4); imshow(R);
title('Composante rouge');
subplot(5,3,5); imhist(R);
title('Histogramme');
subplot(5,3,6); imshow(BW1);
title('Binarisation à 200');
subplot(5,3,7); imshow(G);
title('Composante verte');
subplot(5,3,8); imhist(G);
title('Histogramme');
subplot(5,3,9); imshow(BW2);
title('Binarisation à 115');
subplot(5,3,10); imshow(B);
title('Composante bleue');
subplot(5,3,11); imhist(B);
title('Histogramme');
subplot(5,3,15); imshow(BW);
title('Image Binarisée');
impixelinfo;

%%% Partie 2

I = imread('POMMES.TIF');

figure; imshow(I);

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

figure;
subplot(3,2,1);
imshow(R);
subplot(3,2,2);
imhist(R);

subplot(3,2,3);
imshow(G);
subplot(3,2,4);
imhist(G);

subplot(3,2,5);
imshow(B);
subplot(3,2,6);
imhist(B);

pReJ = (R >= 215);
pJeV = (G >= 215);
pJ = (pReJ & pJeV);
pR = pReJ - pJ;
pV = pJeV - pJ;

fReJ = ((R >= 115) & (R <= 145));
fJeV = ((G >= 115) & (G <= 145));
fJ = (fReJ & fJeV);
fR = fReJ - fJ;
fV = fJeV - fJ;

J = logical(pJ - (-fJ));
R = logical(pR - (-fR));
V = logical(pV - (-fV));

figure;
subplot(3,3,1);
imshow(fJ);
subplot(3,3,2);
imshow(fR);
subplot(3,3,3);
imshow(fV);

subplot(3,3,4);
imshow(pJ);
subplot(3,3,5);
imshow(pR);
subplot(3,3,6);
imshow(pV);

subplot(3,3,7);
imshow(J);
subplot(3,3,8);
imshow(R);
subplot(3,3,9);
imshow(V);

L = zeros(size(J));
L(J) = 1;
L(R) = 2;
L(V) = 3;

figure; imshow(L,[]);

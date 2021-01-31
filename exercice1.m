image = load("LungCut.mat");
subplot(1, 2, 1);
imshow(image.Im);
subplot(1, 2, 2);
histogram(image.Im)
% Arrière plan : Partie gauche
% Poumons : Partie gauche 


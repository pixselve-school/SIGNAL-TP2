image = load("LungCut.mat");
result = regiongrowing(image.Im, 270, 350, 0.15);

subplot(1, 2, 1);
imshow(result);

image = load("LungCut2.mat");
result = regiongrowing(image.Im, 270, 350, 0.15);
subplot(1, 2, 2);
imshow(result);
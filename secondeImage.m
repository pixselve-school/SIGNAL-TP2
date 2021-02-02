clc
clear
close all

image = load("LungCut2.mat");
figure(1);
subplot(2,2,1), imshow(image.Im);
subplot(2,2,2), histo = histogram(image.Im);
minGrayLevel = 0;
maxGrayLevel = 0.5;
min = 0;
max = 1;
size = 512;
g=zeros(size,size);
for i= 1:size
    for j= 1:size
        g(i,j) = ((max - min)/(maxGrayLevel - minGrayLevel)) * (image.Im(i,j) - minGrayLevel) + min;
    end
end

subplot(2,2,3), imshow(g);
subplot(2,2,4), histogram(g);
seuil = SeuilOptimal(image.Im);
newImage = zeros(512, 512);
for i = 1:512
    for j = 1:512
        if image.Im(i, j) > seuil 
            newImage(i, j) = 0;
        else
            newImage(i, j) = 1;
        end
    end
end
figure(2);
subplot(2, 2, 1);
imshow(image.Im);

subplot(2, 2, 2);
imshow(newImage);

SE = strel('disk', 5, 8);
SE2 = strel('disk', 6, 8);
SE3 = strel('disk', 7, 8);

erodeImage = imerode(newImage, SE);

erodeImage = imdilate(erodeImage, SE2);
erodeImage = imerode(erodeImage, SE3);
subplot(2, 2, 3);
imshow(erodeImage);

region = regiongrowing(erodeImage, 250, 312, 0.5);
subplot(2, 2, 4);
imshow(region);

regionSegmen = segmentation(regionprops(region,'centroid', 'area','PixelIdxList'));
g2=ones(size,size);

sizeSeg = length(regionSegmen);
for i= 1:sizeSeg-1
    g2(regionSegmen(i)) = 0;
end

figure(3);
subplot(2, 2, 1);
imshow(g2);

[coordX, coordY] = point_ref(g2);

% On a les coordonnées d'un cube dilaté et on recentre légèrement les
% coordonnées en faisant +5
result = regiongrowing(image.Im, coordX + 5, coordY + 5, 0.15);

subplot(1, 2, 1);
imshow(result);


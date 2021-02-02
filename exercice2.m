image = load("LungCut.mat");
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

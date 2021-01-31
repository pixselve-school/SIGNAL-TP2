function [ ID ] = segmentation( stats )

% prend en argument les propri�t�s renvoy�s par la fonction regionprops et
% renvoie les indices des pixels correspondant � la r�gion contenant au
% moins N prixels et dont le centre se situe ....
N= 40;
X=256;
Y=256;
centroids = cat(1, stats.Centroid);
areas = cat(1, stats.Area);

region_id=(areas>N)&(centroids(:,1)>X)&(centroids(:,2)>Y);

ID = stats(region_id).PixelIdxList;

end



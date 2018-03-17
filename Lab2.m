
a = imread('abc.tif')
b = rgb2hsv(a)
c = imresize(a,[200 200])
subplot
imshow(b);

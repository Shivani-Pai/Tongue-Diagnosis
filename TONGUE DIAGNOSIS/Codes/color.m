colorImage = imread('kapha1.jpg');% Input image 1
colorImage1 = imread('kapha1.jpg');% Input image 2
colorImage2 = imread('kapha1.jpg');% Input image 3
redonly = colorImage; %Different variables so that they do not over-write
redonly1 = colorImage1;
redonly2= colorImage2;


redonly(:,:,[2 3])=0; %Red
redonly1(:,:,[1 3])=127;%Green
redonly2(:,:,[1 2])=200;% Yellow
figure;
subplot(1, 4, 1); %no of rowa, no of columns, assigned column
imshow(colorImage);

subplot(1, 4, 2);
imshow(redonly);
subplot(1, 4, 3);
imshow(redonly1);
subplot(1, 4, 4);
imshow(redonly2);

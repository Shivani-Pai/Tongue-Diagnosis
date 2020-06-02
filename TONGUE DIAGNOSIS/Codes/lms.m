test1 =rgb2gray( imread('d.jpg'));
kapha1 = rgb2gray(imread('kapha1.jpg'));
pitta1 = rgb2gray(imread('pitta1.jpg'));
vata1 = rgb2gray(imread('vata1.jpg'));
figure;
%subplot(2, 3, 1);
%imshow(test1);
%subplot(2, 3, 2);
%imshow(kapha1);
%subplot(2, 3, 3);
%imshow(pitta1);
%subplot(2, 3, 4);
%imshow(vata1);
lbptest1 = extractLBPFeatures(test1, 'Interpolation', 'linear');
lbpkapha1 = extractLBPFeatures(kapha1, 'Interpolation', 'linear');
lbppitta1 = extractLBPFeatures(pitta1, 'Interpolation', 'linear');
lbpvata1 = extractLBPFeatures(vata1, 'Interpolation', 'linear');
kaphatest1 = (lbpkapha1 - lbptest1).^2;
pittatest1 = (lbppitta1 - lbptest1).^2;
vatatest1 = (lbpvata1 - lbptest1).^2;
%subplot(2,3,5);
bar([kaphatest1; pittatest1; vatatest1],'grouped');
title('Squared Error of LBP Histograms');
xlabel('LBP Histogram Bins')

legend({"kapha","pitta","vata"},'Position',[0.8 0.8 0.1 0.1]);
x = size(kaphatest1);
%plot(kaphatest1);
%hold on;
%plot(pittatest1);
%hold on;
%plot(vatatest1);
%legend("kapha","pitta","vata");

%size(100);
%numcells = prod(floor(size(100)/CellSize));
disp(kaphatest1);
disp(pittatest1);
disp(vatatest1);
accuracy = ((1- (mean(kaphatest1+pittatest1+vatatest1))))*100;
disp("Accuracy");
disp (accuracy);
disp("kapha nature");
a = mode(kaphatest1(:));
disp(a);
b = mode(pittatest1(:));
c = mode(vatatest1(:));
%disp(mode(kaphatest1(:)));
disp("pitta nature");
disp(b);
%disp(mode(pittatest1(:)));
disp("vata nature");
disp(c);
d = max(a,b);
e = max(b,c);
f = max(d,e);
disp("Nature of a Tongue");
disp(f);
%disp(max(mode(vatatest1(:))));
%a = max(kaphatest1,pittatest1,vatatest1);
%b = max(pittatest1,vatatest1);
%c = max(a,b);
%disp(a);
%image1 = imread('d1.jpg');
%image2 = imread('d2.jpg');
%diffImage = single(image1) - single(image2);
%imagesMatch = nnz(diffImage(:)) == 0;
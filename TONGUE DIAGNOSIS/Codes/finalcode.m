test1 =rgb2gray( imread('d.jpg'));%5.942759173649392e-09,1.728709442261334e-08,5.611391529214416e-08
kapha1 = rgb2gray(imread('kapha1.jpg'));
pitta1 = rgb2gray(imread('pitta1.jpg'));
vata1 = rgb2gray(imread('vata1.jpg'));
figure;
lbptest1 = extractLBPFeatures(test1, 'Interpolation', 'linear');
lbpkapha1 = extractLBPFeatures(kapha1, 'Interpolation', 'linear');
lbppitta1 = extractLBPFeatures(pitta1, 'Interpolation', 'linear');
lbpvata1 = extractLBPFeatures(vata1, 'Interpolation', 'linear');
kaphatest1 = (lbpkapha1 - lbptest1).^2;
pittatest1 = (lbppitta1 - lbptest1).^2;
vatatest1 = (lbpvata1 - lbptest1).^2;
x = size(kaphatest1);
accuracy = ((1- (mean(kaphatest1+pittatest1+vatatest1))))*100;
a = mode(kaphatest1(:));
b = mode(pittatest1(:));
c = mode(vatatest1(:));
%3.6870e-10
if a>1.0e-06  || b>1.0e-06 ||c>1.0e-7
    imshow(test1);
    disp("Please give valid tongue image");
else
    subplot(2, 3, 1);
    imshow(test1);
    subplot(2, 3, 2);
    imshow(kapha1);
    subplot(2, 3, 3);
    imshow(pitta1);
    subplot(2, 3, 4);
    imshow(vata1);
    subplot(2,3,5);
    bar([kaphatest1; pittatest1; vatatest1],'grouped');
    title('Squared Error of LBP Histograms');
    xlabel('LBP Histogram Bins');
    legend({"kapha","pitta","vata"},'Position',[0.7 0.2 0.1 0.1]);
    disp(kaphatest1);
    disp(pittatest1);
    disp(vatatest1);
    accuracy = ((1- (mean(kaphatest1+pittatest1+vatatest1))))*100;
    disp('Accuracy');
    disp(accuracy);
    disp("kapha nature");
    disp(a);
    disp("pitta nature");
    disp(b);
    disp("vata nature");
    disp(c);
    d = max(a,b);
    e = max(b,c);
    f = max(d,e);
    disp("Nature of a Tongue");
    disp(f);
end


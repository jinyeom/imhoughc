% Circle detection through the Hough transform.
% Author: Jin Yeom (jinyeom@utexas.edu)
I = imread('images/coins.jpg');
J = imread('images/planets.jpg');
K = imread('images/emoji.png');

% experiments...
IC = detectCircles(I, 28); % detect pennys
n = size(IC, 1);
radii = zeros(n, 1);
radii(:) = 28;
imshow(I); hold on; viscircles(IC, radii);
print('images/coins_result.png', '-dpng', '-r0'); close

JC = detectCircles(J, 107); % detect Jupiter
n = size(JC, 1);
radii2 = zeros(n, 1);
radii2(:) = 40;
imshow(I); hold on; viscircles(JC, radii2);
print('images/planets_result.png', '-dpng', '-r0'); close

% Circle detection through the Hough transform.
% Author: Jin Yeom (jinyeom@utexas.edu)
I = imread('images/coins.jpg');
J = imread('images/planets.jpg');
K = imread('images/emoji.png');

% Experiments for final results.
% Comment out the visualization of Hough space.
IC = detectCircles(I, 28); % detect pennies
print('images/pennies_hough.png', '-dpng', '-r0'); close
n = size(IC, 1);
radii = zeros(n, 1);
radii(:) = 28;
imshow(I); hold on; viscircles(IC, radii);
print('images/coins_result.png', '-dpng', '-r0'); close

JC = detectCircles(J, 107); % detect Jupiter
n = size(JC, 1);
radii2 = zeros(n, 1);
radii2(:) = 107;
imshow(J); hold on; viscircles(JC, radii2);
print('images/planets_result.png', '-dpng', '-r0'); close

KC = detectCircles(K, 44); % detect face emojis 
n = size(KC, 1);
radii3 = zeros(n, 1);
radii3(:) = 44;
imshow(K); hold on; viscircles(KC, radii3);
print('images/emoji_result.png', '-dpng', '-r0'); close

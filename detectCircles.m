function [centers] = detectCircles(im, radius)
% A Hough Transform circle detector that takes an input image and a fixed 
% (known) radius, and returns the centers of any detected circles of about that 
% size.
  [h, w, ~] = size(im);

  % Hough transform
  I = rgb2gray(im);
  E = edge(I, 'Canny');
  H = zeros(h, w);
  [y, x] = find(E == 1);
  for i = 1:size(y)
    for theta = -pi:0.01:pi
      a = int32(x(i) + radius * cos(theta));
      b = int32(y(i) + radius * sin(theta));
      if a >= 1 && a <= w && b >= 1 && b <= h
        H(b, a) = H(b, a) + 1;
      end
    end
  end
  
  % Threshold votes.
  [y, x] = find(H > int32(max(H(:)) * 0.7));
  centers = [x, y];
return

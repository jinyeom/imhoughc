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

  % Post processing of the voting array with a bin size.
  PP = zeros(size(H));
  binsize = 1;
  for i = 1:binsize:h
    binr = i:min(h, i + binsize - 1);
    for j = 1:binsize:w
      binc = j:min(w, j + binsize - 1);
      B = H(binr, binc);
      binsum = sum(B(:));
      [~, idx] = max(B(:));
      [wr, wc] = ind2sub(size(B), idx);
      B = zeros(size(B));
      B(wr, wc) = binsum;
      PP(binr, binc) = B;
    end
  end
  
  % Uncomment to print the Hough voting space.
  figure
  colormap pink
  imagesc(PP)

  % Threshold votes.
  [y, x] = find(PP > int32(max(PP(:)) * 0.7));
  centers = [x, y];
return

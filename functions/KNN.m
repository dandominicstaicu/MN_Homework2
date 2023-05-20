## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} KNN (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-08-09

function prediction = KNN (labels, Y, test, k)
  	% init prediction
  	prediction = -1;
  
  	% init distance
  	[m, n] = size (Y); % m = count of images, n = cnt of pixels per image
  	distance = zeros (m, 1);
  
	% for each row calculate the Euclidian distance between it and the test vector
  	for i = 1 : m
		% Euclidian distance = sqrt (sum ( (Y(i, :) - test) .^ 2))
		distance(i) = sqrt(sum((Y(i, :) - test) .^ 2));
  	endfor

	% sort increasing the distances and keep in a vector the first k values
	% that represent the true values of these images that proved to be the closest.
	[~, aux] = sort (distance);
	closest_labels = labels(aux(1 : k));

	% calculate the prediction as the median of the k closest values
	% use median instead of mean because we have discrete values
  	prediction = median (closest_labels);
endfunction

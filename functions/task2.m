## Copyright (C) 2023 Andrei
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
## @deftypefn {} {@var{retval} =} task2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2023-02-28

function new_X = task2 (photo, pcs)
  	[m n] = size(photo);
  
  	% init final matrix
  	new_X = zeros(m, n);
  
  	% cast photo to double
	photo = double(photo);


  	% normalize the photo matrix by subtracting the mean of each row.
	mu = mean(photo, 2); % mean of every row
	photo = photo - mu; % substract the mean of every row from every row

  	% create the Z matrix
	z = photo' / sqrt(n - 1);
  
  	% calculate matrix U, S, V from the SVD of Z
	[U S V] = svd(z);
  
	% create the W matrix from the first pcs columns of V
  	W = V(:, 1 : pcs);
  
  	% calculate matrix Y
	Y = W' * photo;
  
  	% approximate the photo matrix
	new_X = W * Y + mu;
  
  	% transform the matrix to uint8 type for displaying a valid image
	new_X = uint8(new_X);	
endfunction

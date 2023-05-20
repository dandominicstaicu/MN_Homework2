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
## @deftypefn {} {@var{retval} =} pca_cov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-06

function new_X = task3 (photo, pcs)
  	[m, n] = size (photo);
  
  	% init final matrix
  	new_X = zeros (m, n);
  
  	% cast photo to double
  	photo = double (photo);

	% normalize the photo matrix by subtracting the mean of each row.
	mu = mean(photo, 2); % mean of every row
	photo = photo - mu; % substract the mean of every row from every row
  
	% calculate the covariance matrix
  	covar = (photo * photo') / (n - 1); % covar = cov (photo'); 

    % calculate the eigenvalues and eigenvectors of the covariance matrix
	% eig returns a diagonal matrix D of eigenvalues and a full matrix V whose
	% columns are the corresponding eigenvectors so that covar * V = V * D.
	% eig returns the eigenvectors in the columns of V.
	% eig returns the eigenvalues in a diagonal matrix D.
	% eig sorts the eigenvalues in ascending order.
	[V, D] = eig (covar);

	% sort the eigenvalues in descending order
	[D, idx] = sort (diag (D), 'descend');

	% create a matrix V formed from the eigenvectors placed on columns
	% so that the first column is the eigenvector corresponding to the largest
	% eigenvalue and so on.
	V = V(:, idx);

	% keep only the first pcs columns
	% OBS: the first columns of V represent the main components and
	% keeping only the most important ones we get a good compression
	% of the data. The more principal components we keep the better the
	% image quality, but after a certain number the difference can't be
	% noticed by the human eye so they can be eliminated.
	V = V(:, 1:pcs);

	% create the new matrix Y by changing the basis of the initial matrix
	Y = V' * photo;

	% calculate the new matrix X by changing the basis of the matrix Y.
	new_X = V * Y + mu;

	% sum the mean of each row to the new matrix X.
	new_X = new_X + mu;

	% transform the matrix into uint8 to be a valid image.
	new_X = uint8 (new_X);
endfunction

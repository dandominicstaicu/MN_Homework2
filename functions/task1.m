## Copyright (C) 2021 Andrei
##
## Modified by: Dan-Dominic Staicu 311CAb 2023
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
## @deftypefn {} {@var{retval} =} task1 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-14

function new_X = task1 (photo, k)
  [m, n] = size (photo);
  
  % init final matrix
  new_X = zeros (m, n);
  
  % cast photo to double
  photo = double(photo);
  
  % apply SVD on photo
  % U has size m x m, S has size m x n, V has size n x n
  [U, S, V] = svd(photo); 
  
  % calculate new matrices U_k, S_k, V_k
  U_k = U(:, 1 : k); % U_k has size m x k
  S_k = S(1 : k, 1 : k); % S_k has size k x k
  V_k = V(:, 1 : k); % V_k has size n x k
  
  % calculate new_X which is the approximation of the initial photo matrix,
  % using the previously calculated matrices.
   new_X = U_k * S_k * V_k';
  
  % transform new_X to uint8 type in order to create a valid image
  new_X = uint8(new_X);
endfunction

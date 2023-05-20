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
## @deftypefn {} {@var{retval} =} prepare_data (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-07

function [train_mat, train_val] = prepare_data (name, no_train_images)
  	n = 784;

	% initialize train_mat
  	train_mat = zeros (no_train_images, n);

	% init train_val
  	train_val = zeros (1, no_train_images);

	% load data from the given table as argument using load
  	data = load(name);

	% save in train_mat the first no_train_images lines from the training
	% images table
  	train_mat = data.trainX(1 : no_train_images, :);
  
	% save in train_val the first no_train_images values from the training
	% labels table
	train_val = data.trainY(1, 1 : no_train_images);
endfunction

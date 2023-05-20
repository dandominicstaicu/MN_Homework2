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
## @deftypefn {} {@var{retval} =} prepare_photo (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-08

function sir = prepare_photo (im)
	% init the final vector.
  	sir = zeros (1, 784);
  
	% invert the pixel values of the image.

  	% get the maximum pixel intensity value.
 	max_intensity = max(im(:));

	% invert the pixel values of the image.
    im = max_intensity - im;

	% transpose the image and transform it into a line vector using reshape
 	im = reshape (im', 1, []);

	sir = im;
endfunction

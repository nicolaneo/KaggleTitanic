## Copyright (C) 2020 Nicola Neophytou
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} FindCorrelations (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Nicola Neophytou <nicola-linux@nicolalinux-Inspiron-5559>
## Created: 2020-05-15

function [R] = FindCorrelations (correlation_data)
 
 # calculates correlation coefficients between the numerical features 
 R = corrcoef(correlation_data);
 
 colormap(summer);
 clims = [-1 1]; # limit on colour bar
 colorbar;
 
 x = repmat(1:6,6,1); # generate x-coordinates for labels
 y = x'; # generate y-coordinates for labels
 t = num2cell(R); # extact values into cells
 t = cellfun(@num2str, t, 'UniformOutput', false); # convert to string
 imagesc(R, clims);
 
 # set axis labels
 set(gca, 'XTick', [1 2 3 4 5 6], 'XTickLabel', {'Survived','PClass','Age','SibSp','ParCh','Fare'});
 set(gca, 'YTick', [1 2 3 4 5 6], 'YTickLabel', {'Survived','PClass','Age','SibSp','ParCh','Fare'});

 # label pixels with value 
 text(x(:), y(:), t, 'HorizontalAlignment', 'Center');
 
 fprintf('\n Age is best correlated with PClass, so this feature will be used to fill missing Age values.\n');

endfunction

## Author: Nicola Neophytou
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

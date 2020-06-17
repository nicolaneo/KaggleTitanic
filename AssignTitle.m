## Copyright (C) 2020 Nicola Neophytou
## Author: Nicola Neophytou
## Created: 2020-05-12

# function to return vector of numbers indicating passenger Title
# Titles are Rev / Master / Miss / Mr / Mrs / Dr / Major / Don etc

function [Titles] = assignTitle (fid, m)
  
# create vector to hold values corresponding to Titles
Titles = zeros(m,1);
# loop over all lines in file
tline = fgetl(fid);
# start a line counter here 
line_counter = 1;

# loop over text file lines with passenger names 
while ischar(tline)
  
    # in each line, identify the Title of passenger
    # add the corresponding value to Titles vector
    Mr = strfind(tline,'Mr.');
    if size(Mr) == 1
      # 'Mr.' denoted by '1'
      Titles(line_counter) = 1;
    end

    Dr = strfind(tline,'Dr.');
    if size(Dr) == 1
      # 'Dr.' denoted by '2'
      Titles(line_counter) = 2;
    end   

    Master = strfind(tline,'Master.');
    if size(Master) == 1
      # 'Master' denoted by '3'
      Titles(line_counter) = 3;
    end
    
    Mrs = strfind(tline,'Mrs.');
    if size(Mrs) == 1
      # 'Mrs.' denoted by '4'
      Titles(line_counter) = 4;
    end    
    
    Miss = strfind(tline,'Miss.');
    if size(Miss) == 1
      # 'Miss' denoted by '5'
      Titles(line_counter) = 5;
    end  
    
    # if any other titles are present, assign them a '2' along with 'Dr.'
    if size(Mr)~=1 & size(Mrs)~=1 & size(Master)~=1 & size(Miss)~=1 & size(Dr)~=1
      Titles(line_counter) = 2;
    end
    
    # increase line counter
    line_counter++;
    tline = fgetl(fid);
end

# close file 
fclose(fid);

endfunction

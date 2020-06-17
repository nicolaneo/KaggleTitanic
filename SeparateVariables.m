## Copyright (C) 2020 Nicola Neophytou
## Author: Nicola Neophytou <nicola-linux@nicolalinux-Inspiron-5559>
## Created: 2020-05-18

# A function to separate discrete data values into their own feature column
# The vector cell is then either filled with 1 or 0 respectively to indicate a filled entry or not

function [Separated_X] = separateVariables (X)
 [m, n] = size(X);
 
 # The columns pertaining to features with discrete values are 
 # 1, 2, 4, 5, 7, 8 and 9
 # corresponding to PClass, Sex, SibSp, ParCh, Deck, Embarked and Titles
 # each have a possible 3, 2, 9, 7, 4, 3 and 5 options for entries 
 # so we add 33 more columns for these new features
 
 newFeatures = zeros(m, 33);
 Separated_X = [X newFeatures];
 
 # loop over data entries
 for i=1:m
   
   # PClass 
   if X(i,1) == 1
     Separated_X(i, n+1) = 1;
   elseif X(i,1) == 2
     Separated_X(i, n+2) = 1;
   elseif X(i,1) == 3
     Separated_X(i, n+3) = 1;
   end  
   
   # Sex
   if X(i,2) == 0
     Separated_X(i, n+4) = 1;
   elseif X(i,2) == 1
     Separated_X(i, n+5) = 1;
   end
  
  # SibSp
  if X(i,4) == 0
    Separated_X(i, n+6) = 1;
  elseif X(i,4) == 1
    Separated_X(i, n+7) = 1;
  elseif X(i,4) == 2
    Separated_X(i, n+8) = 1;
  elseif X(i,4) == 3
    Separated_X(i, n+9) = 1;
  elseif X(i,4) == 4
    Separated_X(i, n+10) = 1;
  elseif X(i,4) == 5
    Separated_X(i, n+11) = 1;
  elseif X(i,4) == 6
    Separated_X(i, n+12) = 1;
  elseif X(i,4) == 7
    Separated_X(i, n+13) = 1;
  elseif X(i,4) == 8
    Separated_X(i, n+14) = 1;
  end
    
  # ParCh
  if X(i,5) == 0
    Separated_X(i, n+15) = 1;
  elseif X(i,5) == 1
    Separated_X(i, n+16) = 1;
  elseif X(i,5) == 2
    Separated_X(i, n+17) = 1;
  elseif X(i,5) == 3
    Separated_X(i, n+18) = 1;
  elseif X(i,5) == 4
    Separated_X(i, n+19) = 1;
  elseif X(i,5) == 5
    Separated_X(i, n+20) = 1;
  elseif X(i,5) == 6
    Separated_X(i, n+21) = 1;
  end
      
  # Cabins
  if X(i,7) == 1
    Separated_X(i, n+22) = 1;
  elseif X(i,7) == 2
    Separated_X(i, n+23) = 1;
  elseif X(i,7) == 3
    Separated_X(i, n+24) = 1;
  elseif X(i,7) == 4
    Separated_X(i, n+25) = 1;
  end
    
  # Embarked
  if X(i,8) == 1
    Separated_X(i, n+26) = 1;
  elseif X(i,8) == 2
    Separated_X(i, n+27) = 1;
  elseif X(i,8) == 3
    Separated_X(i, n+28) = 1;
  end
    
  # Titles
  if X(i,9) == 1
    Separated_X(i, n+29) = 1;
  elseif X(i,9) == 2
    Separated_X(i, n+30) = 1;
  elseif X(i,9) == 3
    Separated_X(i, n+31) = 1;
  elseif X(i,9) == 4
    Separated_X(i, n+32) = 1;
  elseif X(i,9) == 5
    Separated_X(i, n+33) = 1;
  end
  
 end

  # then delete the old columns
  Separated_X(:,1)=[];
  Separated_X(:,1)=[];
  Separated_X(:,2)=[];
  Separated_X(:,2)=[];
  Separated_X(:,3)=[];
  Separated_X(:,3)=[];
  Separated_X(:,3)=[];
  
endfunction

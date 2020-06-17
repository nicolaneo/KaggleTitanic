## Copyright (C) 2020 Nicola Neophytou
## Author: Nicola Neophytou 
## Created: 2020-05-18

# function to group together decks with similar features 

function [groupedData] = groupDecks (Data, deckColumn)
 
 # Decks ABC are grouped because they all contain first class passengers,
 # who are more likely to survive than other classes
 # ABC (=1,2,3) goes to 1
 # DE (=4,5) goes to 2
 # FG (=6,7) goes to 3
 # M (=8) goes to 4
 # T (=9) can also join M, goes to 4
 
 groupedData = Data;
 [m, n] = size(groupedData);
 
 for i=1:m
   if (groupedData(i, deckColumn) == 1 | groupedData(i, DeckColumn) == 2 | groupedData(i, DeckColumn) == 3)
     groupedData(i, DeckColumn) = 1;
   elseif (groupedData(i, DeckColumn) == 4 | groupedData(i, DeckColumn) == 5)
     groupedData(i, DeckColumn) = 2;
   elseif (groupedData(i, DeckColumn) == 6 | groupedData(i, DeckColumn) == 7)
     groupedData(i, DeckColumn) = 3;
   elseif (groupedData(i, DeckColumn) == 8 | groupedData(i, DeckColumn) == 9)
     groupedData(i, DeckColumn) = 4;
   end  
 end
 
 fprintf('\nDecks grouped by: ABC, DE, FG, MT.\n');
 fprintf('\nPress to continue.\n');
 
 pause;

endfunction

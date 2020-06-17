## Copyright (C) 2020 Nicola Neophytou
## Author: Nicola Neophytou
## Created: 2020-05-08

# Function to plot survive and died passengers for each features in training data

function plotData (Data)
  
  Survived = Data;
  # index to identify passengers who died 
  idx = any(Survived(:,1) < 1, 2);
  # separate these from survived passengers 
  Died = Survived(idx,:);
  Survived(idx,:) = [];
  
  # Plot class of survived passengers 
  SurvivedClass = Survived(:,2);
  hist(SurvivedClass,[1; 2; 3]);
  xlabel ("PClass");
  ylabel ("Number of survived passengers");
  axis ([0, 4]);
  fprintf('\n Survived passengers class plotted. \n');
 
  # Plot class of dead passengers
  DiedClass = Died(:,2);
  hist(DiedClass, [1; 2; 3;]);
  xlabel ("PClass");
  ylabel ("Number of dead passengers");
  axis ([0, 4]);
  fprintf('\n Dead passengers class plotted. \n');
  
  
  # Plot sex of survived passengers
  SurvivedSex = Survived(:,3);
  hist(SurvivedSex, [0; 1]);
  xlabel ("Sex");
  ylabel ("Number of survived passengers");
  axis ([-1, 2]);
  set(gca,'XTick',[0 1]);
  set(gca,'xticklabel',({'male','female'}));
  fprintf('\n Survived passengers sex plotted. \n');
  
  # Plot sex of dead passengers
  DiedSex = Died(:,3);
  hist(DiedSex, [0; 1]);
  xlabel ("Sex");
  ylabel ("Number of dead passengers");
  axis ([-1, 2]);
  set(gca,'XTick',[0 1]);
  set(gca,'xticklabel',({'male','female'}));
  fprintf('\n Dead passengers sex plotted. \n');
  
  
  # Plot age of survived passengers 
  SurvivedAge = Survived(:,4);
  hist(SurvivedAge);
  xlabel ("Age");
  ylabel ("Number of survived passengers");
  axis ([-1, 90]);
  fprintf('\n Survived passengers age plotted. \n');
 
  # Plot age of dead passengers
  DiedAge = Died(:,4);
  hist(DiedAge);
  xlabel ("Age");
  ylabel ("Number of dead passengers");
  axis ([-1, 90]);
  fprintf('\n Dead passengers age plotted. \n');
  
  
  # Plot number of siblings and spouses for survived passengers
  SurvivedSibSp = Survived(:,5);
  hist(SurvivedSibSp, [0; 1; 2; 3; 4; 5]);
  xlabel ("Number of siblings and spouses");
  ylabel ("Number of survived passengers");
  axis ([-1, 6]);
  fprintf('\n Survived passengers SibSp plotted. \n');
 
  # Plot number of siblings and spouses for dead passengers 
  DiedSibSp = Died(:,5);
  hist(DiedSibSp, [0; 1; 2; 3; 4; 5; 6; 7; 8; 9]);
  xlabel ("Number of siblings and spouses");
  ylabel ("Number of dead passengers");
  axis ([-1, 10]);
  fprintf('\n Dead passengers SibSp plotted. \n');
  
  
  # Plot number of parents and children of survived passengers
  SurvivedParCh = Survived(:,6);
  hist(SurvivedParCh, [0; 1; 2; 3; 4; 5; 6]);
  xlabel ("Number of parents and children");
  ylabel ("Number of survived passengers");
  axis ([-1, 7]);
  fprintf('\n Survived passengers ParCh plotted. \n');
 
  # Plot number of parents and children of dead passengers
  DiedParCh = Died(:,6);
  hist(DiedParCh, [0; 1; 2; 3; 4; 5; 6]);
  xlabel ("Number of parents and children");
  ylabel ("Number of dead passengers");
  axis ([-1, 7]);
  fprintf('\n Dead passengers ParCh plotted. \n');
  
  
  # Plot ticket fare of survived passengers
  SurvivedFare = Survived(:,7);
  hist(SurvivedFare);
  xlabel ("Ticket fare");
  ylabel ("Number of survived passengers");
  axis ([-1, 310]);
  fprintf('\n Survived passengers fare plotted. \n');
 
  # Plot ticket fare of dead passengers
  DiedFare = Died(:,7);
  hist(DiedFare);
  xlabel ("Ticket fare");
  ylabel ("Number of dead passengers");
  axis ([-1, 300]);
  fprintf('\n Dead passengers fare plotted. \n');
  
  
  # Plot deck of survived passengers
  SurvivedCabin = Survived(:,8);
  hist(SurvivedCabin, [1; 2; 3; 4; 5; 6; 7; 8; 9]);
  xlabel ("Cabin letter");
  ylabel ("Number of survived passengers");
  axis ([0, 10]);
  set(gca,'XTick',[1 2 3 4 5 6 7 8 9]);
  set(gca,'xticklabel',({'A','B','C','D','E','F','G','M','T'}));
  fprintf('\n Survived passengers cabin plotted. \n');
 
  # Plot deck of dead passengers
  DiedCabin = Died(:,8);
  hist(DiedCabin, [1; 2; 3; 4; 5; 6; 7; 8; 9]);
  xlabel ("Cabin letter");
  ylabel ("Number of dead passengers");
  axis ([0, 10]);
  set(gca,'XTick',[1 2 3 4 5 6 7 8 9]);
  set(gca,'xticklabel',({'A','B','C','D','E','F','G','M','T'}));
  fprintf('\n Dead passengers cabin plotted. \n');
  
  
  # Plot embarked port of survived passengers
  SurvivedEmb = Survived(:,9);
  hist(SurvivedEmb, [1; 2; 3]);
  xlabel ("Embarked location");
  ylabel ("Number of survived passengers");
  axis ([0, 4]);
  set(gca,'XTick',[1 2 3]);
  set(gca,'xticklabel',({'S','Q','C'}));
  fprintf('\n Survived passengers embarked location plotted. \n');
 
  # Plot embarked port of dead passengers
  DiedEmb = Died(:,9);
  hist(DiedEmb, [1; 2; 3]);
  xlabel ("Embarked location");
  ylabel ("Number of dead passengers");
  axis ([0, 4]);
  set(gca,'XTick',[1 2 3]);
  set(gca,'xticklabel',({'S','Q','C'}));
  fprintf('\n Dead passengers embarked location plotted. \n');
  
  
endfunction

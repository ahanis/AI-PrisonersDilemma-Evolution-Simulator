%Hanis Athirah
%Artificial Intelligence Coursework Question 2 part 1

%IPD points: 3 if both cooperated
%IPD points: 5 & 0 if one cooperate and one defect
%IPD points: 1 if both defect
% In the lookuptable 1 means the player cooperate and 0 means the player defect

% 50% noise

clc;
clear all;
hold on;

seed = 1;
generation = 1;

%for 100 generations x 100 generations
while (generation < 101)

seed = seed + 1;
rng(seed,'twister');

%matrix for strategy choice player 
strategychoicep = zeros(1,20);

%generate strategy choice  for every player randomly
s_player = 1;
while (s_player<21)
strategychoicep (s_player) = randi(8);
s_player = s_player + 1; 
end

%lookup table row 1 will be the strategies number
%lookup table row 2 will be the initial move of the player
%lookup table row 3 will be the strategy's reaction if opponent defect
%lookup table row 4 will be the strategy's reaction if opponent cooperate

%matrix for lookuptable and generationtable
lookuptable = zeros(20,5);
generationtable = zeros (100,2);
 
%put the values in the lookuptable based on the strategies that were
%generated randomly
s_player = 1;
while (s_player<21)
 if strategychoicep (s_player) == 1
      lookuptable (s_player,1:4) = [1 1 0 1];
 elseif strategychoicep (s_player) == 2
      lookuptable (s_player,1:4) = [2 1 1 1];
 elseif strategychoicep (s_player) == 3
      lookuptable (s_player,1:4) = [3 0 0 0];
 elseif strategychoicep (s_player) == 4
      lookuptable (s_player,1:4) = [4 1 0 0]; 
 elseif strategychoicep (s_player) == 5
      lookuptable (s_player,1:4) = [5 1 1 0];
 elseif strategychoicep (s_player) == 6
      lookuptable (s_player,1:4) = [6 0 0 1];
 elseif strategychoicep (s_player) == 7
      lookuptable (s_player,1:4) = [7 0 1 0];
 else
     lookuptable (s_player,1:4) = [8 0 1 1];
 end
s_player = s_player + 1;
end

%for 100 generations
round = 1;
while(round < 101)
    
    %intializing
    allpayoff = zeros (20,21);
    player1move = zeros(1,100);
    player2move = zeros(1,100);
    payoffp1 = zeros(1,100);
    payoffp2 = zeros(1,100);
    
    %play the game which is player 1 is the player and player 2 is the opponent
    %play for 1 generation
    % 2 is defect and 1 is cooperate
    player = 1;
    while (player < 21)
        opponent = 1;
        while (opponent < 21)
        iteration = 1;
        index = 1;
        payoffp1sum=0;
        payoffp2sum=0;
        if player > opponent
            while (iteration<101)
            playerplay = lookuptable(player,1);
             switch (playerplay)    
             case 1
              if index == 1
                player1move (index) = 1;
              else
                if player2move (index-1) == 1
                    player1move (index) = 1;
                else
                    player1move (index) = 2;
                end 
              end

             case 2
              player1move (index) = 1;

             case 3
              player1move (index) = 2;

             case 4
               if index == 1
                  player1move (index) = 1;
               else 
                   if player2move(index-1) == 2
                      player1move (index) = 2;
                   else
                       player1move (index) = 2;
                   end
               end

             case 5
                 if index == 1
                     player1move (index) = 1;
                 else
                   if player2move (index) == 1
                     player1move (index) = 2;
                   else
                    player1move (index) = 1;
                   end
                 end

            case 6
               if index == 1
                player1move (index) = 2;
              else
                if player2move (index-1) == 1
                    player1move (index) = 1;
                else
                    player1move (index) = 2;
                end 
               end

             case 7
              if index == 1
                player1move (index) = 2;
              else
                if player2move (index-1) == 1
                    player1move (index) = 2;
                else
                    player1move (index) = 1;
                end 
              end

             case 8
              if index == 1
                player1move (index) = 2;
              else
                if player2move (index-1) == 1 
                    player1move (index) = 1; 
                else
                    player1move (index) = 1;
                end 
              end
             end
             
             %1% noise
%             randommutate = randi(100);
%              if randommutate == 1
%                  if  player1move (index) == 1
%                       player1move (index) = 2;
%                  else
%                       player1move (index) = 1;
%                  end
%              end
             
             %5% noise
%             randommutate = randi(100);
%              if randommutate < 6
%                  if  player1move (index) == 1
%                       player1move (index) = 2;
%                  else
%                       player1move (index) = 1;
%                  end
%              end
             
             %10% noise
%             randommutate = randi(100);
%              if randommutate < 11
%                  if  player1move (index) == 1
%                       player1move (index) = 2;
%                  else
%                       player1move (index) = 1;
%                  end
%              end
             
              %25% noise
%             randommutate = randi(100);
%              if randommutate < 26
%                  if  player1move (index) == 1
%                       player1move (index) = 2;
%                  else
%                       player1move (index) = 1;
%                  end
%              end
             
            %50% noise
            randommutate = randi(100);
             if randommutate < 51
                 if  player1move (index) == 1
                      player1move (index) = 2;
                 else
                      player1move (index) = 1;
                 end
             end

            opponentplay = lookuptable (opponent,1);
            switch (opponentplay)  
             case 1
              if index == 1
                  player2move (index) = 1;
              else
                  if player1move (index-1) == 1
                     player2move (index) = 1;
                  else
                     player2move (index) = 2;
                  end
              end

             case 2
              player2move (index) = 1;

             case 3
              player2move (index) = 2;

             case 4
               if index == 1
                  player2move (index) = 1;
               else 
                   if player1move (index-1) == 2
                     player2move (index) = 2;
                  else
                     player2move (index) = 2;
                   end
               end

             case 5
                 if index == 1
                     player2move (index) = 1;
                 else
                   if player1move (index-1) == 1
                    player2move (index) = 2;
                   else
                    player2move (index) = 1;
                   end
                 end
            case 6
              if index == 1
                player2move (index) = 2;
              else
                   if player1move (index-1) == 1
                    player2move (index) = 1;
                   else
                    player2move (index) = 2;
                   end
              end

             case 7
               if index == 1
                player2move (index) = 2;
               else
                   if player1move (index-1) == 1
                    player2move (index) = 2;
                   else
                    player2move (index) = 1;
                   end
               end

             case 8
              if index == 1
                player2move (index) = 2;
              else
                if player1move (index-1) == 1 
                    player2move (index) = 1; 
                else
                    player2move (index) = 1;
                end 
              end  

            end
            
            %1% noise
%             randommutate = randi(100);
%              if randommutate ==1
%                  if  player2move (index) == 1
%                       player2move (index) = 2;
%                  else
%                       player2move (index) = 1;
%                  
%                  end
%              end
            
            
              %5% noise
%             randommutate = randi(100);
%              if randommutate < 6
%                  if  player2move (index) == 1
%                       player2move (index) = 2;
%                  else
%                       player2move (index) = 1;
%                  
%                  end
%              end
             
             % 10% noise
%             randommutate = randi(100);
%              if randommutate < 11
%                  if  player2move (index) == 1
%                       player2move (index) = 2;
%                  else
%                       player2move (index) = 1;
%                  
%                  end
%              end
            
            %25% noise
%             randommutate = randi(100);
%              if randommutate < 26
%                  if  player2move (index) == 1
%                       player2move (index) = 2;
%                  else
%                       player2move (index) = 1;
%                  
%                  end
%              end
             %50% noise
            randommutate = randi(100);
             if randommutate < 51
                 if  player2move (index) == 1
                      player2move (index) = 2;
                 else
                      player2move (index) = 1;
                 end
             end
            
            %Calculate payoff
             if  (player1move (index) == 1 && player2move(index) == 1)
                 payoffp1 (index) = 3 ;
                 payoffp2 (index) = 3;
             elseif (player1move(index) == 1 && player2move(index) == 2)
                 payoffp1 (index) = 0;
                 payoffp2 (index) = 5;
             elseif (player1move(index) == 2 && player2move(index) == 1)
                 payoffp1 (index) = 5;
                 payoffp2 (index) = 0;
              else 
                 payoffp1 (index) = 1;
                 payoffp2 (index) = 1;
             end

             payoffp1sum = payoffp1sum + payoffp1(index);
             payoffp2sum = payoffp2sum + payoffp2(index);
             index = index + 1;
             iteration = iteration + 1;
            end
          allpayoff(player,opponent) = payoffp1sum;
          allpayoff(opponent,player) = payoffp2sum;
        end
          opponent = opponent + 1;
        end
  player = player + 1;
    end

l = length (allpayoff);

for m = 1 : l
    for n = 1 : l
        if n == m
            allpayoff(n,m) = 0;
        end
    end
end

q_player = 1;
while ( q_player < 21) 
allpayoff(q_player, 21)=sum(allpayoff(q_player,1:20));
q_player = q_player + 1;
end

d_player = 1;
%sum payoff for every player put in the lookup table 
while (d_player<21)
   lookuptable (d_player,5) = allpayoff (d_player,21); 
   d_player = d_player + 1;
end

lookuptable = sortrows (lookuptable, 5,'descend');

lookuptable (11:20,:) = lookuptable(1:10,:); %cloning

averagepayoff = lookuptable(1,5) / 1900; %divided by 1900 because it's played for 1900 times

lookuptable(:,5) = 0;      %put the payoff column to all zeros so when it loops again it can have new value

generationtable (round,1) = round;
generationtable (round,2) = averagepayoff;


randnum = randi(100); % used for mutation

if randnum == 50
    %mutate part
    m_player = 1;
    while (m_player<11)
     if lookuptable (m_player,2) ==  1 && lookuptable (m_player,3) ==  0 && lookuptable (m_player,4) ==  1
          lookuptable (m_player,1:4) = [7 0 1 0];
     elseif lookuptable (m_player,2) ==  1 && lookuptable (m_player,3) ==  1 && lookuptable (m_player,4) ==  1
          lookuptable (m_player,1:4) = [3 0 0 0];
     elseif lookuptable (m_player,2) ==  0 && lookuptable (m_player,3) ==  0 && lookuptable (m_player,4) ==  0
           lookuptable (m_player,1:4) = [2 1 1 1];
     elseif lookuptable (m_player,2) ==  1 && lookuptable (m_player,3) ==  0 && lookuptable (m_player,4) ==  0
           lookuptable (m_player,1:4) = [8 0 1 1];
     elseif lookuptable (m_player,2) ==  1 && lookuptable (m_player,3) ==  1 && lookuptable (m_player,4) ==  0
           lookuptable (m_player,1:4) = [6 0 0 1];
     elseif lookuptable (m_player,2) ==  0 && lookuptable (m_player,3) ==  0 && lookuptable (m_player,4) ==  1
           lookuptable (m_player,1:4) = [5 1 1 0];
     elseif lookuptable (m_player,2) ==  0 && lookuptable (m_player,3) ==  1 && lookuptable (m_player,4) ==  0
           lookuptable (m_player,1:4) = [1 1 0 1];
     else
           lookuptable (m_player,1:4) = [4 1 0 0];
     end
    m_player = m_player +1;
    end
     
end
%loop for another generation
round = round+1;
end

%plot graph for every generation
x = generationtable(:, 1);
y = generationtable (:, 2);
plot(x,y);
%title('Average Payoff vs Generation with different seed number with 1% mutation')
%title('Average Payoff vs Generation with different seed number with 5% mutation')
%title('Average Payoff vs Generation with different seed number with 10% mutation')
%title('Average Payoff vs Generation with different seed number with 25% mutation')
title('Average Payoff vs Generation with different seed number with 50% mutation')
xlabel('Generation')
ylabel('Average Payoff')
xlim([0 100])
ylim([0 5])
%loop again after done with 100 generation
generation = generation + 1;
end




%Hanis Athirah Abdullah
%Artificial Intelligence Coursework Question 2 part 2

%IPD points: 3 if both cooperated
%IPD points: 5 & 0 if one cooperate and one defect
%IPD points: 1 if both defect
% In the lookuptable 1 means the player cooperate and 0 means the player defect


clc;
clear all;
hold on;

seed = 1;
generation = 1;

%for 100 generations x 100 generations
while (generation < 101)

seed = seed + 1;
rng(seed,'twister');

%matrix for strategy choice player 
strategychoicep = zeros(1,20);

%generate strategy choice  for every player randomly
s_player = 1;
while (s_player<21)
strategychoicep (s_player) = randi(8);
s_player = s_player + 1; 
end

%lookup table row 1 will be the strategies number
%lookup table row 2 will be the initial move of the player
%lookup table row 3 will be the strategy's reaction if opponent defect
%lookup table row 4 will be the strategy's reaction if opponent cooperate

%matrix for lookuptable and generationtable
lookuptable = zeros(20,5);
generationtable = zeros (100,2);
 
%put the values in the lookuptable based on the strategies that were
%generated randomly
s_player = 1;
while (s_player<21)
 if strategychoicep (s_player) == 1
      lookuptable (s_player,1:4) = [1 1 0 1];
 elseif strategychoicep (s_player) == 2
      lookuptable (s_player,1:4) = [2 1 1 1];
 elseif strategychoicep (s_player) == 3
      lookuptable (s_player,1:4) = [3 0 0 0];
 elseif strategychoicep (s_player) == 4
      lookuptable (s_player,1:4) = [4 1 0 0]; 
 elseif strategychoicep (s_player) == 5
      lookuptable (s_player,1:4) = [5 1 1 0];
 elseif strategychoicep (s_player) == 6
      lookuptable (s_player,1:4) = [6 0 0 1];
 elseif strategychoicep (s_player) == 7
      lookuptable (s_player,1:4) = [7 0 1 0];
 else
     lookuptable (s_player,1:4) = [8 0 1 1];
 end
s_player = s_player + 1;
end

%for 100 generations
round = 1;
while(round < 101)
    
    %intializing
    allpayoff = zeros (20,21);
    player1move = zeros(1,100);
    player2move = zeros(1,100);
    payoffp1 = zeros(1,100);
    payoffp2 = zeros(1,100);
    
    %play the game which is player 1 is the player and player 2 is the opponent
    %play for 1 generation
    % 2 is defect and 1 is cooperate
    player = 1;
    while (player < 21)
        opponent = 1;
        while (opponent < 21)
        iteration = 1;
        index = 1;
        payoffp1sum=0;
        payoffp2sum=0;
        if player > opponent
            while (iteration<101)
            playerplay = lookuptable(player,1);
             switch (playerplay)    
             case 1
              if index == 1
                player1move (index) = 1;
              else
                if player2move (index-1) == 1
                    player1move (index) = 1;
                else
                    player1move (index) = 2;
                end 
              end

             case 2
              player1move (index) = 1;

             case 3
              player1move (index) = 2;

             case 4
               if index == 1
                  player1move (index) = 1;
               else 
                   if player2move(index-1) == 2
                      player1move (index) = 2;
                   else
                       player1move (index) = 2;
                   end
               end

             case 5
                 if index == 1
                     player1move (index) = 1;
                 else
                   if player2move (index) == 1
                     player1move (index) = 2;
                   else
                    player1move (index) = 1;
                   end
                 end

            case 6
               if index == 1
                player1move (index) = 2;
              else
                if player2move (index-1) == 1
                    player1move (index) = 1;
                else
                    player1move (index) = 2;
                end 
               end

             case 7
              if index == 1
                player1move (index) = 2;
              else
                if player2move (index-1) == 1
                    player1move (index) = 2;
                else
                    player1move (index) = 1;
                end 
              end

             case 8
              if index == 1
                player1move (index) = 2;
              else
                if player2move (index-1) == 1 
                    player1move (index) = 1; 
                else
                    player1move (index) = 1;
                end 
              end
            end

            opponentplay = lookuptable (opponent,1);
            switch (opponentplay)  
             case 1
              if index == 1
                  player2move (index) = 1;
              else
                  if player1move (index-1) == 1
                     player2move (index) = 1;
                  else
                     player2move (index) = 2;
                  end
              end

             case 2
              player2move (index) = 1;

             case 3
              player2move (index) = 2;

             case 4
               if index == 1
                  player2move (index) = 1;
               else 
                   if player1move (index-1) == 2
                     player2move (index) = 2;
                  else
                     player2move (index) = 2;
                   end
               end

             case 5
                 if index == 1
                     player2move (index) = 1;
                 else
                   if player1move (index-1) == 1
                    player2move (index) = 2;
                   else
                    player2move (index) = 1;
                   end
                 end
            case 6
              if index == 1
                player2move (index) = 2;
              else
                   if player1move (index-1) == 1
                    player2move (index) = 1;
                   else
                    player2move (index) = 2;
                   end
              end

             case 7
               if index == 1
                player2move (index) = 2;
               else
                   if player1move (index-1) == 1
                    player2move (index) = 2;
                   else
                    player2move (index) = 1;
                   end
               end

             case 8
              if index == 1
                player2move (index) = 2;
              else
                if player1move (index-1) == 1 
                    player2move (index) = 1; 
                else
                    player2move (index) = 1;
                end 
              end  

            end
            
            %Calculate payoff
             if  (player1move (index) == 1 && player2move(index) == 1)
                 payoffp1 (index) = 3 ;
                 payoffp2 (index) = 3;
             elseif (player1move(index) == 1 && player2move(index) == 2)
                 payoffp1 (index) = 0;
                 payoffp2 (index) = 2;
             elseif (player1move(index) == 2 && player2move(index) == 1)
                 payoffp1 (index) = 2;
                 payoffp2 (index) = 0;
              else 
                 payoffp1 (index) = 1;
                 payoffp2 (index) = 1;
             end

             payoffp1sum = payoffp1sum + payoffp1(index);
             payoffp2sum = payoffp2sum + payoffp2(index);
             index = index + 1;
             iteration = iteration + 1;
            end
          allpayoff(player,opponent) = payoffp1sum;
          allpayoff(opponent,player) = payoffp2sum;
        end
          opponent = opponent + 1;
        end
  player = player + 1;
    end

l = length (allpayoff);

for m = 1 : l
    for n = 1 : l
        if n == m
            allpayoff(n,m) = 0;
        end
    end
end

q_player = 1;
while ( q_player < 21) 
allpayoff(q_player, 21)=sum(allpayoff(q_player,1:20));
q_player = q_player + 1;
end

d_player = 1;
%sum payoff for every player put in the lookup table 
while (d_player<21)
   lookuptable (d_player,5) = allpayoff (d_player,21); 
   d_player = d_player + 1;
end

lookuptable = sortrows (lookuptable, 5,'descend');

lookuptable (11:20,:) = lookuptable(1:10,:); %cloning

averagepayoff = lookuptable(1,5) / 1900; %divided by 1900 because it's played for 1900 times

lookuptable(:,5) = 0;      %put the payoff column to all zeros so when it loops again it can have new value

generationtable (round,1) = round;
generationtable (round,2) = averagepayoff;


randnum = randi(100); % used for mutation

if randnum == 50
    %mutate part
    m_player = 1;
    while (m_player<11)
     if lookuptable (m_player,2) ==  1 && lookuptable (m_player,3) ==  0 && lookuptable (m_player,4) ==  1
          lookuptable (m_player,1:4) = [7 0 1 0];
     elseif lookuptable (m_player,2) ==  1 && lookuptable (m_player,3) ==  1 && lookuptable (m_player,4) ==  1
          lookuptable (m_player,1:4) = [3 0 0 0];
     elseif lookuptable (m_player,2) ==  0 && lookuptable (m_player,3) ==  0 && lookuptable (m_player,4) ==  0
           lookuptable (m_player,1:4) = [2 1 1 1];
     elseif lookuptable (m_player,2) ==  1 && lookuptable (m_player,3) ==  0 && lookuptable (m_player,4) ==  0
           lookuptable (m_player,1:4) = [8 0 1 1];
     elseif lookuptable (m_player,2) ==  1 && lookuptable (m_player,3) ==  1 && lookuptable (m_player,4) ==  0
           lookuptable (m_player,1:4) = [6 0 0 1];
     elseif lookuptable (m_player,2) ==  0 && lookuptable (m_player,3) ==  0 && lookuptable (m_player,4) ==  1
           lookuptable (m_player,1:4) = [5 1 1 0];
     elseif lookuptable (m_player,2) ==  0 && lookuptable (m_player,3) ==  1 && lookuptable (m_player,4) ==  0
           lookuptable (m_player,1:4) = [1 1 0 1];
     else
           lookuptable (m_player,1:4) = [4 1 0 0];
     end
    m_player = m_player +1;
    end
     
end

round = round+1;
end

%plot graph for every generation
x = generationtable(:, 1);
y = generationtable (:, 2);
plot(x,y);
title('Average Payoff vs Generation with different seed number')
xlabel('Generation')
ylabel('Average Payoff')
xlim([0 100])
ylim([0 5])

%loop again for 100 times everytime it's done with 1 generation
generation = generation + 1;
end

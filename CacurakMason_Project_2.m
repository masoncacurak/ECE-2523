% Mason Cacurak
% 9/14/23

load ECE2523_Project2_Data; % Loads data into script

% Prints the name of the game and then calls the function given the
% specific game's win/loss data
fprintf('Call Of Responsibility: \n');
[pWin] = CalcProbWin(CallOfResponsibility_gameData);

fprintf('League Of Okay: \n');
[pWin] = CalcProbWin(LeagueOfOkay_gameData);

fprintf('Overhear: \n');
[pWin] = CalcProbWin(Overhear_gameData);


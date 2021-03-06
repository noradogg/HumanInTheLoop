% 通路に荷物が落ちた
% 方法2

function CASE1_METHOD2()

% Clear and close everything
%clear all; close all; fclose all;

% Run setup.m
setup;

% Set a folder name
init('CASE1_METHOD2');

global robot;
global human;

% Creat G1 (DES)
robot(1).Q = 72; % number of states
       % the initial state q0 is always labeled "0"
robot(1).Qm = (71); % marker state set
robot(1).delta = [0,15,7;
                  4,15,14;
                  5,17,4;
                  6,17,5;
                  7,15,17;
                  7,17,6;
                  14,15,24;
                  17,15,27;
                  23,15,33;
                  24,17,23;
                  25,17,24;
                  26,17,25;
                  27,17,26;
                  33,15,43;
                  43,13,44;
                  44,13,45;
                  44,15,54;
                  45,13,46;
                  46,13,47;
                  47,15,57;
                  54,15,64;
                  57,15,67;
                  64,13,65;
                  65,13,66;
                  66,13,67;
                  67,13,68;
                  68,15,71]; % transition triples (exit state, event, enter state)
         
create('G1', robot(1).Q, robot(1).delta, robot(1).Qm); % create G1


% Creat G2 (DES)
robot(2).Q = 72; % number of states
       % the initial state q0 is always labeled "0"
robot(2).Qm = (71); % marker state set
robot(2).delta = [0,25,8;
                  8,27,7;
                  7,25,17;
                  17,25,27;
                  26,25,36;
                  27,27,26;
                  36,25,46;
                  44,25,54;
                  45,27,44;
                  46,27,45;
                  46,23,47;
                  47,25,57;
                  54,25,64;
                  57,25,67;
                  64,23,65;
                  65,25,71;
                  66,27,65;
                  67,27,66]; % transition triples (exit state, event, enter state)

% %robot2分岐を一つ増やす(10の上からスタート)
% robot(2).delta = [0,25,10;%
%                   10,27,9;%
%                   10,25,20;%
%                   9,27,8;%
%                   8,27,7;
%                   7,25,17;
%                   17,25,27;
%                   20,25,30;%
%                   30,27,29;%
%                   29,27,28;%
%                   28,27,27;%
%                   26,25,36;
%                   27,27,26;
%                   36,25,46;
%                   44,25,54;
%                   45,27,44;
%                   46,27,45;
%                   46,23,47;
%                   47,25,57;
%                   54,25,64;
%                   57,25,67;
%                   64,23,65;
%                   65,25,71;
%                   66,27,65;
%                   67,27,66]; % transition triples (exit state, event, enter state)

create('G2', robot(2).Q, robot(2).delta, robot(2).Qm); % create G2


%Create human1
human.Q = 172;
human.Qm = (171);
human.delta = [0,101,67;
               67,101,57;
               57,101,47;
               47,101,37;
               37,101,27;
               27,107,26;
               26,108,126; % done
               126,103,127;
               127,105,137;
               137,105,147;
               147,105,157;
               157,105,167;
               167,105,171];

% %human分岐増やす(66の下からスタート，左からのルート追加(最短経路でない))
% human.delta = [0,101,66;%
%                66,103,67;%
%                66,107,65;%
%                65,107,64;%
%                64,101,54;%
%                54,101,44;%
%                44,101,34;%
%                34,101,24;%
%                24,103,25;%
%                25,103,26;%
%                126,107,125;%
%                125,107,124;%
%                124,105,134;%
%                134,105,144;%
%                144,105,154;%
%                154,105,164;%
%                164,103,165;%
%                165,103,166;%
%                67,101,57;
%                57,101,47;
%                47,101,37;
%                37,101,27;
%                27,107,26;
%                26,108,126; % done
%                126,103,127;
%                127,105,137;
%                137,105,147;
%                147,105,157;
%                157,105,167;
%                167,105,166;%
%                166,105,171;%
%                171,109,171];

human.state=[24;25;26;27;
             34;37;
             44;47;
             54;57;
             64;65;66;67];

create('H1', human.Q, human.delta, human.Qm); % create human1


%Synchronous G1,G2 and G3
sync('G', 'G1', 'G2'); % synchronous product by sync
% sync('G', 'G', 'G3');
sync('PLANT', 'G', 'H1');

object.Q=2;
object.Qm=(1);
object.delta=[0,108,1]; % state 0(荷物が通路上に落ちている状態) -> state 1(荷物が棚に戻された状態)
create('Eobject',object.Q,object.delta,object.Qm);

statepairs = [[1,1];[2,2];[3,3];[4,4];[5,5];[6,6];[7,7];[8,8];[9,9];[10,10];
    [11,11];[12,12];[13,13];[14,14];[15,15];[16,16];[17,17];[18,18];[19,19];[20,20];
    [21,21];[22,22];[23,23];[24,24];[25,25];[26,26];[27,27];[28,28];[29,29];[30,30];
    [31,31];[32,32];[33,33];[34,34];[35,35];[36,36];[37,37];[38,38];[39,39];[40,40];
    [41,41];[42,42];[43,43];[44,44];[45,45];[46,46];[47,47];[48,48];[49,49];[50,50];
    [51,51];[52,52];[53,53];[54,54];[55,55];[56,56];[57,57];[58,58];[59,59];[60,60];
    [61,61];[62,62];[63,63];[64,64];[65,65];[66,66];[67,67];[68,68];[69,69];[70,70]];

% d=1のとき
edge=create_edge(human.state);
statepairsH = create_mutex_pairsH(human.state,edge);

% % d=2のとき(あってるかわからん)
% edge=create_edge(statepairsH(:,1));
% statepairsH = create_mutex_pairsH(statepairsH(:,1),edge);

statepair_object=[26,0];

%Specifications
mutex('E12', 'G1', 'G2', statepairs);
mutex('E1H', 'G1', 'H1', statepairsH);
mutex('E2H', 'G2', 'H1', statepairsH);
mutex('E1object','G1','Eobject',statepair_object);
mutex('E2object','G2','Eobject',statepair_object);

sync('E', 'E12', 'E1H', 'E2H', 'E1object', 'E2object');

allevents('ALLPLANT', 'PLANT');
sync('SPEC', 'E', 'ALLPLANT');

supcon('SUP', 'PLANT', 'SPEC');

condat('SUPD', 'PLANT', 'SUP');

printdes('SUP');
printdat('SUPD');
end

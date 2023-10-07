clc;        clear;      close;
%%%%%%%%%%%%%%%%%%%%%%%
%%% check the validity of constrantsVisualization
%%%%%%%%%%%%%%%%%%%%%%%

%% when the number of constraints is smell, it is ok
A = [1.00   0.01;
       -0.04   0.98  ];
B = [0 0.01]';
K = [-10 -10];

Ac = [A+B*K ];        % A close loop
constraint1 = [ K  1;   -K  1];
[MCAI,~,~] = oinfset(Ac,constraint1,1000);
A = MCAI(:,1:2);                     % MCAI
B = MCAI(:,3);

constrantsVisualization(A,B)

%% when the number of constraints is large, it will stock up
A = [1.00   0.01;
       -0.04   0.98];
B = [0;  0.1];
C = [1 0];
D = 0;
P = [0; 0];
Q = -1;
S = 1;

[K,L,Pi,Ga] = impFI(A,B,C,D,P,Q,S);

Ac = [A+B*K B*L;
           zeros(1,2) S];        % A close loop
% u=kx+lw <1      u=kx+lw >-1
constraint = [ [K L]  1;
                    -[K L]  1;  ];
[MCAI,~,~] = oinfset(Ac,constraint,1000);

A = MCAI(:,1:3);                     % MCAI
B = MCAI(:,4);

constrantsVisualization(A,B)
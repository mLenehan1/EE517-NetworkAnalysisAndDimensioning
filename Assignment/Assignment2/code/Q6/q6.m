addpath(".")

function retval = erlangB (N, A, Ex)
	retval = (A*Ex)/(N+A*Ex);
endfunction

function retval = mfunc (A, Ex)
	retval = A*Ex;
endfunction

function retval = var (M, A, N)
	retval = M*(1-M+A/(N+1-A+M));
endfunction

AmicA = 20;
AmicB = 30;
AmicC = 25;
Amac = 5;
B = 0;
Ex = 1;
E1 = E2 = E3 = Ex
Nmic=0;
Nmac=0;

while(B<= 0.01)
	M1 = mfunc(AmicA, Ex)
	V1 = var(M1, AmicA, Nmic)

	M2 = mfunc(AmicB, Ex)
	V2 = var(M2, AmicB, Nmic)

	M3 = mfunc(AmicC, Ex)
	V3 = var(M3, AmicC, Nmic)

	M = M1+M2+M3
	V = V1+V2+V3
	Z = V/M
	Astar = V+3*Z(Z-1)
	Nstar = Astar*((M+Z)/(M+Z-1))-M-1
	B = erlangB(Nmac, Astar, Ex)
endwhile

AmicA = 20;
AmicB = 30;
AmicC = 25;
Amac = 5;
B = 0.01;
Nmic=0;
Nmac=0;
MacCost = 3;
MicCost = 1;
TotalCost = zeros(0,1000)
cnt = 1;

f1 = fopen('nVals.txt', 'w');
f2 = fopen('costs.txt', 'w');

while(Nmic <= 100)
	E1 = E2 = E3 = 1;
	Ex = 1;
	x=0;
	i=0;
	tmp = Nmac;
	while(x <= Nmic)
		E1 = (AmicA*E1)/(x+AmicA*E1);
		E2 = (AmicB*E2)/(x+AmicB*E2);
		E3 = (AmicC*E3)/(x+AmicC*E3);
		x++;
	endwhile

	M1 = AmicA*E1;
	V1 = M1*(1-M1+1*(AmicA/(Nmic+1-AmicA+M1)));

	M2 = AmicB*E2;
	V2 = M2*(1-M2+1*(AmicB/(Nmic+1-AmicB+M2)));

	M3 = AmicC*E3;
	V3 = M3*(1-M3+1*(AmicC/(Nmic+1-AmicC+M3)));

	while(Ex > B)
		E4 = 1;
		while(i <= Nmac)
			E4 = (Amac*E4)/(i+Amac*E4);
			M4 = Amac*E4;
			V4 = M4*(1-M4+1*(Amac/(i+1-Amac+M4)));

			M = M1+M2+M3+M4;
			V = V1+V2+V3+V4;
			Z = V/M;
			Astar = V+3*Z*(Z-1);
			Nstar = Astar*((M+Z)/(M+Z-1))-M-1;
			Ex = (Astar*Ex)/(i+Nstar+Astar*Ex);
			i++;
		endwhile
		Nmac++;
	endwhile
	fprintf(f1, "Nmic: %d \t Nmac: %d \t Astar: %d \t Ex: %d\n", Nmic, Nmac,
	Astar, Ex);
	TotalCost(cnt) = (MacCost*Nmac) + (MicCost*Nmic);
	fprintf(f2, "Mic Cost: %d \t Mac Cost: %d \t Total: %d\n", MicCost*Nmic,
	MacCost*Nmac, TotalCost(cnt));
	cnt++;
	Nmac = tmp;
	Nmic++;
	Nmac++;
endwhile

h = figure();
plot(0:1:100, TotalCost);
xlabel("Mic Channels");
ylabel("Total System Cost");
title("Total System Cost");
print(h, "Q6.pdf", "-dpdflatexstandalone");
system("pdflatex Q6.pdf")
system("pdftoppm Q6.pdf Q6 -png");
pause();

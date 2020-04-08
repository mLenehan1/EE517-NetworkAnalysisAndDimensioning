x = 0;
Ex = 1;
A = 10;
B = zeros(0,25);
IC = zeros(0,25);
BC = zeros(0,25);
Total = zeros(0,25);
f1 = fopen('erlang.txt', 'w');
f2 = fopen('costs.txt', 'w');
while(x<26)
	Ex = (A*Ex)/(x+A*Ex);
	fprintf(f1, "W: %d \t B: %d\n", x, Ex);
	x++;
	B(x) = Ex;
	IC(x) = 1.2*(x-1);
	BC(x) = 3.1*A*Ex;
	Total(x) = IC(x)+BC(x);
	fprintf(f2, "Installation: %d \t Blocking: %d \t Total: %d\n", IC(x),
	BC(x), Total(x));
endwhile
h=figure();
plot(0:1:25, Total);
xlabel("W - Number of Channels");
ylabel("Total Overall Cost");
title("Total Overall Cost vs. Number of Channels");
print(h, "Q5.pdf", "-dpdflatexstandalone")
system("pdflatex Q5.pdf")
system("pdftoppm Q5.pdf Q5 -png");
pause();

#!/bin/octave

x = -5:0.1:5;
y = -5:0.1:5;

eq1 = 5-4*(x);
eq2 = (3-5*x)/2;
eq3 = 3;
eq4 = -1;

h = figure();
plot(x, eq1, "-", x, eq2, "-", x, eq3, "--", x, eq4, "--", eq4, y, "--", 0.5, 3.0, "+");
axis([-4, 3, -4, 6], "equal", "on")
text(0.5, 3.0, ['$\displaystyle\leftarrow \textbf{Optimal Solution}$'])
xlabel("x");
ylabel("y");
title("Feasible Region for the function F=x+y");
print(h, "Q1.pdf", "-dpdflatexstandalone")
system("pdflatex Q1.pdf")
pause();

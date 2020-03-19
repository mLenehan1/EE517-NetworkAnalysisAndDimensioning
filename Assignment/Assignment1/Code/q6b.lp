/* Objective function */
min: 2y1 + y2 + y3 + 3y4 + y5;

/* Variable bounds */
h1: x1 +x2 + x3 = 17;
h2: x4 + x5 = 17;
h3: x6 + x7 = 12;
y1 >= x2 + x3 + x6;
y2 >= x1 + x7;
y3 >= x3 + x5 + x7;
y4 >= x1 + x3 + x5;
y5 >= x2 + x4;
c1: y1 <= 20;
c2: y2 <= 20;
c3: y3 <= 20;
c4: y4 <= 20;
c5: y5 <= 15;
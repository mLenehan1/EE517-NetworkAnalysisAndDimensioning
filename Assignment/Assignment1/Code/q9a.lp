/* Objective function */
min: m W 8u11 + 6u13 + 12u14 + 4u21 + 4u22 + 10u23 + 10u23 + u31 + 4u32 + 6u33;

/* Variable bounds */
m = 10;
h1 = 2;
h2 = 2;
h3 = 1;
2u11 + 2u13 + 2u22 + 2u23 + u33 <= W;
2u11 + 2u14 + 2u23 + u23 + u33 <= W;
2u13 + 2u14 + 2u22 + 2u23 <= W;
2u12 + 2u14 + 2u21 + u33 <= W;
2u12 + 2u13 + 2u23 + u31 <= W;
u11 + u12 + u13 + u14 = 1;
u21 + u22 + u23 = 1;
u31 + u32 + u33 = 1;
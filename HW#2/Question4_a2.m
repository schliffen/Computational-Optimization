clear; clc; close all;

f = @(x) myfunc1(x);
x0 = [0, 0.3]';

[x1_1, fx1_1, flag1_1, output1_1] = fminsearch(f, x0);
[x2_1, fx2_1, flag2_1, output2_1] = fminunc(f, x0);
options = optimoptions('fminunc', 'GradObj', 'on');
[x3_1, fx3_1, flag3_1, output3_1] = fminunc(f, x0, options);


x0 = [0, 0.3]';

[x1_2, fx1_2, flag1_2, output1_2] = fminsearch(f, x0);
[x2_2, fx2_2, flag2_2, output2_2] = fminunc(f, x0);
options = optimoptions('fminunc', 'GradObj', 'on');
[x3_2, fx3_2, flag3_2, output3_2] = fminunc(f, x0, options);

%


f = @(x) myfunc2(x);
x0 = [.75, -1.25]';

[x1_3, fx1_3, flag1_3, output1_3] = fminsearch(f, x0);
[x2_3, fx2_3, flag2_3, output2_3] = fminunc(f, x0);
options = optimoptions('fminunc', 'GradObj', 'on');
[x3_3, fx3_3, flag3_3, output3_3] = fminunc(f, x0, options);


x0 = [0, 0.3]';

[x1_4, fx1_4, flag1_4, output1_4] = fminsearch(f, x0);
[x2_4, fx2_4, flag2_4, output2_4] = fminunc(f, x0);
options = optimoptions('fminunc', 'GradObj', 'on');
[x3_4, fx3_4, flag3_4, output3_4] = fminunc(f, x0, options);
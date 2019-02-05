%--------------------------------------------------------------------------
%
% Returns ADF results (h), p-value (p) and t-stat (a).
%
%--------------------------------------------------------------------------


function ADFresult =  GetADF(B)

[h1,p1,a1] = adftest(B(:,1));
[h2,p2,a2] = adftest(B(:,2));
[h3,p3,a3] = adftest(B(:,3));
[h4,p4,a4] = adftest(B(:,4));
%[h5,p5,a5] = adftest(B(:,5));
%[h6,p6,a6] = adftest(B(:,6));
%[h7,p7,a7] = adftest(B(:,7));
%[h8,p8,a8] = adftest(B(:,8));
%[h9,p9,a9] = adftest(B(:,9));
%[h10,p10,a10] = adftest(B(:,10));

ADFresult = [a1 a2 a3 a4; ...%a5 a6 a7 a8 a9 a10; p1 p2 p3 p4 p5 p6 p7 p8 p9 p10];
    p1 p2 p3 p4];
end
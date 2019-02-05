%--------------------------------------------------------------------------
%
% Returns JB results (h), p-value (p) and t-stat (j).
%
%--------------------------------------------------------------------------


function JBresult =  GetJB(B)

[h1,p1,j1] = jbtest(B(:,1));
[h2,p2,j2] = jbtest(B(:,2));
[h3,p3,j3] = jbtest(B(:,3));
[h4,p4,j4] = jbtest(B(:,4));
%[h5,p5,j5] = jbtest(B(:,5));
%[h6,p6,j6] = jbtest(B(:,6));
%[h7,p7,j7] = jbtest(B(:,7));
%[h8,p8,j8] = jbtest(B(:,8));
%[h9,p9,j9] = jbtest(B(:,9));
%[h10,p10,j10] = jbtest(B(:,10));

JBresult = [h1 h2 h3 h4; ...%h5 h6 h7 h8 h9 h10; j1 j2 j3 j4 j5 j6 j7 j8 j9 j10;...
    j1 j2 j3 j4;
    p1 p2 p3 p4 ];%p5 p6 p7 p8 p9 p10];
end

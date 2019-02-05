%--------------------------------------------------------------------------
%
% Returns LBQ results (h), p-value (p) and t-stat (b) for 5 and 15 lags.
%
%--------------------------------------------------------------------------


function LBQresult =  GetLBQ(B)

C = B-mean(B);


[h1,p1,b1] = lbqtest(C(:,1),'lags',[5,15]);
[h2,p2,b2] = lbqtest(C(:,2),'lags',[5,15]);
[h3,p3,b3] = lbqtest(C(:,3),'lags',[5,15]);
[h4,p4,b4] = lbqtest(C(:,4),'lags',[5,15]);
%[h5,p5,b5] = lbqtest(C(:,5),'lags',[5,15]);
%[h6,p6,b6] = lbqtest(C(:,6),'lags',[5,15]);
%[h7,p7,b7] = lbqtest(C(:,7),'lags',[5,15]);
%[h8,p8,b8] = lbqtest(C(:,8),'lags',[5,15]);
%[h9,p9,b9] = lbqtest(C(:,9),'lags',[5,15]);
%[h10,p10,b10] = lbqtest(C(:,10),'lags',[5,15]);

LBQresult = [h1 h2 h3 h4; ...
    b1 b2 b3 b4;...%h5 h6 h7 h8 h9 h10; b1 b2 b3 b4 b5 b6 b7 b8 b9 b10...
    p1 p2 p3 p4 ];%p5 p6 p7 p8 p9 p10];
end
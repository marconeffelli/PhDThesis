clear; close all;clc;

%==========================================================================
%
%
%Table4.3 and Table4.4
%
%
%==========================================================================

%% Preallocate
T = zeros(35,12);

%% Generate T - 0.5 shrinkage
load('CS3_Ind_T60_p10_MC100')
for i=1:4
T(1,i) = FN.FN_identity(i,1);
T(2,i) = FN.FN_identity(i,6);
T(3,i) = FN.FN_Videntity(i,6);
T(4,i) = FN.FN_market(i,6);
T(5,i) = FN.FN_common(i,6);
T(6,i) = FN.FN_constant(i,6);
T(7,i) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T60_p50_MC100')
for i=1:4
T(1,i+4) = FN.FN_identity(i,1);
T(2,i+4) = FN.FN_identity(i,6);
T(3,i+4) = FN.FN_Videntity(i,6);
T(4,i+4) = FN.FN_market(i,6);
T(5,i+4) = FN.FN_common(i,6);
T(6,i+4) = FN.FN_constant(i,6);
T(7,i+4) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T60_p100_MC100')
for i=1:4
T(1,i+8) = FN.FN_identity(i,1);
T(2,i+8) = FN.FN_identity(i,6);
T(3,i+8) = FN.FN_Videntity(i,6);
T(4,i+8) = FN.FN_market(i,6);
T(5,i+8) = FN.FN_common(i,6);
T(6,i+8) = FN.FN_constant(i,6);
T(7,i+8) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T120_p10_MC100')
for i=1:4
T(8,i) = FN.FN_identity(i,1);
T(9,i) = FN.FN_identity(i,6);
T(10,i) = FN.FN_Videntity(i,6);
T(11,i) = FN.FN_market(i,6);
T(12,i) = FN.FN_common(i,6);
T(13,i) = FN.FN_constant(i,6);
T(14,i) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T120_p50_MC100')
for i=1:4
T(8,i+4) = FN.FN_identity(i,1);
T(9,i+4) = FN.FN_identity(i,6);
T(10,i+4) = FN.FN_Videntity(i,6);
T(11,i+4) = FN.FN_market(i,6);
T(12,i+4) = FN.FN_common(i,6);
T(13,i+4) = FN.FN_constant(i,6);
T(14,i+4) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T120_p100_MC100')
for i=1:4
T(8,i+8) = FN.FN_identity(i,1);
T(9,i+8) = FN.FN_identity(i,6);
T(10,i+8) = FN.FN_Videntity(i,6);
T(11,i+8) = FN.FN_market(i,6);
T(12,i+8) = FN.FN_common(i,6);
T(13,i+8) = FN.FN_constant(i,6);
T(14,i+8) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T180_p10_MC100')
for i=1:4
T(15,i) = FN.FN_identity(i,1);
T(16,i) = FN.FN_identity(i,6);
T(17,i) = FN.FN_Videntity(i,6);
T(18,i) = FN.FN_market(i,6);
T(19,i) = FN.FN_common(i,6);
T(20,i) = FN.FN_constant(i,6);
T(21,i) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T180_p50_MC100')
for i=1:4
T(15,i+4) = FN.FN_identity(i,1);
T(16,i+4) = FN.FN_identity(i,6);
T(17,i+4) = FN.FN_Videntity(i,6);
T(18,i+4) = FN.FN_market(i,6);
T(19,i+4) = FN.FN_common(i,6);
T(20,i+4) = FN.FN_constant(i,6);
T(21,i+4) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T180_p100_MC100')
for i=1:4
T(15,i+8) = FN.FN_identity(i,1);
T(16,i+8) = FN.FN_identity(i,6);
T(17,i+8) = FN.FN_Videntity(i,6);
T(18,i+8) = FN.FN_market(i,6);
T(19,i+8) = FN.FN_common(i,6);
T(20,i+8) = FN.FN_constant(i,6);
T(21,i+8) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T3000_p10_MC100')
for i=1:4
T(22,i) = FN.FN_identity(i,1);
T(23,i) = FN.FN_identity(i,6);
T(24,i) = FN.FN_Videntity(i,6);
T(25,i) = FN.FN_market(i,6);
T(26,i) = FN.FN_common(i,6);
T(27,i) = FN.FN_constant(i,6);
T(28,i) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T3000_p50_MC100')
for i=1:4
T(22,i+4) = FN.FN_identity(i,1);
T(23,i+4) = FN.FN_identity(i,6);
T(24,i+4) = FN.FN_Videntity(i,6);
T(25,i+4) = FN.FN_market(i,6);
T(26,i+4) = FN.FN_common(i,6);
T(27,i+4) = FN.FN_constant(i,6);
T(28,i+4) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T3000_p100_MC100')
for i=1:4
T(22,i+8) = FN.FN_identity(i,1);
T(23,i+8) = FN.FN_identity(i,6);
T(24,i+8) = FN.FN_Videntity(i,6);
T(25,i+8) = FN.FN_market(i,6);
T(26,i+8) = FN.FN_common(i,6);
T(27,i+8) = FN.FN_constant(i,6);
T(28,i+8) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T6000_p10_MC100')
for i=1:4
T(29,i) = FN.FN_identity(i,1);
T(30,i) = FN.FN_identity(i,6);
T(31,i) = FN.FN_Videntity(i,6);
T(32,i) = FN.FN_market(i,6);
T(33,i) = FN.FN_common(i,6);
T(34,i) = FN.FN_constant(i,6);
T(35,i) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T6000_p50_MC100')
for i=1:4
T(29,i+4) = FN.FN_identity(i,1);
T(30,i+4) = FN.FN_identity(i,6);
T(31,i+4) = FN.FN_Videntity(i,6);
T(32,i+4) = FN.FN_market(i,6);
T(33,i+4) = FN.FN_common(i,6);
T(34,i+4) = FN.FN_constant(i,6);
T(35,i+4) = FN.FN_dcc(i,6);
end

load('CS3_Ind_T6000_p100_MC100')
for i=1:4
T(29,i+8) = FN.FN_identity(i,1);
T(30,i+8) = FN.FN_identity(i,6);
T(31,i+8) = FN.FN_Videntity(i,6);
T(32,i+8) = FN.FN_market(i,6);
T(33,i+8) = FN.FN_common(i,6);
T(34,i+8) = FN.FN_constant(i,6);
T(35,i+8) = FN.FN_dcc(i,6);
end

%% Generate T - mean for all shrinkage intensity spectrum
load('CS3_Ind_T60_p10_MC100')
for i=1:4
TMean(1,i) = mean(FN.FN_identity(i,2:end));
TMean(2,i) = mean(FN.FN_Videntity(i,2:end));
TMean(3,i) = mean(FN.FN_market(i,2:end));
TMean(4,i) = mean(FN.FN_common(i,2:end));
TMean(5,i) = mean(FN.FN_constant(i,2:end));
TMean(6,i) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T60_p50_MC100')
for i=1:4
TMean(1,i+4) = mean(FN.FN_identity(i,2:end));
TMean(2,i+4) = mean(FN.FN_Videntity(i,2:end));
TMean(3,i+4) = mean(FN.FN_market(i,2:end));
TMean(4,i+4) = mean(FN.FN_common(i,2:end));
TMean(5,i+4) = mean(FN.FN_constant(i,2:end));
TMean(6,i+4) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T60_p100_MC100')
for i=1:4
TMean(1,i+8) = mean(FN.FN_identity(i,2:end));
TMean(2,i+8) = mean(FN.FN_Videntity(i,2:end));
TMean(3,i+8) = mean(FN.FN_market(i,2:end));
TMean(4,i+8) = mean(FN.FN_common(i,2:end));
TMean(5,i+8) = mean(FN.FN_constant(i,2:end));
TMean(6,i+8) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p10_MC100')
for i=1:4
TMean(7,i) = mean(FN.FN_identity(i,2:end));
TMean(8,i) = mean(FN.FN_Videntity(i,2:end));
TMean(9,i) = mean(FN.FN_market(i,2:end));
TMean(10,i) = mean(FN.FN_common(i,2:end));
TMean(11,i) = mean(FN.FN_constant(i,2:end));
TMean(12,i) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p50_MC100')
for i=1:4
TMean(7,i+4) = mean(FN.FN_identity(i,2:end));
TMean(8,i+4) = mean(FN.FN_Videntity(i,2:end));
TMean(9,i+4) = mean(FN.FN_market(i,2:end));
TMean(10,i+4) = mean(FN.FN_common(i,2:end));
TMean(11,i+4) = mean(FN.FN_constant(i,2:end));
TMean(12,i+4) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p100_MC100')
for i=1:4
TMean(7,i+8) = mean(FN.FN_identity(i,2:end));
TMean(8,i+8) = mean(FN.FN_Videntity(i,2:end));
TMean(9,i+8) = mean(FN.FN_market(i,2:end));
TMean(10,i+8) = mean(FN.FN_common(i,2:end));
TMean(11,i+8) = mean(FN.FN_constant(i,2:end));
TMean(12,i+8) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p10_MC100')
for i=1:4
TMean(13,i) = mean(FN.FN_identity(i,2:end));
TMean(14,i) = mean(FN.FN_Videntity(i,2:end));
TMean(15,i) = mean(FN.FN_market(i,2:end));
TMean(16,i) = mean(FN.FN_common(i,2:end));
TMean(17,i) = mean(FN.FN_constant(i,2:end));
TMean(18,i) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p50_MC100')
for i=1:4
TMean(13,i+4) = mean(FN.FN_identity(i,2:end));
TMean(14,i+4) = mean(FN.FN_Videntity(i,2:end));
TMean(15,i+4) = mean(FN.FN_market(i,2:end));
TMean(16,i+4) = mean(FN.FN_common(i,2:end));
TMean(17,i+4) = mean(FN.FN_constant(i,2:end));
TMean(18,i+4) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p100_MC100')
for i=1:4
TMean(13,i+8) = mean(FN.FN_identity(i,2:end));
TMean(14,i+8) = mean(FN.FN_Videntity(i,2:end));
TMean(15,i+8) = mean(FN.FN_market(i,2:end));
TMean(16,i+8) = mean(FN.FN_common(i,2:end));
TMean(17,i+8) = mean(FN.FN_constant(i,2:end));
TMean(18,i+8) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p10_MC100')
for i=1:4
TMean(19,i) = mean(FN.FN_identity(i,2:end));
TMean(20,i) = mean(FN.FN_Videntity(i,2:end));
TMean(21,i) = mean(FN.FN_market(i,2:end));
TMean(22,i) = mean(FN.FN_common(i,2:end));
TMean(23,i) = mean(FN.FN_constant(i,2:end));
TMean(24,i) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p50_MC100')
for i=1:4
TMean(19,i+4) = mean(FN.FN_identity(i,2:end));
TMean(20,i+4) = mean(FN.FN_Videntity(i,2:end));
TMean(21,i+4) = mean(FN.FN_market(i,2:end));
TMean(22,i+4) = mean(FN.FN_common(i,2:end));
TMean(23,i+4) = mean(FN.FN_constant(i,2:end));
TMean(24,i+4) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p100_MC100')
for i=1:4
TMean(19,i+8) = mean(FN.FN_identity(i,2:end));
TMean(20,i+8) = mean(FN.FN_Videntity(i,2:end));
TMean(21,i+8) = mean(FN.FN_market(i,2:end));
TMean(22,i+8) = mean(FN.FN_common(i,2:end));
TMean(23,i+8) = mean(FN.FN_constant(i,2:end));
TMean(24,i+8) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p10_MC100')
for i=1:4
TMean(25,i) = mean(FN.FN_identity(i,2:end));
TMean(26,i) = mean(FN.FN_Videntity(i,2:end));
TMean(27,i) = mean(FN.FN_market(i,2:end));
TMean(28,i) = mean(FN.FN_common(i,2:end));
TMean(29,i) = mean(FN.FN_constant(i,2:end));
TMean(30,i) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p50_MC100')
for i=1:4
TMean(25,i+4) = mean(FN.FN_identity(i,2:end));
TMean(26,i+4) = mean(FN.FN_Videntity(i,2:end));
TMean(27,i+4) = mean(FN.FN_market(i,2:end));
TMean(28,i+4) = mean(FN.FN_common(i,2:end));
TMean(29,i+4) = mean(FN.FN_constant(i,2:end));
TMean(30,i+4) = mean(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p100_MC100')
for i=1:4
TMean(25,i+8) = mean(FN.FN_identity(i,2:end));
TMean(26,i+8) = mean(FN.FN_Videntity(i,2:end));
TMean(27,i+8) = mean(FN.FN_market(i,2:end));
TMean(28,i+8) = mean(FN.FN_common(i,2:end));
TMean(29,i+8) = mean(FN.FN_constant(i,2:end));
TMean(30,i+8) = mean(FN.FN_dcc(i,2:end));
end


%% Generate TMax

load('CS3_Ind_T60_p10_MC100')
for i=1:4
TMax(1,i) = FN.FN_identity(i,1);
[TMax(2,i),ind(1,i)] = max(FN.FN_identity(i,2:end));
[TMax(3,i),ind(2,i)] = max(FN.FN_Videntity(i,2:end));
[TMax(4,i),ind(3,i)] = max(FN.FN_market(i,2:end));
[TMax(5,i),ind(4,i)] = max(FN.FN_common(i,2:end));
[TMax(6,i),ind(5,i)]= max(FN.FN_constant(i,2:end));
[TMax(7,i),ind(6,i)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T60_p50_MC100')
for i=1:4
TMax(1,i+4) = FN.FN_identity(i,1);
[TMax(2,i+4),ind(1,i+4)] = max(FN.FN_identity(i,2:end));
[TMax(3,i+4),ind(2,i+4)] = max(FN.FN_Videntity(i,2:end));
[TMax(4,i+4),ind(3,i+4)] = max(FN.FN_market(i,2:end));
[TMax(5,i+4),ind(4,i+4)] = max(FN.FN_common(i,2:end));
[TMax(6,i+4),ind(5,i+4)]= max(FN.FN_constant(i,2:end));
[TMax(7,i+4),ind(6,i+4)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T60_p100_MC100')
for i=1:4
TMax(1,i+8) = FN.FN_identity(i,1);
[TMax(2,i+8),ind(1,i+8)] = max(FN.FN_identity(i,2:end));
[TMax(3,i+8),ind(2,i+8)] = max(FN.FN_Videntity(i,2:end));
[TMax(4,i+8),ind(3,i+8)] = max(FN.FN_market(i,2:end));
[TMax(5,i+8),ind(4,i+8)] = max(FN.FN_common(i,2:end));
[TMax(6,i+8),ind(5,i+8)]= max(FN.FN_constant(i,2:end));
[TMax(7,i+8),ind(6,i+8)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p10_MC100')
for i=1:4
TMax(8,i) = FN.FN_identity(i,1);
[TMax(9,i),ind(7,i)] = max(FN.FN_identity(i,2:end));
[TMax(10,i),ind(8,i)] = max(FN.FN_Videntity(i,2:end));
[TMax(11,i),ind(9,i)] = max(FN.FN_market(i,2:end));
[TMax(12,i),ind(10,i)] = max(FN.FN_common(i,2:end));
[TMax(13,i),ind(11,i)]= max(FN.FN_constant(i,2:end));
[TMax(14,i),ind(12,i)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p50_MC100')
for i=1:4
TMax(8,i+4) = FN.FN_identity(i,1);
[TMax(9,i+4),ind(7,i+4)] = max(FN.FN_identity(i,2:end));
[TMax(10,i+4),ind(8,i+4)] = max(FN.FN_Videntity(i,2:end));
[TMax(11,i+4),ind(9,i+4)] = max(FN.FN_market(i,2:end));
[TMax(12,i+4),ind(10,i+4)] = max(FN.FN_common(i,2:end));
[TMax(13,i+4),ind(11,i+4)]= max(FN.FN_constant(i,2:end));
[TMax(14,i+4),ind(12,i+4)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p100_MC100')
for i=1:4
TMax(8,i+8) = FN.FN_identity(i,1);
[TMax(9,i+8),ind(7,i+8)] = max(FN.FN_identity(i,2:end));
[TMax(10,i+8),ind(8,i+8)] = max(FN.FN_Videntity(i,2:end));
[TMax(11,i+8),ind(9,i+8)] = max(FN.FN_market(i,2:end));
[TMax(12,i+8),ind(10,i+8)] = max(FN.FN_common(i,2:end));
[TMax(13,i+8),ind(11,i+8)]= max(FN.FN_constant(i,2:end));
[TMax(14,i+8),ind(12,i+8)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p10_MC100')
for i=1:4
TMax(15,i) = FN.FN_identity(i,1);
[TMax(16,i),ind(13,i)] = max(FN.FN_identity(i,2:end));
[TMax(17,i),ind(14,i)] = max(FN.FN_Videntity(i,2:end));
[TMax(18,i),ind(15,i)] = max(FN.FN_market(i,2:end));
[TMax(19,i),ind(16,i)] = max(FN.FN_common(i,2:end));
[TMax(20,i),ind(17,i)]= max(FN.FN_constant(i,2:end));
[TMax(21,i),ind(18,i)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p50_MC100')
for i=1:4
TMax(15,i+4) = FN.FN_identity(i,1);
[TMax(16,i+4),ind(13,i+4)] = max(FN.FN_identity(i,2:end));
[TMax(17,i+4),ind(14,i+4)] = max(FN.FN_Videntity(i,2:end));
[TMax(18,i+4),ind(15,i+4)] = max(FN.FN_market(i,2:end));
[TMax(19,i+4),ind(16,i+4)] = max(FN.FN_common(i,2:end));
[TMax(20,i+4),ind(17,i+4)]= max(FN.FN_constant(i,2:end));
[TMax(21,i+4),ind(18,i+4)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p100_MC100')
for i=1:4
TMax(15,i+8) = FN.FN_identity(i,1);
[TMax(16,i+8),ind(13,i+8)] = max(FN.FN_identity(i,2:end));
[TMax(17,i+8),ind(14,i+8)] = max(FN.FN_Videntity(i,2:end));
[TMax(18,i+8),ind(15,i+8)] = max(FN.FN_market(i,2:end));
[TMax(19,i+8),ind(16,i+8)] = max(FN.FN_common(i,2:end));
[TMax(20,i+8),ind(17,i+8)]= max(FN.FN_constant(i,2:end));
[TMax(21,i+8),ind(18,i+8)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p10_MC100')
for i=1:4
TMax(22,i) = FN.FN_identity(i,1);
[TMax(23,i),ind(19,i)] = max(FN.FN_identity(i,2:end));
[TMax(24,i),ind(20,i)] = max(FN.FN_Videntity(i,2:end));
[TMax(25,i),ind(21,i)] = max(FN.FN_market(i,2:end));
[TMax(26,i),ind(22,i)] = max(FN.FN_common(i,2:end));
[TMax(27,i),ind(23,i)]= max(FN.FN_constant(i,2:end));
[TMax(28,i),ind(24,i)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p50_MC100')
for i=1:4
TMax(22,i+4) = FN.FN_identity(i,1);
[TMax(23,i+4),ind(19,i+4)] = max(FN.FN_identity(i,2:end));
[TMax(24,i+4),ind(20,i+4)] = max(FN.FN_Videntity(i,2:end));
[TMax(25,i+4),ind(21,i+4)] = max(FN.FN_market(i,2:end));
[TMax(26,i+4),ind(22,i+4)] = max(FN.FN_common(i,2:end));
[TMax(27,i+4),ind(23,i+4)]= max(FN.FN_constant(i,2:end));
[TMax(28,i+4),ind(24,i+4)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p100_MC100')
for i=1:4
TMax(22,i+8) = FN.FN_identity(i,1);
[TMax(23,i+8),ind(19,i+8)] = max(FN.FN_identity(i,2:end));
[TMax(24,i+8),ind(20,i+8)] = max(FN.FN_Videntity(i,2:end));
[TMax(25,i+8),ind(21,i+8)] = max(FN.FN_market(i,2:end));
[TMax(26,i+8),ind(22,i+8)] = max(FN.FN_common(i,2:end));
[TMax(27,i+8),ind(23,i+8)]= max(FN.FN_constant(i,2:end));
[TMax(28,i+8),ind(24,i+8)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p10_MC100')
for i=1:4
TMax(29,i) = FN.FN_identity(i,1);
[TMax(30,i),ind(25,i)] = max(FN.FN_identity(i,2:end));
[TMax(31,i),ind(26,i)] = max(FN.FN_Videntity(i,2:end));
[TMax(32,i),ind(27,i)] = max(FN.FN_market(i,2:end));
[TMax(33,i),ind(28,i)] = max(FN.FN_common(i,2:end));
[TMax(34,i),ind(29,i)]= max(FN.FN_constant(i,2:end));
[TMax(35,i),ind(30,i)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p50_MC100')
for i=1:4
TMax(29,i+4) = FN.FN_identity(i,1);
[TMax(30,i+4),ind(25,i+4)] = max(FN.FN_identity(i,2:end));
[TMax(31,i+4),ind(26,i+4)] = max(FN.FN_Videntity(i,2:end));
[TMax(32,i+4),ind(27,i+4)] = max(FN.FN_market(i,2:end));
[TMax(33,i+4),ind(28,i+4)] = max(FN.FN_common(i,2:end));
[TMax(34,i+4),ind(29,i+4)]= max(FN.FN_constant(i,2:end));
[TMax(35,i+4),ind(30,i+4)] = max(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p100_MC100')
for i=1:4
TMax(29,i+8) = FN.FN_identity(i,1);
[TMax(30,i+8),ind(25,i+8)] = max(FN.FN_identity(i,2:end));
[TMax(31,i+8),ind(26,i+8)] = max(FN.FN_Videntity(i,2:end));
[TMax(32,i+8),ind(27,i+8)] = max(FN.FN_market(i,2:end));
[TMax(33,i+8),ind(28,i+8)] = max(FN.FN_common(i,2:end));
[TMax(34,i+8),ind(29,i+8)]= max(FN.FN_constant(i,2:end));
[TMax(35,i+8),ind(30,i+8)] = max(FN.FN_dcc(i,2:end));
end

%% Generate TMin
load('CS3_Ind_T60_p10_MC100')
for i=1:4
TMin(1,i) = FN.FN_identity(i,1);
[TMin(2,i),ind(1,i)] = min(FN.FN_identity(i,2:end));
[TMin(3,i),ind(2,i)] = min(FN.FN_Videntity(i,2:end));
[TMin(4,i),ind(3,i)] = min(FN.FN_market(i,2:end));
[TMin(5,i),ind(4,i)] = min(FN.FN_common(i,2:end));
[TMin(6,i),ind(5,i)]= min(FN.FN_constant(i,2:end));
[TMin(7,i),ind(6,i)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T60_p50_MC100')
for i=1:4
TMin(1,i+4) = FN.FN_identity(i,1);
[TMin(2,i+4),ind(1,i+4)] = min(FN.FN_identity(i,2:end));
[TMin(3,i+4),ind(2,i+4)] = min(FN.FN_Videntity(i,2:end));
[TMin(4,i+4),ind(3,i+4)] = min(FN.FN_market(i,2:end));
[TMin(5,i+4),ind(4,i+4)] = min(FN.FN_common(i,2:end));
[TMin(6,i+4),ind(5,i+4)]= min(FN.FN_constant(i,2:end));
[TMin(7,i+4),ind(6,i+4)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T60_p100_MC100')
for i=1:4
TMin(1,i+8) = FN.FN_identity(i,1);
[TMin(2,i+8),ind(1,i+8)] = min(FN.FN_identity(i,2:end));
[TMin(3,i+8),ind(2,i+8)] = min(FN.FN_Videntity(i,2:end));
[TMin(4,i+8),ind(3,i+8)] = min(FN.FN_market(i,2:end));
[TMin(5,i+8),ind(4,i+8)] = min(FN.FN_common(i,2:end));
[TMin(6,i+8),ind(5,i+8)]= min(FN.FN_constant(i,2:end));
[TMin(7,i+8),ind(6,i+8)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p10_MC100')
for i=1:4
TMin(8,i) = FN.FN_identity(i,1);
[TMin(9,i),ind(7,i)] = min(FN.FN_identity(i,2:end));
[TMin(10,i),ind(8,i)] = min(FN.FN_Videntity(i,2:end));
[TMin(11,i),ind(9,i)] = min(FN.FN_market(i,2:end));
[TMin(12,i),ind(10,i)] = min(FN.FN_common(i,2:end));
[TMin(13,i),ind(11,i)]= min(FN.FN_constant(i,2:end));
[TMin(14,i),ind(12,i)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p50_MC100')
for i=1:4
TMin(8,i+4) = FN.FN_identity(i,1);
[TMin(9,i+4),ind(7,i+4)] = min(FN.FN_identity(i,2:end));
[TMin(10,i+4),ind(8,i+4)] = min(FN.FN_Videntity(i,2:end));
[TMin(11,i+4),ind(9,i+4)] = min(FN.FN_market(i,2:end));
[TMin(12,i+4),ind(10,i+4)] = min(FN.FN_common(i,2:end));
[TMin(13,i+4),ind(11,i+4)]= min(FN.FN_constant(i,2:end));
[TMin(14,i+4),ind(12,i+4)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p100_MC100')
for i=1:4
TMin(8,i+8) = FN.FN_identity(i,1);
[TMin(9,i+8),ind(7,i+8)] = min(FN.FN_identity(i,2:end));
[TMin(10,i+8),ind(8,i+8)] = min(FN.FN_Videntity(i,2:end));
[TMin(11,i+8),ind(9,i+8)] = min(FN.FN_market(i,2:end));
[TMin(12,i+8),ind(10,i+8)] = min(FN.FN_common(i,2:end));
[TMin(13,i+8),ind(11,i+8)]= min(FN.FN_constant(i,2:end));
[TMin(14,i+8),ind(12,i+8)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p10_MC100')
for i=1:4
TMin(15,i) = FN.FN_identity(i,1);
[TMin(16,i),ind(13,i)] = min(FN.FN_identity(i,2:end));
[TMin(17,i),ind(14,i)] = min(FN.FN_Videntity(i,2:end));
[TMin(18,i),ind(15,i)] = min(FN.FN_market(i,2:end));
[TMin(19,i),ind(16,i)] = min(FN.FN_common(i,2:end));
[TMin(20,i),ind(17,i)]= min(FN.FN_constant(i,2:end));
[TMin(21,i),ind(18,i)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p50_MC100')
for i=1:4
TMin(15,i+4) = FN.FN_identity(i,1);
[TMin(16,i+4),ind(13,i+4)] = min(FN.FN_identity(i,2:end));
[TMin(17,i+4),ind(14,i+4)] = min(FN.FN_Videntity(i,2:end));
[TMin(18,i+4),ind(15,i+4)] = min(FN.FN_market(i,2:end));
[TMin(19,i+4),ind(16,i+4)] = min(FN.FN_common(i,2:end));
[TMin(20,i+4),ind(17,i+4)]= min(FN.FN_constant(i,2:end));
[TMin(21,i+4),ind(18,i+4)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p100_MC100')
for i=1:4
TMin(15,i+8) = FN.FN_identity(i,1);
[TMin(16,i+8),ind(13,i+8)] = min(FN.FN_identity(i,2:end));
[TMin(17,i+8),ind(14,i+8)] = min(FN.FN_Videntity(i,2:end));
[TMin(18,i+8),ind(15,i+8)] = min(FN.FN_market(i,2:end));
[TMin(19,i+8),ind(16,i+8)] = min(FN.FN_common(i,2:end));
[TMin(20,i+8),ind(17,i+8)]= min(FN.FN_constant(i,2:end));
[TMin(21,i+8),ind(18,i+8)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p10_MC100')
for i=1:4
TMin(22,i) = FN.FN_identity(i,1);
[TMin(23,i),ind(19,i)] = min(FN.FN_identity(i,2:end));
[TMin(24,i),ind(20,i)] = min(FN.FN_Videntity(i,2:end));
[TMin(25,i),ind(21,i)] = min(FN.FN_market(i,2:end));
[TMin(26,i),ind(22,i)] = min(FN.FN_common(i,2:end));
[TMin(27,i),ind(23,i)]= min(FN.FN_constant(i,2:end));
[TMin(28,i),ind(24,i)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p50_MC100')
for i=1:4
TMin(22,i+4) = FN.FN_identity(i,1);
[TMin(23,i+4),ind(19,i+4)] = min(FN.FN_identity(i,2:end));
[TMin(24,i+4),ind(20,i+4)] = min(FN.FN_Videntity(i,2:end));
[TMin(25,i+4),ind(21,i+4)] = min(FN.FN_market(i,2:end));
[TMin(26,i+4),ind(22,i+4)] = min(FN.FN_common(i,2:end));
[TMin(27,i+4),ind(23,i+4)]= min(FN.FN_constant(i,2:end));
[TMin(28,i+4),ind(24,i+4)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p100_MC100')
for i=1:4
TMin(22,i+8) = FN.FN_identity(i,1);
[TMin(23,i+8),ind(19,i+8)] = min(FN.FN_identity(i,2:end));
[TMin(24,i+8),ind(20,i+8)] = min(FN.FN_Videntity(i,2:end));
[TMin(25,i+8),ind(21,i+8)] = min(FN.FN_market(i,2:end));
[TMin(26,i+8),ind(22,i+8)] = min(FN.FN_common(i,2:end));
[TMin(27,i+8),ind(23,i+8)]= min(FN.FN_constant(i,2:end));
[TMin(28,i+8),ind(24,i+8)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p10_MC100')
for i=1:4
TMin(29,i) = FN.FN_identity(i,1);
[TMin(30,i),ind(25,i)] = min(FN.FN_identity(i,2:end));
[TMin(31,i),ind(26,i)] = min(FN.FN_Videntity(i,2:end));
[TMin(32,i),ind(27,i)] = min(FN.FN_market(i,2:end));
[TMin(33,i),ind(28,i)] = min(FN.FN_common(i,2:end));
[TMin(34,i),ind(29,i)]= min(FN.FN_constant(i,2:end));
[TMin(35,i),ind(30,i)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p50_MC100')
for i=1:4
TMin(29,i+4) = FN.FN_identity(i,1);
[TMin(30,i+4),ind(25,i+4)] = min(FN.FN_identity(i,2:end));
[TMin(31,i+4),ind(26,i+4)] = min(FN.FN_Videntity(i,2:end));
[TMin(32,i+4),ind(27,i+4)] = min(FN.FN_market(i,2:end));
[TMin(33,i+4),ind(28,i+4)] = min(FN.FN_common(i,2:end));
[TMin(34,i+4),ind(29,i+4)]= min(FN.FN_constant(i,2:end));
[TMin(35,i+4),ind(30,i+4)] = min(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p100_MC100')
for i=1:4
TMin(29,i+8) = FN.FN_identity(i,1);
[TMin(30,i+8),ind(25,i+8)] = min(FN.FN_identity(i,2:end));
[TMin(31,i+8),ind(26,i+8)] = min(FN.FN_Videntity(i,2:end));
[TMin(32,i+8),ind(27,i+8)] = min(FN.FN_market(i,2:end));
[TMin(33,i+8),ind(28,i+8)] = min(FN.FN_common(i,2:end));
[TMin(34,i+8),ind(29,i+8)]= min(FN.FN_constant(i,2:end));
[TMin(35,i+8),ind(30,i+8)] = min(FN.FN_dcc(i,2:end));
end


%% Generate Std - Sensitivity to Shrinkage Intensity
load('CS3_Ind_T60_p10_MC100')
for i=1:4
TStd(1,i) = std(FN.FN_identity(i,2:end));
TStd(2,i) = std(FN.FN_Videntity(i,2:end));
TStd(3,i) = std(FN.FN_market(i,2:end));
TStd(4,i) = std(FN.FN_common(i,2:end));
TStd(5,i) = std(FN.FN_constant(i,2:end));
TStd(6,i) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T60_p50_MC100')
for i=1:4
TStd(1,i+4) = std(FN.FN_identity(i,2:end));
TStd(2,i+4) = std(FN.FN_Videntity(i,2:end));
TStd(3,i+4) = std(FN.FN_market(i,2:end));
TStd(4,i+4) = std(FN.FN_common(i,2:end));
TStd(5,i+4) = std(FN.FN_constant(i,2:end));
TStd(6,i+4) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T60_p100_MC100')
for i=1:4
TStd(1,i+8) = std(FN.FN_identity(i,2:end));
TStd(2,i+8) = std(FN.FN_Videntity(i,2:end));
TStd(3,i+8) = std(FN.FN_market(i,2:end));
TStd(4,i+8) = std(FN.FN_common(i,2:end));
TStd(5,i+8) = std(FN.FN_constant(i,2:end));
TStd(6,i+8) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p10_MC100')
for i=1:4
TStd(7,i) = std(FN.FN_identity(i,2:end));
TStd(8,i) = std(FN.FN_Videntity(i,2:end));
TStd(9,i) = std(FN.FN_market(i,2:end));
TStd(10,i) = std(FN.FN_common(i,2:end));
TStd(11,i) = std(FN.FN_constant(i,2:end));
TStd(12,i) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p50_MC100')
for i=1:4
TStd(7,i+4) = std(FN.FN_identity(i,2:end));
TStd(8,i+4) = std(FN.FN_Videntity(i,2:end));
TStd(9,i+4) = std(FN.FN_market(i,2:end));
TStd(10,i+4) = std(FN.FN_common(i,2:end));
TStd(11,i+4) = std(FN.FN_constant(i,2:end));
TStd(12,i+4) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T120_p100_MC100')
for i=1:4
TStd(7,i+8) = std(FN.FN_identity(i,2:end));
TStd(8,i+8) = std(FN.FN_Videntity(i,2:end));
TStd(9,i+8) = std(FN.FN_market(i,2:end));
TStd(10,i+8) = std(FN.FN_common(i,2:end));
TStd(11,i+8) = std(FN.FN_constant(i,2:end));
TStd(12,i+8) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p10_MC100')
for i=1:4
TStd(13,i) = std(FN.FN_identity(i,2:end));
TStd(14,i) = std(FN.FN_Videntity(i,2:end));
TStd(15,i) = std(FN.FN_market(i,2:end));
TStd(16,i) = std(FN.FN_common(i,2:end));
TStd(17,i) = std(FN.FN_constant(i,2:end));
TStd(18,i) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p50_MC100')
for i=1:4
TStd(13,i+4) = std(FN.FN_identity(i,2:end));
TStd(14,i+4) = std(FN.FN_Videntity(i,2:end));
TStd(15,i+4) = std(FN.FN_market(i,2:end));
TStd(16,i+4) = std(FN.FN_common(i,2:end));
TStd(17,i+4) = std(FN.FN_constant(i,2:end));
TStd(18,i+4) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T180_p100_MC100')
for i=1:4
TStd(13,i+8) = std(FN.FN_identity(i,2:end));
TStd(14,i+8) = std(FN.FN_Videntity(i,2:end));
TStd(15,i+8) = std(FN.FN_market(i,2:end));
TStd(16,i+8) = std(FN.FN_common(i,2:end));
TStd(17,i+8) = std(FN.FN_constant(i,2:end));
TStd(18,i+8) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p10_MC100')
for i=1:4
TStd(19,i) = std(FN.FN_identity(i,2:end));
TStd(20,i) = std(FN.FN_Videntity(i,2:end));
TStd(21,i) = std(FN.FN_market(i,2:end));
TStd(22,i) = std(FN.FN_common(i,2:end));
TStd(23,i) = std(FN.FN_constant(i,2:end));
TStd(24,i) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p50_MC100')
for i=1:4
TStd(19,i+4) = std(FN.FN_identity(i,2:end));
TStd(20,i+4) = std(FN.FN_Videntity(i,2:end));
TStd(21,i+4) = std(FN.FN_market(i,2:end));
TStd(22,i+4) = std(FN.FN_common(i,2:end));
TStd(23,i+4) = std(FN.FN_constant(i,2:end));
TStd(24,i+4) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T3000_p100_MC100')
for i=1:4
TStd(19,i+8) = std(FN.FN_identity(i,2:end));
TStd(20,i+8) = std(FN.FN_Videntity(i,2:end));
TStd(21,i+8) = std(FN.FN_market(i,2:end));
TStd(22,i+8) = std(FN.FN_common(i,2:end));
TStd(23,i+8) = std(FN.FN_constant(i,2:end));
TStd(24,i+8) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p10_MC100')
for i=1:4
TStd(25,i) = std(FN.FN_identity(i,2:end));
TStd(26,i) = std(FN.FN_Videntity(i,2:end));
TStd(27,i) = std(FN.FN_market(i,2:end));
TStd(28,i) = std(FN.FN_common(i,2:end));
TStd(29,i) = std(FN.FN_constant(i,2:end));
TStd(30,i) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p50_MC100')
for i=1:4
TStd(25,i+4) = std(FN.FN_identity(i,2:end));
TStd(26,i+4) = std(FN.FN_Videntity(i,2:end));
TStd(27,i+4) = std(FN.FN_market(i,2:end));
TStd(28,i+4) = std(FN.FN_common(i,2:end));
TStd(29,i+4) = std(FN.FN_constant(i,2:end));
TStd(30,i+4) = std(FN.FN_dcc(i,2:end));
end

load('CS3_Ind_T6000_p100_MC100')
for i=1:4
TStd(25,i+8) = std(FN.FN_identity(i,2:end));
TStd(26,i+8) = std(FN.FN_Videntity(i,2:end));
TStd(27,i+8) = std(FN.FN_market(i,2:end));
TStd(28,i+8) = std(FN.FN_common(i,2:end));
TStd(29,i+8) = std(FN.FN_constant(i,2:end));
TStd(30,i+8) = std(FN.FN_dcc(i,2:end));
end
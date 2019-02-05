close all; clear; clc;

%==========================================================================
%
%
%Figure3.10
%
%
%==========================================================================

load('Rates')


plot(t,SpotRates)
xlabel('Time')
ylabel('Interest Rate')
tstart = t(1);
tend = t(end);
xlim([tstart tend])
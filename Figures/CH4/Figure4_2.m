clear;close all;clc;

%==========================================================================
%
%
%Figure4.2
%
%
%==========================================================================

load('Figure4_2and4_3')

tratio10 = [ratio10(1,1) ratio10(1,3:end)];
tratio50 = [ratio50(1,1) ratio50(1,3:end)];
tratio100 = [ratio100(1,1) ratio100(1,3:end)];

[X,Y] = meshgrid(sk,ratio10);
figure(1)
subplot(3,6,1)
surf(X,Y,Distances_identity10(:,[1 3 6 9 12]))
yticks(tratio10)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$', '$\frac{50}{60}$', '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
title("Id")
zlabel('p=10','FontSize',10,'FontWeight','bold')
subplot(3,6,2)
surf(X,Y,Distances_pinv10(:,[1 3 6 9 12]))
yticks(tratio10)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
title("VId")
subplot(3,6,3)
surf(X,Y,Distances_market10(:,[1 3 6 9 12]))
yticks(tratio10)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
title("SI")
subplot(3,6,4)
surf(X,Y,Distances_common10(:,[1 3 6 9 12]))
yticks(tratio10)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$', '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
title("CV")
subplot(3,6,5)
surf(X,Y,Distances_constant10(:,[1 3 6 9 12]))
yticks(tratio10)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
title("CC")
subplot(3,6,6)
surf(X,Y,Distances_dcc10(:,[1 3 6 9 12]))
yticks(tratio10)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
title("EWMA")

[X,Y] = meshgrid(sk,ratio50);
figure(1)
subplot(3,6,7)
surf(X,Y,Distances_identity50(:,[1 3 6 9 12]))
yticks(tratio50)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
zlabel('p=50','FontSize',10,'FontWeight','bold')
subplot(3,6,8)
surf(X,Y,Distances_pinv50(:,[1 3 6 9 12]))
yticks(tratio50)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
subplot(3,6,9)
surf(X,Y,Distances_market50(:,[1 3 6 9 12]))
yticks(tratio50)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
subplot(3,6,10)
surf(X,Y,Distances_common50(:,[1 3 6 9 12]))
yticks(tratio50)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
subplot(3,6,11)
surf(X,Y,Distances_constant50(:,[1 3 6 9 12]))
yticks(tratio50)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
subplot(3,6,12)
surf(X,Y,Distances_dcc50(:,[1 3 6 9 12]))
yticks(tratio50)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)

[X,Y] = meshgrid(sk,ratio100);
figure(1)
subplot(3,6,13)
surf(X,Y,Distances_identity100(:,[1 3 6 9 12]))
yticks(tratio100)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
zlabel('p=100','FontSize',10,'FontWeight','bold')
subplot(3,6,14)
surf(X,Y,Distances_pinv100(:,[1 3 6 9 12]))
yticks(tratio100)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
subplot(3,6,15)
surf(X,Y,Distances_market100(:,[1 3 6 9 12]))
yticks(tratio100)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
subplot(3,6,16)
surf(X,Y,Distances_common100(:,[1 3 6 9 12]))
yticks(tratio100)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
subplot(3,6,17)
surf(X,Y,Distances_constant100(:,[1 3 6 9 12]))
yticks(tratio100)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
subplot(3,6,18)
surf(X,Y,Distances_dcc100(:,[1 3 6 9 12]))
yticks(tratio100)
set(gca, 'TickLabelInterpreter', 'latex', 'YTickLabel', {'$\frac{10}{60}$',  '$\frac{100}{60}$', '$\frac{10}{120}$', '$\frac{50}{120}$', '$\frac{10}{180}$', '$\frac{100}{180}$', '$\frac{10}{3000}$', '$\frac{50}{3000}$', '$\frac{100}{3000}$', '$\frac{10}{6000}$', '$\frac{50}{6000}$'})
view(-80,10)
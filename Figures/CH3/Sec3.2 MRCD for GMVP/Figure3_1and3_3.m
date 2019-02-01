RHO5 = [1.00E-06	0.004340099	0.006713783	0.009222485	0.012839007
1.00E-06	0.005526577	0.008814564	0.01405145	0.019829867
1.00E-06	0.006692237	0.010810043	0.016990082	0.023867484
1.00E-06	0.008538604	0.014071609	0.020655122	0.028869156];

RHO75 = [1.00E-06	1.00E-06	0.004830917	0.006281828	0.008853895
1.00E-06	1.00E-06	0.006421341	0.00869643	0.013288647
1.00E-06	1.00E-06	0.00794236	0.010510704	0.016067652
1.00E-06	1.00E-06	0.010113627	0.013446137	0.019586587];

RHO9 = [1.00E-06	1.00E-06	0.004327558	0.005379344	0.007542766
1.00E-06	1.00E-06	0.006006663	0.00763088	0.011101148
1.00E-06	1.00E-06	0.007462213	0.009253347	0.013497329
1.00E-06	1.00E-06	0.009309848	0.011648952	0.016580392];

dimension = [0.27 0.55 1.11 1.66 2.77];

figure(1)
subplot(3,1,1)
scatter(dimension,RHO5(1,:),'bo')
ylim([0 0.03])
hold on
scatter(dimension,RHO5(2,:),'gs')
ylim([0 0.03])
hold on
scatter(dimension,RHO5(3,:),'r+')
ylim([0 0.03])
hold on
scatter(dimension,RHO5(4,:),'kp')
ylim([0 0.03])
title('MRCD h=0.5')
xticks(dimension)
xticklabels({'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})

subplot(3,1,2)
scatter(dimension,RHO75(1,:),'bo')
ylim([0 0.03])
hold on
scatter(dimension,RHO75(2,:),'gs')
ylim([0 0.03])
hold on
scatter(dimension,RHO75(3,:),'r+')
ylim([0 0.03])
hold on
scatter(dimension,RHO75(4,:),'kp')
ylim([0 0.03])
title('MRCD h=0.75') 
xticks(dimension)
xticklabels({'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})

subplot(3,1,3)
scatter(dimension,RHO9(1,:),'bo')
ylim([0 0.03])
hold on
scatter(dimension,RHO9(2,:),'gs')
ylim([0 0.03])
hold on
scatter(dimension,RHO9(3,:),'r+')
ylim([0 0.03])
hold on
scatter(dimension,RHO9(4,:),'kp')
ylim([0 0.03])
title('MRCD h=0.9') 
xticks(dimension)
xticklabels({'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})









RHO5 = [1.00E-06	1.00E-06	0.001796403	0.00925539	0.010577653
1.00E-06	0.000422898	0.002440575	0.009252968	0.010561732
1.00E-06	0.000168002	0.002375107	0.007961068	0.009460569
1.00E-06	1.00E-06	0.001673173	0.009553254	0.009555975
0	0.040989611	0.033922435	0.036924319	0.041911065];

RHO75 = [1.00E-06	1.00E-06	5.47E-05	0.003668939	0.012339316
1.00E-06	0.000159933	0.0013245	0.00486844	0.012523869
1.00E-06	0.000172874	0.001235148	0.004553564	0.011972724
1.00E-06	1.00E-06	4.83E-05	0.003362033	0.012681228
0	0.040989611	0.033922435	0.036924319	0.041911065];

RHO9 = [1.00E-06	1.00E-06	0.000410095	0.002484154	0.012542879
1.00E-06	0.000216307	0.001637207	0.004601377	0.013738608
1.00E-06	0.000280074	0.001794525	0.004525551	0.013100818
1.00E-06	1.00E-06	2.08E-05	0.002018043	0.015916392
0	0.067828693	0.067172184	0.061851651	0.061907284];

dimension = [1 2 3 4 5];

figure(2)
subplot(3,1,1)
scatter(dimension,RHO5(1,:),'bo')
ylim([0 0.10])
hold on
scatter(dimension,RHO5(2,:),'gs')
ylim([0 0.10])
hold on
scatter(dimension,RHO5(3,:),'r+')
ylim([0 0.10])
hold on
scatter(dimension,RHO5(4,:),'kp')
ylim([0 0.10])
hold on
scatter(dimension(2:end),RHO5(5,2:end),'m*')
ylim([0 0.10])
title('MRCD h=0.5')
xticks(dimension)
xticklabels({'c=p/360','c=p/180','c=p/90','c=p/60','c=p/36'})

subplot(3,1,2)
scatter(dimension,RHO75(1,:),'bo')
ylim([0 0.10])
hold on
scatter(dimension,RHO75(2,:),'gs')
ylim([0 0.10])
hold on
scatter(dimension,RHO75(3,:),'r+')
ylim([0 0.10])
hold on
scatter(dimension,RHO75(4,:),'kp')
ylim([0 0.10])
hold on
scatter(dimension(2:end),RHO75(5,2:end),'m*')
ylim([0 0.10])
title('MRCD h=0.75') 
xticks(dimension)
xticklabels({'c=p/360','c=p/180','c=p/90','c=p/60','c=p/36'})

subplot(3,1,3)
scatter(dimension,RHO9(1,:),'bo')
ylim([0 0.10])
hold on
scatter(dimension,RHO9(2,:),'gs')
ylim([0 0.10])
hold on
scatter(dimension,RHO9(3,:),'r+')
ylim([0 0.10])
hold on
scatter(dimension,RHO9(4,:),'kp')
ylim([0 0.10])
hold on
scatter(dimension(2:end),RHO9(5,2:end),'m*')
ylim([0 0.10])
title('MRCD h=0.9') 
xticks(dimension)
xticklabels({'c=p/360','c=p/180','c=p/90','c=p/60','c=p/36'})
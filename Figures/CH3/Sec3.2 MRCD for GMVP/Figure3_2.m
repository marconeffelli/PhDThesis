A = [0.1324021	0.9224318	2.0754391	1.3636771	1.6720035
0.1369462	0.8336866	2.0875871	1.4682986	1.7440817
0.12827705	0.8378386	2.18173135	1.3854095	1.57256405
0.1196079	0.8419906	2.2758756	1.3025204	1.4010464
0.1287127	0.8833601	2.6425624	1.54809	1.5501773];

contamination = [0 2.5 5 10];
sample = [0.02	0.55	1.11	1.66	2.77];


%[X,Y] = meshgrid(contamination,sample);
%figure(1)
%surf(X,Y,A)?

Sample = [0.4306	0.8901	2.3459	1.3981	1.4931
          0.5184	0.8743	2.3831	1.4351	1.5664
          0.4602	0.8889	2.3648	1.4397	1.508
          0.4583	0.9189	2.4134	1.4	1.4937];
MRCD5 = [0.8884	1.8483	0.7172	0.5298	0.4133
         0.7977	1.7794	0.7142	0.484	0.3872
         0.6479	1.6822	0.7026	0.4901	0.3855
         0.6737	1.4651	0.7051	0.4462	0.3949];
MRCD75 = [0.5666	1.4504	1.161	0.7265	0.5172
          0.5557	1.2946	1.1044	0.6869	0.521
          0.4663	1.2939	1.0417	0.6647	0.5466
          0.5044	1.2554	1.0073	0.6704	0.55];
MRCD9 = [0.5014	1.0815	1.5419	0.8652	0.575
         0.5023	0.9729	1.5129	0.8046	0.564
         0.4417	0.9626	1.4588	0.8094	0.587
         0.4516	0.952	1.4244	0.7882	0.5888];

figure(1)
subplot(2,2,1)
boxplot(Sample,'Labels',{'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})
title('Sample') 
ylim([0 2.5])
subplot(2,2,2)
boxplot(MRCD5,'Labels',{'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})
title('MRCD h=0.5') 
ylim([0 2.5])
subplot(2,2,3)
boxplot(MRCD75,'Labels',{'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})
title('MRCD h=0.75') 
ylim([0 2.5])
subplot(2,2,4)
boxplot(MRCD9,'Labels',{'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})
title('MRCD h=0.9') 
ylim([0 2.5])






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

figure(2)
subplot(3,1,1)
boxplot(RHO5,'Labels',{'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})
ylim([0 0.03])
title('MRCD h=0.5')
subplot(3,1,2)
boxplot(RHO75,'Labels',{'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})
ylim([0 0.03])
title('MRCD h=0.75')   
subplot(3,1,3)
boxplot(RHO9,'Labels',{'c=0.27','c=0.55','c=1.11','c=1.66','c=2.77'})
ylim([0 0.03])
title('MRCD h=0.9') 
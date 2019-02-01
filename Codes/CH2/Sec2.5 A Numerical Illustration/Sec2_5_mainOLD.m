clear; close all;clc;

%==========================================================================
%
%
%Section2.5 A Numerical Illustration - Shorter Version not included in
%final manuscript
%
%
%==========================================================================

riga=zeros(101,1);
nr = 7;

grid = [1	2	3	4	5	6	7
8	9	10	11	12	13	14
15	16	17	18	19	20	21
22	23	24	25	26	27	28];

s1s2=0.6;s1f1=0.9;s2f2=0.7;f1f2=0.9;s1f2=0.8;s2f1=0.6;

A = [0.02 0 0 0; 0 0.02 0 0; 0 0 0.02 0; 0 0 0 0.02];
D = [1 s1s2 s1f1 s1f2; s1s2 1 s2f1 s2f2; s1f1 s2f1 1 f1f2; s1f2 s2f2 f1f2 1];
cova = A*D*A';
w01 = 0:0.01:1;
w02 = 1-w01;
for i=1:101
    HR_soft(i,:) = [cova(1,3)/cova(3,3)*w01(i) cova(2,4)/cova(4,4)*w02(i)];
    cov_pf1 = w01(i)*cova(1,3)+w02(i)*cova(2,3);
    cov_pf2 = w01(i)*cova(1,4)+w02(i)*cova(2,4);
    var_p = w01(i)*w02(i)*(cova(1,1)+cova(2,2)+2*cova(1,2));
    cova_hard = [var_p cov_pf1 cov_pf2; cov_pf1 cova(3,3) cova(3,4); cov_pf2 cova(4,3) cova(4,4)];
    HR_hard(i,:) = cova_hard(1,2:3)*inv(cova_hard(2:3,2:3));
end
k=1;
h1=subplot(4,nr,grid(1,k));
plot(w01,HR_soft(:,1),'r','LineWidth',2)
title("Initial State")
hold on
plot(w01,riga,'--b','LineWidth',1)
ylim([-2 2.5])
h2=subplot(4,nr,grid(2,k));
plot(w01,HR_soft(:,2),'g','LineWidth',2)
hold on
plot(w01,riga,'--b','LineWidth',1)
ylim([-2 2.5])

h3=subplot(4,nr,grid(3,k));
plot(w01,HR_hard(:,1),'r','LineWidth',2)
hold on
plot(w01,riga,'--b','LineWidth',1)
ylim([-2 2.5])
%ylabel("Object Oriented Approach",'FontSize',10,'FontWeight','bold')
h4=subplot(4,nr,grid(4,k));
plot(w01,HR_hard(:,2),'g','LineWidth',2)
hold on
plot(w01,riga,'--b','LineWidth',1)
ylim([-2 2.5])

p1=get(h1,'position');
p2=get(h2,'position');
height=p1(2)+p1(4)-p2(2);
h5=axes('position',[p2(1) p2(2) p2(3) height],'visible','off');
h_label1=ylabel("Block Approach",'FontSize',10,'FontWeight','bold','visible','on');

p3=get(h3,'position');
p4=get(h4,'position');
height=p3(2)+p3(4)-p4(2);
h6=axes('position',[p4(1) p4(2) p4(3) height],'visible','off');
h_label2=ylabel("Object Driven Approach",'FontSize',10,'FontWeight','bold','visible','on');

%% Weights Effect - s1f1
s1s2=0.6;s1f1=0.9;s2f2=0.7;f1f2=0.9;s1f2=0.8;s2f1=0.6;
s1f1=0.5:0.01:1;
k=2;
for j=1:51
A = [0.02 0 0 0; 0 0.02 0 0; 0 0 0.02 0; 0 0 0 0.02];
D = [1 s1s2 s1f1(j) s1f2; s1s2 1 s2f1 s2f2; s1f1(j) s2f1 1 f1f2; s1f2 s2f2 f1f2 1];
cova = A*D*A';

for i=1:101
    HR_soft(i,:,j) = [cova(1,3)/cova(3,3)*w01(i) cova(2,4)/cova(4,4)*w02(i)];
    cov_pf1 = w01(i)*cova(1,3)+w02(i)*cova(2,3);
    cov_pf2 = w01(i)*cova(1,4)+w02(i)*cova(2,4);
    var_p = w01(i)*w02(i)*(cova(1,1)+cova(2,2)+2*cova(1,2));
    cova_hard = [var_p cov_pf1 cov_pf2; cov_pf1 cova(3,3) cova(3,4); cov_pf2 cova(4,3) cova(4,4)];
    HR_hard(i,:,j) = cova_hard(1,2:3)*inv(cova_hard(2:3,2:3));
end
subplot(4,nr,grid(1,k))
plot(w01,HR_soft(:,1,j),'r','LineWidth',2)
title("\textbf{($\mathbf{S_1},\mathbf{F_1}$)}",'Interpreter','latex')
if j==51
    plot(w01,HR_soft(:,1,41),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
subplot(4,nr,grid(2,k))
plot(w01,HR_soft(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,2,end),':k','LineWidth',2)
end
hold on

subplot(4,nr,grid(3,k))
plot(w01,HR_hard(:,1,j),'r','LineWidth',2)
if j==51
    plot(w01,HR_hard(:,1,41),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
subplot(4,nr,grid(4,k))
plot(w01,HR_hard(:,2,j),'g','LineWidth',2)
if j==51
    plot(w01,HR_hard(:,2,41),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
end

%% Weights Effect - s2f2
s1s2=0.6;s1f1=0.9;s2f2=0.7;f1f2=0.9;s1f2=0.8;s2f1=0.6;
s2f2=0.5:0.01:1;
k=3;
for j=1:51
A = [0.02 0 0 0; 0 0.02 0 0; 0 0 0.02 0; 0 0 0 0.02];
D = [1 s1s2 s1f1 s1f2; s1s2 1 s2f1 s2f2(j); s1f1 s2f1 1 f1f2; s1f2 s2f2(j) f1f2 1];
cova = A*D*A';

for i=1:101
    HR_soft(i,:,j) = [cova(1,3)/cova(3,3)*w01(i) cova(2,4)/cova(4,4)*w02(i)];
    cov_pf1 = w01(i)*cova(1,3)+w02(i)*cova(2,3);
    cov_pf2 = w01(i)*cova(1,4)+w02(i)*cova(2,4);
    var_p = w01(i)*w02(i)*(cova(1,1)+cova(2,2)+2*cova(1,2));
    cova_hard = [var_p cov_pf1 cov_pf2; cov_pf1 cova(3,3) cova(3,4); cov_pf2 cova(4,3) cova(4,4)];
    HR_hard(i,:,j) = cova_hard(1,2:3)*inv(cova_hard(2:3,2:3));
end
subplot(4,nr,grid(1,k))
plot(w01,HR_soft(:,1,j),'r','LineWidth',2)
title("\textbf{($\mathbf{S_2},\mathbf{F_2}$)}",'Interpreter','latex')
ylim([-2 2.5])
hold on
if j==51
    plot(w01,HR_soft(:,1,21),':k','LineWidth',2)
end
subplot(4,nr,grid(2,k))
plot(w01,HR_soft(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
hold on
if j==51
    plot(w01,HR_soft(:,2,21),':k','LineWidth',2)
end


subplot(4,nr,grid(3,k))
plot(w01,HR_hard(:,1,j),'r','LineWidth',2)
if j==51
    plot(w01,HR_hard(:,1,31),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
subplot(4,nr,grid(4,k))
plot(w01,HR_hard(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_hard(:,2,31),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
end

%% Weights Effect - s1s2
s1s2=0.6;s1f1=0.9;s2f2=0.7;f1f2=0.9;s1f2=0.8;s2f1=0.6;
s1s2=0.5:0.01:1;
k=4;
for j=1:51
A = [0.02 0 0 0; 0 0.02 0 0; 0 0 0.02 0; 0 0 0 0.02];
D = [1 s1s2(j) s1f1 s1f2; s1s2(j) 1 s2f1 s2f2; s1f1 s2f1 1 f1f2; s1f2 s2f2 f1f2 1];
cova = A*D*A';

for i=1:101
    HR_soft(i,:,j) = [cova(1,3)/cova(3,3)*w01(i) cova(2,4)/cova(4,4)*w02(i)];
    cov_pf1 = w01(i)*cova(1,3)+w02(i)*cova(2,3);
    cov_pf2 = w01(i)*cova(1,4)+w02(i)*cova(2,4);
    var_p = w01(i)*w02(i)*(cova(1,1)+cova(2,2)+2*cova(1,2));
    cova_hard = [var_p cov_pf1 cov_pf2; cov_pf1 cova(3,3) cova(3,4); cov_pf2 cova(4,3) cova(4,4)];
    HR_hard(i,:,j) = cova_hard(1,2:3)*inv(cova_hard(2:3,2:3));
end
subplot(4,nr,grid(1,k))
plot(w01,HR_soft(:,1,j),'r','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,1,end),':k','LineWidth',2)
end
hold on
title("\textbf{($\mathbf{S_1},\mathbf{S_2}$)}",'Interpreter','latex')
subplot(4,nr,grid(2,k))
plot(w01,HR_soft(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,2,end),':k','LineWidth',2)
end
hold on

subplot(4,nr,grid(3,k))
plot(w01,HR_hard(:,1,j),'r','LineWidth',2)
ylim([-2 2.5])
hold on
if j==51
    plot(w01,HR_hard(:,1,end),':k','LineWidth',2)
end
subplot(4,nr,grid(4,k))
plot(w01,HR_hard(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
hold on
if j==51
   plot(w01,HR_hard(:,2,end),':k','LineWidth',2)
end
end

%% Weights Effect - f1f2
s1s2=0.6;s1f1=0.9;s2f2=0.7;f1f2=0.9;s1f2=0.8;s2f1=0.6;
f1f2=0.4:0.01:0.9;
k=5;
for j=1:51
A = [0.02 0 0 0; 0 0.02 0 0; 0 0 0.02 0; 0 0 0 0.02];
D = [1 s1s2 s1f1 s1f2; s1s2 1 s2f1 s2f2; s1f1 s2f1 1 f1f2(j); s1f2 s2f2 f1f2(j) 1];
cova = A*D*A';

for i=1:101
    HR_soft(i,:,j) = [cova(1,3)/cova(3,3)*w01(i) cova(2,4)/cova(4,4)*w02(i)];
    cov_pf1 = w01(i)*cova(1,3)+w02(i)*cova(2,3);
    cov_pf2 = w01(i)*cova(1,4)+w02(i)*cova(2,4);
    var_p = w01(i)*w02(i)*(cova(1,1)+cova(2,2)+2*cova(1,2));
    cova_hard = [var_p cov_pf1 cov_pf2; cov_pf1 cova(3,3) cova(3,4); cov_pf2 cova(4,3) cova(4,4)];
    HR_hard(i,:,j) = cova_hard(1,2:3)*inv(cova_hard(2:3,2:3));
end
subplot(4,nr,grid(1,k))
plot(w01,HR_soft(:,1,j),'r','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,1,end),':k','LineWidth',2)
end
hold on
title("\textbf{($\mathbf{F_1},\mathbf{F_2}$)}",'Interpreter','latex')
subplot(4,nr,grid(2,k))
plot(w01,HR_soft(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,2,end),':k','LineWidth',2)
end
hold on

subplot(4,nr,grid(3,k))
plot(w01,HR_hard(:,1,j),'r','LineWidth',2)
ylim([-2 2.5])
hold on
if j==51
    plot(w01,HR_hard(:,1,end),':k','LineWidth',2)
end
subplot(4,nr,grid(4,k))
plot(w01,HR_hard(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
hold on
if j==51
    plot(w01,HR_hard(:,2,end),':k','LineWidth',2)
end
end

%% Weights Effect - s1f2
s1s2=0.6;s1f1=0.9;s2f2=0.7;f1f2=0.9;s1f2=0.8;s2f1=0.6;
s1f2=0.5:0.01:1;
k=6;
for j=1:51
A = [0.02 0 0 0; 0 0.02 0 0; 0 0 0.02 0; 0 0 0 0.02];
D = [1 s1s2 s1f1 s1f2(j); s1s2 1 s2f1 s2f2; s1f1 s2f1 1 f1f2; s1f2(j) s2f2 f1f2 1];
cova = A*D*A';

for i=1:101
    HR_soft(i,:,j) = [cova(1,3)/cova(3,3)*w01(i) cova(2,4)/cova(4,4)*w02(i)];
    cov_pf1 = w01(i)*cova(1,3)+w02(i)*cova(2,3);
    cov_pf2 = w01(i)*cova(1,4)+w02(i)*cova(2,4);
    var_p = w01(i)*w02(i)*(cova(1,1)+cova(2,2)+2*cova(1,2));
    cova_hard = [var_p cov_pf1 cov_pf2; cov_pf1 cova(3,3) cova(3,4); cov_pf2 cova(4,3) cova(4,4)];
    HR_hard(i,:,j) = cova_hard(1,2:3)*inv(cova_hard(2:3,2:3));
end
subplot(4,nr,grid(1,k))
plot(w01,HR_soft(:,1,j),'r','LineWidth',2)
title("\textbf{($\mathbf{S_1},\mathbf{F_2}$)}",'Interpreter','latex')
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,1,end),':k','LineWidth',2)
end
hold on
subplot(4,nr,grid(2,k))
plot(w01,HR_soft(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,2,end),':k','LineWidth',2)
end
hold on



subplot(4,nr,grid(3,k))
plot(w01,HR_hard(:,1,j),'r','LineWidth',2)
if j==51
    plot(w01,HR_hard(:,1,31),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
subplot(4,nr,grid(4,k))
plot(w01,HR_hard(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_hard(:,2,31),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
end

%% Weights Effect - s2f1
s1s2=0.6;s1f1=0.9;s2f2=0.7;f1f2=0.9;s1f2=0.8;s2f1=0.6;
s2f1=0.5:0.01:1;
k=7;
for j=1:51
A = [0.02 0 0 0; 0 0.02 0 0; 0 0 0.02 0; 0 0 0 0.02];
D = [1 s1s2 s1f1 s1f2; s1s2 1 s2f1(j) s2f2; s1f1 s2f1(j) 1 f1f2; s1f2 s2f2 f1f2 1];
cova = A*D*A';

for i=1:101
    HR_soft(i,:,j) = [cova(1,3)/cova(3,3)*w01(i) cova(2,4)/cova(4,4)*w02(i)];
    cov_pf1 = w01(i)*cova(1,3)+w02(i)*cova(2,3);
    cov_pf2 = w01(i)*cova(1,4)+w02(i)*cova(2,4);
    var_p = w01(i)*w02(i)*(cova(1,1)+cova(2,2)+2*cova(1,2));
    cova_hard = [var_p cov_pf1 cov_pf2; cov_pf1 cova(3,3) cova(3,4); cov_pf2 cova(4,3) cova(4,4)];
    HR_hard(i,:,j) = cova_hard(1,2:3)*inv(cova_hard(2:3,2:3));
end
subplot(4,nr,grid(1,k))
plot(w01,HR_soft(:,1,j),'r','LineWidth',2)
title("\textbf{($\mathbf{S_2},\mathbf{F_1}$)}",'Interpreter','latex')
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,1,end),':k','LineWidth',2)
end
hold on
subplot(4,nr,grid(2,k))
plot(w01,HR_soft(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_soft(:,2,end),':k','LineWidth',2)
end
hold on



subplot(4,nr,grid(3,k))
plot(w01,HR_hard(:,1,j),'r','LineWidth',2)
if j==51
    plot(w01,HR_hard(:,1,31),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
subplot(4,nr,grid(4,k))
plot(w01,HR_hard(:,2,j),'g','LineWidth',2)
ylim([-2 2.5])
if j==51
    plot(w01,HR_hard(:,2,31),':k','LineWidth',2)
end
ylim([-2 2.5])
hold on
end

close all; clear; clc;

%==========================================================================
%
%
%Figure3.11: condition number of covariance matrices
%
%
%==========================================================================

load("Figure3_11and12")

nasset=length(cov_sample);


for i=1:nasset
%compute eigenvalues
lambda=eig(cov_sample(1:i,1:i));
%compute conditioning number
CS(i,1)=lambda (end)/lambda(1);
a(i,1) = cond(cov_sample(1:i,1:i));
end

for i=1:nasset
%compute eigenvalues
lambda=eig(cov_shrinkage(1:i,1:i));
%compute conditioning number
CSS(i,1)=lambda (end)/lambda(1);
a(i,2) = cond(cov_shrinkage(1:i,1:i));
end

for i=1:nasset
%compute eigenvalues
lambda=eig(cov_Nshrinkage(1:i,1:i));
%compute conditioning number
CNS(i,1)=lambda (end)/lambda(1);
a(i,3) = cond(cov_Nshrinkage(1:i,1:i));
end

for i=1:nasset
%compute eigenvalues
lambda=eig(cov_MCD(1:i,1:i));
%compute conditioning number
CMCD(i,1)=lambda (end)/lambda(1);
a(i,4) = cond(cov_MCD(1:i,1:i));
end

for i=1:nasset
%compute eigenvalues
lambda=eig(cov_MCD(1:i,1:i));
%compute conditioning number
CMRCD(i,1)=lambda (end)/lambda(1);
a(i,5) = cond(cov_MCD(1:i,1:i));
end



%plot
subplot(3,2,1)
plot([1:nasset],CS,'-r')
legend('Sample')
xlabel('Matrix size')
ylabel('CN')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,2)
plot([1:nasset],CSS, '-g')
xlabel('Matrix size')
ylabel('CN')
legend('Shrinkage')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,3)
plot([1:nasset],CNS)
xlabel('Matrix size')
ylabel('CN')
legend('NonlinearShrinkage')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,4)
plot([1:nasset],CMCD, '-k')
xlabel('Matrix size')
ylabel('CN')
legend('MCD')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,5)
plot([1:nasset],CMRCD, '-y')
%axis([0 30 -20 150000])
xlabel('Matrix size')
ylabel('CN')
legend('MRCD')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);




%plot
subplot(3,2,1)
plot([1:nasset],a(:,1),'-r')
axis([0 25 0 10^4*15])
legend('Sample')
xlabel('Matrix size')
ylabel('CN')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,2)
plot([1:nasset],a(:,2), '-g')
axis([0 25 0 10^4*15])
xlabel('Matrix size')
ylabel('CN')
legend('Shrinkage')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,3)
plot([1:nasset],a(:,3))
axis([0 25 0 10^4*15])
xlabel('Matrix size')
ylabel('CN')
legend('NonlinearShrinkage')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,4)
plot([1:nasset],a(:,4), '-k')
axis([0 25 0 10^4*15])
xlabel('Matrix size')
ylabel('CN')
legend('MCD')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);

subplot(3,2,5)
plot([1:nasset],a(:,5), '-y')
axis([0 25 0 10^4*15])
xlabel('Matrix size')
ylabel('CN')
legend('MRCD')
set(findall(gca, 'Type', 'Line'),'LineWidth',2);
%% generation of k users 
% Create a random set of coordinates in a circle.
% First define parameters that define the number of points and the circle.
K=1000
r=1;
x0=0;
y0=0;
rho=r*sqrt(rand(1,K));
mu=2*pi*rand(1,K);
x=x0+rho.*cos(mu);
y=y0+rho.*sin(mu);



angles = linspace(0, 2*pi, 500);
rx = r*cos(angles) ;
ry = r*sin(angles) ;

% Now display our random set of points in a figure.
plot(x,y, 'o', 'MarkerSize', 5)
hold on;
plot(rx, ry, 'b-')
axis square;
grid on;
% Enlarge figure to full screen.
%set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
fontSize = 10; 
xlabel('X', 'FontSize', fontSize);
ylabel('Y', 'FontSize', fontSize);
title('Random Locations Within a Circle', 'FontSize', fontSize);

%% Generating a channale coefficent g 
beta=3.6;
alpha=10^13.6;
gain_antenna=2;%db
P=10;%watt
L=10^0.7;%db
R=128*1000;%bit/s
G=2;
gamma_b=10^(2.8/10);%db
W=3.84*10^6;%chip/s
theta=0.4;
bandwith=5*10^6;%HZ
spectral_density_noise=-174;%dbm/hz


N=10^(spectral_density_noise/10)*bandwith/10^(3);

s=10.^(normrnd(0,3.5,1,K)./10);
l=alpha.*(rho.^beta);
h=exprnd(2,1,K);

g=(G.*h.*s)./(l.*L);

gamma_c=gamma_b*R/W;
transmitted_power=((theta*gamma_c)/(1+theta*gamma_c))*P + (((gamma_c*N)/(1+theta*gamma_c))./g);

cdfplot(transmitted_power)
percentile_90=prctile(transmitted_power,90);
median=prctile(transmitted_power,50);

%%Performance evaluation using Erlang method
%1.3.1
M=floor(P/median);
maximal_erlang_capacity=25;
%1.3.2
M_90=floor(P/percentile_90);
maximal_erlang_capacity_90=13;

%% Accounting for inter-cell interference
Rc=1;
F=pi/(sqrt(3)*(beta-2))*((rho/Rc).^beta).*((2-rho/Rc).^(2-beta));
m=100;
interference_ro=zeros(1,m);

for i=1:m
    interference_power=transmitted_power+(gamma_c/1+theta*gamma_c)*(i/m)*P.*F;
    interference_ro(i)=prctile(interference_power,50);
end
plot([1:m]/m,interference_ro)
xlabel('\rho', 'FontSize', fontSize);
ylabel('P(\rho)', 'FontSize', fontSize);


%% 2.2

ro_tab=zeros(1,m);
for E=1:m
    syms ro
    eqn= ro==E*prctile(transmitted_power+(gamma_c/1+theta*gamma_c)*(ro)*P.*F,50)/P;
    
    ro_tab(E)=solve(eqn,ro);
end

plot(ro_tab)
    




















   


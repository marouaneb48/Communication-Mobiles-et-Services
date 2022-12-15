
%% Transmission of Data signals over an ideal channel with no noise

x1=[-1 1 -1 1 -1 -1 -1 1 1];
x2 = [-1 1 -1 -1 -1 -1 -1 -1 1 ];
%% 
N=16
x1=(round(rand(1,SF))-ones(1,N)./2)*2; % binary random code {-1,1}
x2=(round(rand(1,SF))-ones(1,N)./2)*2; % binary random code {-1,1}
%% SF=4
SF=4;
c=code(SF,1); %Generation des codes par les matrices de Walsh-Hadamard
signal_transmis_1=transmitted_signal(x1,c{1});
signal_transmis_2=transmitted_signal(x2,c{2});
detected_signal=signal_transmis_1+signal_transmis_2;

decoded_signal_1=decode(detected_signal,c{1});
decoded_signal_2=decode(detected_signal,c{2});

t1=[1:length(x1)];
subplot(2,1,1);plot(t1,decoded_signal_1,t1,x1)
title('user 1')
legend('décodé','transmis')
t2=[1:length(x1)];
subplot(2,1,2);plot(t2,decoded_signal_2,t2,x2)
title('user 2')
legend('décodé','transmis')
hold off
%% SF=16
SF=16;
c=code(SF,1); %Generation des codes par les matrices de Walsh-Hadamard
signal_transmis_1=transmitted_signal(x1,c{1});
signal_transmis_2=transmitted_signal(x2,c{2});
detected_signal=signal_transmis_1+signal_transmis_2;

decoded_signal_1=decode(detected_signal,c{1});
decoded_signal_2=decode(detected_signal,c{2});

t1=[1:length(x1)];
subplot(2,1,1);plot(t1,decoded_signal_1,t1,x1)
title('user 1')
legend('décodé','transmis')
t2=[1:length(x1)];
subplot(2,1,2);plot(t2,decoded_signal_2,t2,x2)
title('user 2')
legend('décodé','transmis')
hold off


%% séquence binaire aléatoire
SF=16;
c=code(SF,2); %Generation des codes par les matrices de Walsh-Hadamard
signal_transmis_1=transmitted_signal(x1,c{1});
signal_transmis_2=transmitted_signal(x2,c{2});


%% PN sequence
SF=16;
c=code(SF,3); %Generation des codes par les matrices de Walsh-Hadamard
signal_transmis_1=transmitted_signal(x1,c{1});
signal_transmis_2=transmitted_signal(x2,c{2});

%% Transmission over a multipath channel 
signal_transmis_1=[signal_transmis_1 0]+0.9*[0 signal_transmis_1];

signal_transmis_2=[signal_transmis_2 0]+0.9*[0 signal_transmis_2];

detected_signal=signal_transmis_1+signal_transmis_2;
decoded_signal_1=decode(detected_signal,c{1});
decoded_signal_2=decode(detected_signal,c{2});

t1=[1:length(x1)];
subplot(2,1,1);plot(t1,decoded_signal_1,t1,x1)
title('user 1')
legend('décodé','transmis')
t2=[1:length(x1)];
subplot(2,1,2);plot(t2,decoded_signal_2,t2,x2)
title('user 2')
legend('décodé','transmis')
hold off



%% Bit error rate

index_1=decoded_signal_1==x1;
index_2=decoded_signal_1==x2;
avg_error=length(x1)-(sum(index_1)+sum(index_1))/2
error_rate=avg_rate/length(x1)

%% CDMA codes propreties
%hadamard
SF=16;
c_H=code(SF,1);
auto_Corr_1=corrcoef(c_H{1});
auto_Corr_1=corrcoef(c_H{2});
Corr_12=corrcoef(c_H{1},c_H{2});
%% noise
c_N=code(SF,1)
auto_Corr_1=corrcoef(c_N{1});
auto_Corr_2=corrcoef(c_N{2});
Corr_12=corrcoef(c_N{1},c_N{2});
%% pseudo noise
c_PN=code(SF,1);
auto_Corr_1=corrcoef(c_PN{1});
auto_Corr_2=corrcoef(c_PN{2});
Corr_12=corrcoef(c_PN{1},c_PN{2});








    
    

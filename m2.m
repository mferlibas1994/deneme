%% M2-a)

%% Variables

x = [1 9 3 6 7 8 0];
h = rand(1,4);
h(1,:)=0.25;
n=0:6;
y = conv(x,h);
%% Plot of x[n] with command "stem"
figure
stem(n,x);
xlabel('Time');
ylabel('x[n]');
legend('x[n]');
title('x[n] vs Time');
xlim([-1,7]);
ylim([0,10]);
%% Plot of h[n] with command "stem"
figure
m=0:3;
stem(m,h);
xlabel('Time');
ylabel('h[n]');
legend('h[n]');
title('h[n] vs Time');
xlim([-1,4]);
ylim([0,0.35]);
%% Plot of y[n] with command "stem"
figure
t=0:9;
stem(t,y);
xlabel('Time');
ylabel('y[n]');
legend('y[n]');
title('y[n] vs Time');
xlim([-1,11]);
ylim([0,8]);
%% p[n]=output with "filter" command
figure
k=0:6;
p=filter(h,1,x);
stem(k,p);
xlabel('Time');
ylabel('p[n]');
legend('p[n]');
title('p[n] vs Time');
xlim([-1,7]);
ylim([0,7]);
%As a comment, we can say that conv command performs the complete
%convolution and the length is simply {lenght(x)+length(h)-1}, but filter
%returns the filtered input as a vector of the same size as x. If we had a
%FIR, we could not use the conv command; instead we need to use this filter
%command.

%% M2-b)
% window length = 4
figure
h=rand(1,4);
h(1,:)=1/4;
freqz(h)

% window length = 8
figure
h=rand(1,8);
h(1,:)=1/8;
freqz(h)

% window length = 16
figure
h=rand(1,16);
h(1,:)=1/16;

freqz(h)
xlim([-2*pi,2*pi]);

%moving average filter is the easiest digital filter to use. It reduces the
%random noise existing in the input signal, according to the following
%relation between the noise and the window length:
%as the window length increases, the attenuation in the noise decreases,
%but we lose some parts of the signal we need.

%% M2-c)
figure
h=rand(1,10000);
h(1,:)=1/10000;
freqz(h)

%as can be seen in the frequency response, this kind of moving average
%filter will eliminate most of the input signal, i.e. less realistic
%output, which we do not want in general.

%If the window length becomes 1, we are left with only one impulse in the
%filter, and it filters nothing, i.e. we see the original input signal at
%the output.

%As I mentioned above, for time domain encoded signals, moving average
%filter is the premier one. however, it is the worst for frequency domain
%encoded signals. As an application, this kind of moving average filters
%can be used for noise reduction. 

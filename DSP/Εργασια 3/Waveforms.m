% 1st Signal(Sine waveform)
t = 0:0.01:20; 
amp = 4
x = amp*sin(pi*t);
plot(t,x);

% 2nd Signal (Cosine waveform)
t = 0:0.01:20; 
amp = 4
x = amp*cos(pi*t);
plot(t,x);
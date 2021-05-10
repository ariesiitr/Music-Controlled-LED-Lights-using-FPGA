Fs = 1000;                   % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 10;             % seconds
t = (0:dt:2*(StopTime-dt))';     % seconds
%%Sine wave:
Fc = 100;                     % hertz
x = (sin(2*pi*Fc*t))+(sin(2*pi*2*Fc*t));
wave.signals.values = x;
wave.time = [];

model = 'hey.slx';
open_system(model);
sablock = 'hey/Spectrum Analyzer';
cfg = get_param(sablock,'ScopeConfiguration');
cfg.PeakFinder.Enable = true;
sim(model);
data = getMeasurementsData(cfg);
p = data.PeakFinder.Value;
f = data.PeakFinder.Frequency;
f
l=length(p);
int=[];
freq=[];
for i=1:l
    if f(i)>0
       int(end+1)=p(i)
       freq(end+1)=f(i);
    end 
end 
plot(freq,int,'o');
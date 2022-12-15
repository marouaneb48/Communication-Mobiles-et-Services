function d=decode(s,c)
L=length(c);
start=1;
ending=L;
d=[];
while ending<=length(s)
    
    signal=s(start:ending)*c'*1/L;
    if abs(signal-1)>abs(signal+1)
        signal=-1;
    else
        signal=1;
    end
    d=[d signal];
    start=ending+1;
    ending=ending+L;
end
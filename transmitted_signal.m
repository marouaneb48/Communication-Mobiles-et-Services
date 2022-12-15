%signal transmis dans le canal
%paramètres :  x--->séquence des caractères à transmettre 
%              c---> code 
function s=transmitted_signal(x,c)
s=[];
for i=x
    signal= i*c;  
    s=[s signal];
end


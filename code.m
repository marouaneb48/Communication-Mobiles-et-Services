function c=code(SF,type_code)
c=[];
%type_code=1; %you can choose 1, 2 or 3: 1 hadamard / 2 aleatoire / 3 PN
if type_code==1,
 had=hadamard(4);
 c{1}=had(1,:);c{2}=had(2,:);c{3}=had(3,:);
end;
if type_code==2,
 c{1}=(round(rand(1,SF))-ones(1,SF)./2)*2; % binary random code {-1,1}
 c{2}=(round(rand(1,SF))-ones(1,SF)./2)*2; % binary random code {-1,1}
 c{3}=(round(rand(1,SF))-ones(1,SF)./2)*2; % binary random code {-1,1}
end;
if type_code==3,
 seq=zeros(1,15);
 seq(1)=0;seq(2)=0;seq(3)=0;seq(4)=1;
 for n=5:1:15,
 seq(n)=mod(seq(n-1)+seq(n-4),2);
 end;
 binary_seq=2*seq-1; %sequence of 1 and -1
 codes_matrix=zeros(15,15);
 cr=binary_seq;
 for i=1:15,
 codes_matrix(i,:)=cr;
 cr=circshift(cr,1);
 end;
 c{1}=codes_matrix(1,:); c{2}=codes_matrix(2,:); c{3}=codes_matrix(3,:);
end;

function [uterSis] = patiSisWMD(igeno,genesSis) 
%% compute the similarity of two patients using WMD

data = igeno;
[sample,gene] = size(data);

uterSis = zeros(sample,sample);


for i=1:sample
    uterSis(i,i) = 1;
end

for i=1:sample 
    data(i,:) = data(i,:)/sum(data(i,:));
end
   
for i=1:sample-1
    [~,colX,vX] = find(data(i,:));
    
    for j=i+1:sample
        [~,colY,vY] = find(data(j,:));
        
        %weight = computWeight(rowX,rowY, matchIndex, glove_6B_300d_vector);
        %weight = ;
        %WMD(vX',vY',weight);
        dist = WMD_New(vX,vY,genesSis(colX,colY));
        uterSis(i,j) = dist;
        uterSis(j,i) = dist;
    end
    
end
    
end

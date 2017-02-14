function f_dist = floyd(G)

% G is an adjacency matrix

[N,M] = size(G);

f_dist = zeros(N);

if N~=M
    return
end

G_sum = sum(G);

% for i=1:N
%     f_dist(i,i) = 1;
% end

for i=1:N-1
    for j=i+1:N
        if G(i,j) == 1
           f_dist(j,i) = 1/(G_sum(i)+G_sum(j)-1);
           f_dist(i,j) = f_dist(j,i);
        end
    end
end

for k=1:N
     k
     for i=1:N
       
         if f_dist(i,k) == 0
             continue;
         end
        for j=1:N
            
            if f_dist(k,j) == 0
             continue;
            end
         
            v = f_dist(i,k) * f_dist(k,j);
            
            if f_dist(i,j) < v
                f_dist(i,j) = v;
            end
        end
    end
 end

%
for i=1:N
    neiSum = 0;
    for j=1:N
        if G(i,j) == 1
           neiSum = neiSum+f_dist(i,j);
        end
    end
    
    f_dist(i,i) = neiSum ;
end 
 

end
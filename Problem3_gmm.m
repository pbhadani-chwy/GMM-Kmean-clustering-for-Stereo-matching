D = Disparity_mat();
D = reshape(D,[381*390,1]);
allocate = zeros(size(D,1),2);

K = double(ones(6,3));

D = D./40;
K(:,1) = rand(6,1);
K(:,2) = 1.0/4;
K(:,3) = rand(6,1);

% calculating the membership matrix(U matrix)
U = zeros(size(D,1),size(K,1));
v = size(K,1);
n = size(D,1);

% code to calculate the expectation (Posterior calculation)
for  k =1:40
    for i=1:n
        sum1 = 0;
        x = D(i);
        num = 0;
        den = 0;
        for j= 1:v
            num = K(j,2) * exp(-0.5 * (x - K(j,1))^2 * 1/(K(j,3)+exp(-5)));
            den = sqrt(2*pi*K(j,3));
            U(i,j) = num/(den+exp(-5));
            sum1 = sum1 + num/(den+exp(-5));
        end
        U(i,:) = U(i,:)./(sum1+exp(-5));
        [~,ind] = max(U(i,:));
        allocate(i,1) = ind;
        allocate(i,2) = K(ind,1);
    end
    for i = 1:v
        t = 0;
        sum1 = sum(U(:,i),1);
    
        for j= 1:n
            t = t + U(j,i)*D(j);
        end 
        K(i,1) = t/(sum1+exp(-5));
        % Calculate the prior
        K(i,2) = sum(U(:,i),1)./n;  
        t = 0;
        
        for j=1:n 
            t = t + (U(j,i) * (D(j) - K(i,1))); 
        end
        K(i,3) = t/(s+exp(-5)); 
    
    end
end
histogram(allocate(:,2))
fin_res = reshape(allocate(:,2),[381,390]);
imshow(mat2gray(fin_res));
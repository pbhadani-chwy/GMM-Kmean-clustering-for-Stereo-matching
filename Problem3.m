[x] = Disparity_mat();
fin_out = reshape(x,[1,148590]);
k = zeros(1,8);
check_res = zeros(148590,3);
int_res = zeros(1,2);
for i= 1:17
    x = randi(40);
    k(:,i) = x;    
end
n = 8;
for i = 1:1000
    for m = 1:148590        
        min_dist = 9999;
        for l = 1:8
            cal_dist = min(abs(k(:,l) - fin_out(:,m)));
            if (cal_dist < min_dist)
                min_dist = cal_dist;
                cluster = l;
                mean_check = k(:,l);
            end
        end
        z = [fin_out(:,m),cluster,mean_check];
        check_res(m,:) = z;
    end
    sumk1 = 0; count1= 0;
    sumk2 = 0; count2= 0;
    sumk3 = 0; count3= 0;
    sumk4 = 0; count4= 0;
    sumk5 = 0; count5= 0;
    sumk6 = 0; count6= 0;
    sumk7 = 0; count7= 0;
    sumk8 = 0; count8= 0;
    
    for i = 1:148590
        if (check_res(i,2)) == 1
            sumk1 = sumk1 + check_res(i,1);
            count1 = count1 + 1;
        elseif (check_res(i,2)) == 2
            sumk2 = sumk2 + check_res(i,1);
            count2 = count2 + 1;
        elseif (check_res(i,2)) == 3
            sumk3 = sumk3 + check_res(i,1);
            count3 = count3 + 1;
        elseif (check_res(i,2)) == 4  
            sumk4 = sumk4 + check_res(i,1);
            count4 = count4 + 1;
        elseif (check_res(i,2)) == 5   
            sumk5 = sumk5 + check_res(i,1);
            count5 = count5 + 1;
        elseif (check_res(i,2)) == 6    
            sumk6 = sumk6 + check_res(i,1);
            count6 = count6 + 1;
        elseif (check_res(i,2)) == 7   
            sumk7 = sumk7 + check_res(i,1);
            count7 = count7 + 1;
        else 
            sumk8 = sumk8 + check_res(i,1);
            count8 = count8 + 1;
        end
    end
    mean_mat = [double(sumk1/count1),double(sumk2/count2),double(sumk3/count3),double(sumk4/count4),double(sumk5/count5),double(sumk6/count6),double(sumk7/count7),double(sumk8/count8)];   
    for m= 1:8
    %x = randi(40);
        k(:,m) = mean_mat(:,m);    
    end
end    

final_out = reshape(check_res(:,3),[381,390]);
imtool(mat2gray(final_out));
%disp(mapObj(6));
%end







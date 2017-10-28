function [x] = Disparity_mat()
Xl = imread('C:\Users\bhada\Downloads\IU_Sem3\MLSP\Assignment\Homework2\Data\im0.ppm');
%imshow(Xl);
Xr = imread('C:\Users\bhada\Downloads\IU_Sem3\MLSP\Assignment\Homework2\Data\im8.ppm');
%imshow(Xr);
x = zeros(381,390);
for i=1:381
    for j= 1:390
        min_dist = 99999;
        for k = 0:39
            xr = double(Xr(i,j,1));
            xg = double(Xr(i,j,2));
            xb = double(Xr(i,j,3));
            yr = double(Xl(i,j+k,1));
            yg = double(Xl(i,j+k,2));
            yb = double(Xl(i,j+k,3));
            dist = sqrt((xr-yr)^2+(xg-yg)^2+(xb-yb)^2);
            if dist < min_dist
                min_dist = dist;
                min_index = k;
            end
        end
        x(i,j) = min_index;
    end    
end
%fin_out = reshape(x,[1,148590]);
%histogram(fin_out);
end

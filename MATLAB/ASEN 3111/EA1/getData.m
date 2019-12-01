function getData()
% getData Finds all the data files and splits them up into four variables
% and creates data.mat

files = dir('DataFiles/*');
cd DataFiles
j = 1;
k = 1;
l = 1;
m = 1;

% Itterates through the files and splits it up depending on its name
for i = 3:length(files)
    if contains(files(i).name,'Cylinder')
        if contains(files(i).name,'Up')
            CylinderUp{1,j} = load(files(i).name);
            CylinderUp{2,j} = getName(files(i).name);
            j = j+1;
        else
            CylinderDown{1,k} = load(files(i).name);
            CylinderDown{2,k} = getName(files(i).name);
            k = k+1;
        end
    elseif contains(files(i).name,'Airfoil')
        if contains(files(i).name,'Up')
            AirfoilUp{1,l} = load(files(i).name);
            AirfoilUp{2,l} = getName(files(i).name);
            l = l+1;
        else
            AirfoilDown{1,m} = load(files(i).name);
            AirfoilDown{2,m} = getName(files(i).name);
            m = m+1;
        end
    end
end

cd ..
save Data_EA1_Razumovskiy_Samuel.mat CylinderUp CylinderDown AirfoilUp AirfoilDown

end
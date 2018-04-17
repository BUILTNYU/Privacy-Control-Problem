function output=uniquetour(tourset,tour)
output=false;
for i=1:size(tourset,2)
    if(isequal(tourset(1:36,i),tour(1:36)));
        output=true;
    end
end
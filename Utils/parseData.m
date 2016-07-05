%deal with input path
function [data,m] =  parseData(inpath)
   parstr = strsplit(inpath,'.') ;%Split string using point

    % the length of parstr is 1 or not end with 'dat' and 'mat'
    if(length(parstr)==1 ||( (~strcmp(strtrim(parstr(end)),'dat') && (~strcmp(parstr(end),'mat')))))
      [Y,X] = libsvmread(inpath); %read label and instance 
    else
        data = load(inpath);  %load data
        X  = data(:,1:(end-1));%instance include 1:(end-1) columns
        Y = data(:,end);%label include end columns
    end
    
    mul = length(unique(Y)) >2 ;%the kinds of the label are greater than 2

    levels = unique(Y) ;%the kinds of the label

    if mul
        Y = ind2vec(Y')';%if it is mulit-class then convert indices to vectors

    else % if it is two classes and levels is not equal to -1 ,1 then let 1 is-1 and 2 is 1.
           %if levels~=[-1 1]
          if  ~all(levels==[-1;1])
            
         Y( Y == levels(1) ) = -1 ;

         Y( Y == levels(2) ) =  1  ;

          end

    end


    data = [X Y] ;
    m =size(Y,2);
end
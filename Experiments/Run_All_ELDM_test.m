%Run all the test data
function Run_All_ELDM_test(file)
	files = ls([file '\*' ]);%lists the contents of the current folder.
	files(1,:) =[]; %%% delete the first row
	files(1,:)= []; %%% delete ..
	
	for i  = 1:size(files,1) %Traverse rows
	  Infile(i,:) = [file '\' files(i,:)];%the input file
	  names = strsplit(Infile(i,:),'.');%Split string using point

	  fileIsMat =  strcmp( strtrim( names(end) ) , 'mat' ) ;%Remove leading and trailing white space from string then compare with 'mat'
	  if fileIsMat % if fileIsMat is true then continue
	  	continue ;
	  end
	  if length(names) > 1  % if  length(names)> 1 
	  	outpart  = names(1:(end-1)) ; %output 1 column 1:(end-1) rows	  
      else % otherwise output names
	    outpart = names ;
	  end

	  Outfile(i,:)= [ outpart '.mat' ]; %output '.mat' file
	end


	for i = 1:size(Infile,1) %Traverse the Infile's rows
	 eval_ELDM_test(Infile(i,:),Outfile(i,:)); %execute eval_ELDM_test function
	end
end
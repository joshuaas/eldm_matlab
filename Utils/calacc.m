%% functionname: function description
function [acc] = calacc(res,label)
	mul = size(label,2)>1;
	if mul
      res = vec2ind(res')';
      label = vec2ind(label')';
      acc = sum(res == label)/size(label,1);
   else
	yl = 2*(res>0)-1 ;
    acc = sum(yl == label)/length(label);
   end
end

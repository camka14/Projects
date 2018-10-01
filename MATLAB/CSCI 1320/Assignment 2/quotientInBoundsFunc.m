function out = quotientInBoundsFunc( input1, input2)
% quotientInBoundsFunc divides input1 by input2 and sees if result is 
% greater than input1 and less than input2
z = input1/input2;
if input1<z && z<input2
    out=true;
else
    out=false;
end
end
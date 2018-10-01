clear,clc
error=1;
x=5*pi/3;
 Present=1;
    H=0;
    Next=0;
    Switch=-1;
    while abs(error)>1*10^(-8);
       Present=Present-Switch*Next;
       H=H+1;
       Next=(x^(2*H))/(factorial(2*H));
       Switch=-1*Switch;
       volume(H,1)=Present;
       if H>1;
       volume(H,2)=(volume(H,1)-volume(H-1,1))/volume(H,1);
       error=volume(H,2);
       else
           volume(1,2)=1;
       end
       volume(H,3)=(cos(x)-Present)/cos(x);
    end
    output=volume
    NumberOfTerms=H
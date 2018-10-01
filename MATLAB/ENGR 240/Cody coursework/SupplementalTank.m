clear,clc 
d=[0:.3:4.5]
  R=1.5
  volume=zeros(1,16)
  row=1
  for d=[0:.3:4.5]
    if d<R
      VW=pi*(d)^2*(d/3)
      volume(1,row)=VW
  elseif d<=3*R
      VW=pi*R^2*(d-R)+pi*R^2*(R/3)
      volume(1,row)=VW
  else d>3*R
      volume(1,row)=999
    end
    row=row+1
  end
  d=[0:.3:4.5]
  plot(d,volume,'-*')
  xlabel('Depth')
  ylabel('Volume')
  
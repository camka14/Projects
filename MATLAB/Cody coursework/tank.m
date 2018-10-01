 d=[0:.3:4.5]
  R=1.5
  volume=zeros(1,16)
  for d=[0:.3:4.5]
    if d<R
      VW=pi*(d)^2*(d/3)
      volume(1,(d/.3+1))=(pi.*d.^3)/3
  elseif d<=3*R
      VW=pi*R^2*(d-R)+pi*R^2*(R/3)
      volume(1,round(d/.3+1))=(pi*R^3)/3+(pi*R^2*(d-R))
  else d>3*R
      volume(1,round(d/.3+1))=999
    end
  end
  volume=VW
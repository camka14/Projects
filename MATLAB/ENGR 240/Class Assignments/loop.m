clear,clc
volume=zeros(4,3)
n=0
for r=1:2:5
    n=n+1
    for h=2:2:8
        V=pi*r^2*h
        volume(h/2,n)=V
    end
end
radius=[1:2:5]
height=[2:2:8]
[R,H]=meshgrid(radius,height)
Volume=pi.*R.^2.*H
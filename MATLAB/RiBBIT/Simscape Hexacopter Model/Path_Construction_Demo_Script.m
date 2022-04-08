%{
 This demonstration script generates a timeseries in the workspace
 After saving the workspace, you can load it later to a position controler 
 as a timeseries of position commands.

Additional quadcopter modeling and simulation materials available at:
github.com/dch33/Quad-Sim

Copyright (C) 2014 D. Hartman, K. Landis, S. Moreno, J. Kim, M. Mehrer

License:
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU LESSER GENERAL PUBLIC LICENSE
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
%}

%% This demonstration script generates a timeseries in the workspace
%
X = [ 0, 0, 5, 5, 5, 5, 0]*1; % meters
Y = [ 0, 0, 0, 0, 5, 5, 5]*1; % meters
Z = [ 1, 1, 1, 1, 1, 1, 1]*0; % meters
t = [ 0, 5,10,15,20,25,30]; % seconds
Psi = [ 0, 1, 1, 1, 1, 1, 1]*0; % radians
path.x = timeseries(X,t);
path.y = timeseries(Y,t);
path.z = timeseries(Z,t);
path.psi = timeseries(Psi,t);
clear X Y Z t Psi
uisave('path', 'mypath')
%clear path
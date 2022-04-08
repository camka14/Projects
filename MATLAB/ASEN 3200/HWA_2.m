clear,clc,close all

Ig = [783.5,351.7,40.27;351.7,783.5,-80.27;40.27,-80.27,783.5];

[v,e] = eig(Ig);

fprintf('The Eigenvalues of the Moment of Inertia are: %.3f, %.3f, %.3f\n',e(1),e(2,2),e(3,3));
disp('The Eigenvectors are:')
disp(v)

% Principal axis
Q = v';
disp('DCM for converting to the principal axis')
disp(Q)

disp('Converting the Ig withh the DCM gives us a horizontal matrix')
Ipa = Q*Ig*Q';
disp(Ipa)

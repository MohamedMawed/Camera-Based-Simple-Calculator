function s = ifrdescp(z, nd) %IFRDESCP Computes inverse Fourier descriptors. 

% S = IFRDESCP(Z, ND) computes the inverse Fourier descriptors of 
% of Z, which is a sequence of Fourier descriptor obtained, for 
% example, by using function FRDESCP. ND is the number of 
% descriptors used to compute the inverse; ND must be an even 
% integer no greater than length(Z), and length(Z) must be even 
% also. If ND is omitted, it defaults to length(Z). The output, 
% S, is matrix of size length(Z)-by-2 containing the coordinates 
% of a closed boundary. 
% Preliminaries. 
np = length(z);
% Check inputs. 
if nargin == 1 
    nd = np; 
end
if np/2 ~= round(np/2)
    error('length(z) must be an even integer.') 
elseif nd/2 ~= round(nd/2) 
    error('nd must be an even integer.') 
end 


% Create an alternating sequence of 1s and -1s for use in centering 
% the transform. 
x =0:(np -1); 
m = ( (-1 ) .^ x)';

d = (np - nd)/2; 
z(1 :d) = 0; 
z(np - d + 1:np) = 0; 


zz = ifft(z); 
s(: , 1) = real(zz) ; 
s(: , 2) = imag(zz); 

% Multiply by alternating 1 and -1s to undo the earlier centering. 
s(:, 1) = m .* s(:, 1); 
s(:, 2) = m .* s(:, 2); 



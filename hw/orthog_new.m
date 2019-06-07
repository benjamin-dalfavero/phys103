% orthog - Program to test if a pair of vectors 
% is orthogonal.  Assumes vectors are in 3D space
clear all;  help orthog;   % Clear the memory and print header
%* Initialize the vectors a and b
a = input('Enter the first vector: ');
b = input('Enter the second vector: ');
%* Evaluate the dot product as sum over products of elements
a_dot_b = 0;
% break on error
if lenth(a) ~= length(b)
    disp('vector lengths are not compatible')
    return
end
for i=1:length(a)
  a_dot_b = a_dot_b + a(i)*b(i);
end
%* Print dot product and state whether vectors are orthogonal
if( a_dot_b == 0 )
  disp('Vectors are orthogonal');
else
  disp('Vectors are NOT orthogonal');
  fprintf('Dot product = %g \n',a_dot_b);
end

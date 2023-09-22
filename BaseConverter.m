% Q1. BASE Converter 
n = input('Enter a number for base n: ');
% define the number in the required range
if (2<=n)&&(n<=10) 
    xn = input('Enter a number you like: ');
    % make string convert
    xn1=int2str(xn);
    x1=base2dec(xn1,n); 
    m = input('Enter a number for convert:');
    if (2<=m)&&(m<=10)
        xm=dec2base(x1,m);
        f=['number converted is ',xm];
        disp(f);
    else
        % display the checked result
        disp('input can not be use, which out of the range'); 

    end
else
    % display the checked result
    disp("input can not be use, which out of the range") 
end
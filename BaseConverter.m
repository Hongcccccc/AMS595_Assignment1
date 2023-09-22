%Q1. BASE Converter 
n = input('Enter a number for base n: ');
if (2<=n)&&(n<=10) %define the number in the required range
    xn = input('Enter a number you like: ');
    xn1=int2str(xn);
    x1=base2dec(xn1,n); %make string convert
    m = input('Enter a number for convert:');
    if (2<=m)&&(m<=10)
        xm=dec2base(x1,m);
        f=['number converted is ',xm];
        disp(f);
    else
        disp('input can not be use, which out of the range'); %display the checked result

    end
else
    disp("input can not be use, which out of the range") %display the checked result
end
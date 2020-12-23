p =2;
q =7;
clc;
clear;
## function to encrypt and decrypt the message it uses Chinese
reminder ##method and
## binary expontial method
function e_crpt = en_crypt(e,n,inp)
 inp = double(inp);
 e_bin = dec2bin(e);
 ln = length(e_bin);
 y = 1;
 for i = 1:ln
 y = mod(y*y,n);
 if(e_bin(i)=='1')
 y = mod(y*inp,n);
 endif
 endfor
 e_crpt = y;
 endfunction
# find if 2 numbers are coprime
function e = coprime(num,e=1)
 tmp = e+1;
 while(tmp>1)
 e = e+1;
 tmp = gcd(num,e);
 endwhile
endfunction
# find the public and private key
function [e_k,d_k,n_k] = keygen(p,q)
 n = p * q
 phi = (p-1)*(q-1);
 e_n = coprime(n);
 e_phi = coprime(phi);
 while(e_n != e_phi)
 if(e_n < e_phi)
 e_n = coprime(n,e_n);
 else
 e_phi = coprime(phi,e_phi);
 endif
 endwhile
 d_t = 0;
 d = 1;
 while(d_t~=1)
d = d+1;
 d_t = mod((e_n*d),phi);
endwhile
 d_k = d;
 e_k = e_n;
 n_k = n;
 endfunction

# get the message
messg = input("enter message : ",'m');
cr_messg = 0;
decr_messg = 0;
# p and q
p = 17;
q = 13;
# get the keys
[e,d,n] = keygen(p,q);
# encrypt the message
for i = 0:(length(messg)-1)
 m = messg(i+1);
 cr_messg(i+1) = en_crypt(e,n,m);
endfor
#decrypt the message
for i = 0:(length(messg)-1)
 m = cr_messg(i+1);
 decr_messg(i+1) = en_crypt(d,n,m);
 endfor
printf("private key (n,d)(%d,%d)\n",n,d);
printf("public key (n,e)(%d,%d)\n",n,e);
disp(" input message")
disp(messg)
disp("\n");
disp(" input message ASCII")
disp(double(messg))
disp("\n");
disp("encrypted message")
disp(cr_messg)
disp("\n");
disp("decrypted message ASCII")
disp(decr_messg)
disp("\n");
disp("decrypted message")
disp(char(decr_messg))

with(GaussInt, GIrem, GInormal):

#Euclides para Z
euclides := proc (f::integer, g::integer)
   local r0, r1, r2;
   r0, r1 := f, g;
   while r1 <> 0 do
       r2 := irem(r0, r1);
       r0 := r1;
       r1 := r2;
   end do;
   return r0
end proc:

print('________________EJEMPLOS________________');
print(`En Z: mcd(12,32)`);
euclides(32, 12);

#Euclides para Z[i]
euclidesc := proc (f::complex(integer), g::complex(integer))
   local r0, r1, r2;
   r0, r1 := f, g;
   while r1 <> 0 do
       r2 := GIrem(r0, r1);
       r0 := r1;
       r1 := r2;
   end do;
   return r0
end proc:

print(`En Z[i]: mcd(-7 + 11I, -12 + 11I)`);
euclidesc(-7 + 11*I, -12 + 11*I);

#Euclides para Q[x]
euclidesqx := proc (f::polynom, g::polynom)
   local r0, r1, r2;
   r0, r1 := f, g;
   while degree(r1) > 0 do
       r2 := rem(r0, r1, x);
       r0 := r1;
       r1 := r2;
   end do;
   return r0
end proc:

print(`En Q[x]: mcd(x^3 + 2*x^2 - x - 2, x^3 + 4*x^2 + x - 6)`);
euclidesqx(x^3 + 2*x^2 - x - 2, x^3 + 4*x^2 + x - 6);

#Euclides para Fp[x]
euclidesfpx := proc (f::polynom, g::polynom, p::integer)
   local r0, r1, r2;
   r0, r1 := f, g;
   while degree(r1) > 0 do
       r2 := rem(r0, r1, x) mod p;
       r0 := r1;
       r1 := r2;
   end do;
   return r0
end proc:

print(`En Fp[x]: mcd(r^2*x +r*x^2 +r, r^3*x modulo 2)`);
euclidesfpx(r^2*x +r*x^2 +r, r^3*x, 2);
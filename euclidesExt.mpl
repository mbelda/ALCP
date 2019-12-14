with(GaussInt, GIrem, GInormal, GIquo):

#Euclides para Z
euclidesExt := proc (f::integer, g::integer)
   local r0, r1, r2, s0, s1, s2, t0, t1, t2;
   r0, r1 := f, g;
   s0, s1 := 1, 0;
   t0, t1 := 0, 1;
   while r1 <> 0 do
       r2 := irem(r0, r1);
       s2 := s0 - s1*iquo(r0, r1);
       t2 := t0 - t1*iquo(r0, r1);
       r0, s0, t0 := r1, s1, t1;
       r1, s1, t1 := r2, s2, t2;
   end do;
   return r0, s0, t0
end proc:

print('________________EJEMPLOS________________');
print(`En Z: mcd(12,32)`);
f := 32:
g := 12:
mcd, u, v := euclidesExt(f,g);
evalb(mcd -u*f -v*g = 0);

#Euclides para Z[i]
euclidescExt := proc (f::complex(integer), g::complex(integer))
   local r0, r1, r2, s0, s1, s2, t0, t1, t2;
   r0, r1 := f, g;
   s0, s1 := 1, 0;
   t0, t1 := 0, 1;
   while r1 <> 0 do
       r2 := GIrem(r0, r1);
       s2 := s0 - s1*GIquo(r0, r1);
       t2 := t0 - t1*GIquo(r0, r1);
       r0, s0, t0 := r1, s1, t1;
       r1, s1, t1 := r2, s2, t2;
   end do;
   return r0, s0, t0
end proc:

print(`En Z[i]: mcd(-7 + 11I, -12 + 11I)`);
f := Complex(-7, 11):
g := Complex(-12, 11):
mcd, u, v := euclidescExt(f,g);
evalb(mcd -u*f -v*g = 0);

#Euclides para Q[x]
euclidesExtqx := proc (f::polynom, g::polynom)
   local r0, r1, r2, s0, s1, s2, t0, t1, t2;
   r0, r1 := f, g;
   s0, s1 := 1, 0;
   t0, t1 := 0, 1;
   while degree(r1) > 0 do
       r2 := rem(r0, r1, x);
       s2 := s0 - s1*quo(r0, r1, x);
       t2 := t0 - t1*quo(r0, r1, x);
       r0, s0, t0 := r1, s1, t1;
       r1, s1, t1 := r2, s2, t2;
   end do;
   return r0, s0, t0
end proc:

print(`En Q[x]: mcd(x^3 + 2*x^2 - x - 2, x^3 + 4*x^2 + x - 6)`);
f := x^3 + 2*x^2 - x - 2:
g := x^3 + 4*x^2 + x - 6:
mcd, u, v := euclidesExtqx(f,g);
evalb(mcd -u*f -v*g = 0);

#Euclides para Fp[x]
euclidesExtfpx := proc (f::polynom, g::polynom, p::integer)
   local r0, r1, r2, s0, s1, s2, t0, t1, t2;
   r0, r1 := f, g;
   s0, s1 := 1, 0;
   t0, t1 := 0, 1;
   while degree(r1) > 0 do
       r2 := rem(r0, r1, x) mod p;
       s2 := s0 - s1*quo(r0, r1, x);
       t2 := t0 - t1*quo(r0, r1, x);
       r0, s0, t0 := r1, s1, t1;
       r1, s1, t1 := r2, s2, t2;
   end do;
   return r0 mod p, s0 mod p, t0 mod p
end proc:

print(`En Fp[x]: mcd(r^2*x +r*x^2 +r, r^3*x modulo 2)`);
f := r^2*x +r*x^2 +r:
g := r^3*x:
mcd, u, v := euclidesExtfpx(f,g,2);
res := simplify(mcd -u*f -v*g):
evalb(res mod 2 = 0);
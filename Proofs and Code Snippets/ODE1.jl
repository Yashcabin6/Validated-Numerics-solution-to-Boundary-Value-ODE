using Symbolics
@variables yB
@variables x
D = Differential(x)
y_coeffs, = @variables a[0:7]
y = series(y_coeffs, x)
yp= D(y)
ypp=D(yp)
Problem = 1 + (yp)^2-2*ypp*(yB-y) ~ 0
Problemm = y^5+y ~ 1
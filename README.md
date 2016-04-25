# Cubic-Spline-Interpolation
The code can perform the interpolation task based on spline interpolation method.
<p>
More specifically, it's based on the clamped cubic spline condition, where the first oder derivative of the end points should be specified.
<p>
There are three files. CubicSplineInterp.m returns only the interpolated spline values along the specified range, while CubicSplineInterpWithDeri.m returns interpolated spline values, first order derivative values and the second order derivative values. This can be used in trajectory generation of UAV control. CubicSplineInterpWithDeri.m will return displacement, velocity and acceleration in the case of trajectory generation. Demo.m shows how the interpolation function can be used.

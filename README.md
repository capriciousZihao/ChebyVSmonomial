# ChebyVSmonomial
## Background and motivation

   In order to get fitted angular velocity function from equispaced gyro outputs, 
one can use monomial or Chebyshev polynomial as basis function.
      Generally speaking, Chebyshev polymomials could handle the Runge's phenomenon
much better than monomials. 
      But the underlying logic is using Chebyshev nodes as a guide to sample the 
function that to be fitted. What matters is sampling at Chebyshev nodes, not 
just using Chebyshev polymomial basis. 
      I think if the sampling nodes are fixed, in the case of gyro and accelerometer, 
then these two kind of fitting mehtods have no essentialdifference. If some 
difference do exist, they are only caused by a trick: centering and scaling.
      To verify this idea, this repository was created.

## Explanation of the files in this repository
The code in this repository is written with Matlab R2019a, 64-bit(win64).
### ChebyInterpolateN.m
This is a self-defined matlab function, which interpolates N datapoints with Chebyshev polymomials at order N-1.
As Chebyshev polymomials are defined on [-1,1], the data will be transform to this region.
### MononialInterpolateN.m
This is a self-defined matlab function, which interpolates N datapoints with monomials at order N-1.
It doesn't transform the input data before calculate the coefficients of the fitted function.
### MononialInterpolateNtrans.m
This is a self-defined matlab function. It also interpolates N datapoints with monomials at order N-1 like 
MononialInterpolateN.m, but centering and scaling the input data to [-1,1] before calculate the coefficients of the fitted function.
### discussionOnChebFitting.m
This file calls the three different self-defined interpolating functions to get the fitted funcitonand plot the error of the fitted
function. 

## Result
Run discussionOnChebFitting.m and two Figures will be plotted.
The first figure shows the error of the fitted polymomials from Chebyshev basis and monomial basis. 
The number of used datapoints are 10, 20, 40, 50, corresponding to the first to the forth row.
![Alt text](chebyVSnp.svg?raw=true "Chebyshev vs vanillla Monomial")
The second figure has the same settings as the first one except one point that transforming the data
to [-1, 1] before interpolating with monomial basis. 
![Alt text](chebyVSnpTrans.svg?raw=true "Chebyshev vs Monomial with tramsform")

## Conclusion
In terms of numerical accuracy and stability, centering and scaling is important for the task of interpolating.
Chebyshev polynomials is defined on [-1,1], which means centering and scaling is naturally buildin when using Chebyshev basis to interpolate datapoints.
Thus Chebyshev basis can result a better result than vanillla monomial basis. However, the trick of centering and scaling is not exclusively owned by
Chebyshev basis. If combined with the trick of centering and scaling, monomial basis could also result the same good result as the Chebyshev basis does.



# mvpoly

A library for the numeric treatment of multivariate polynomials.

## Objectives

In the first instance, to provide a number of basic operations 
(addition, multiplication, evaluation) on dense and sparse 
multivariate polynomials in a uniform and intuitive manner in 
a number of high-level numerical programming environments 
(Octave, Python, Maltab).  

## Status

This is a work-in-progress. The implementation of dense multivariate 
polynomials in Octave and Matlab is more-or-less complete. The 
Python dense code will be next, followed by the Python sparse
code.

### Example

In the following octave session we create the polynomial
p(x,y) = 1 + x + 2y and evaluate it at x = y = 1.

	octave:1> p = mvpoly('cube');
	octave:2> p(0,0) = p(1,0) = 1;
	octave:3> p(0,1) = 2;
	octave:4> p
	p = 
		(0,0) :   1.000000
		(1,0) :   1.000000
		(0,1) :   2.000000
		(1,1) :   0.000000
	octave:5> polyval(p, [1, 1])
	ans =  4

## Contributions  

Contributions are most welcome, particularly

* Porting to Python
* The sparse polynomial code

## Author

[J.J. Green](http://soliton.vm.bytemark.co.uk/pub/jjg/)

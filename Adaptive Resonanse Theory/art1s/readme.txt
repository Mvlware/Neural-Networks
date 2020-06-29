Adaptive Resonance Theory (ART) Neural Network


art1.zip  contains:
	art1s.m		M-file for simulation of ART1  NN
	letno.m		M-file for generating input binary patterns (letters A-Z) for
			use with  art1s.m
	noisy.m		M-file which introduces noise in the patterns. Used by letno.m
	letplot.m	M-file for plotting a binary pattern (one at a time)
	readme.txt	this file

 Author:	Valentin Ninov, e-mail: valninov@total.net
		Graduate Student, Dept. of Electrical Engineering
     	  	Concordia University, Montreal, Canada
		(c) April, 1997

These M-files were tested with Matlab v.4.0 and v. 5.0 and run equally
well under both versions.

A brief explanation of ART NN is included below. For more information see the references.

Example of how to use these functions:

	Ex1:  Use all 26 letters and vigilance parameter rho=0.8
  	» P = letno;
	» art1s(P, 0.8);

	Ex2: Use the letters from A to M with 2 pixels inverted (5.7% noise), rho=0.55.
	Supplying a third input argument will enable the printing of the processes
	in the net.
  	» P = letno(2);
	» P = P(:, 1:13);
	» art1s(P, 0.55,1);

The function art1s.m  accepts input binary patterns as column vectors of any
length and of any batch size. For more details type  "help atrt1s". If you want
to see how a given pattern looks like, use letplot.m. Example:

	» P = letno;
	» letplot(P(:,5));

will plot the fifth pattern (letter E).

Note:  One of the first versions of Matlab Neural Network Toolbox contains
a function for simulating ART1 network. This function did not function correctly
and not surprisingly it was excluded from the later versions of the NNET toolbox.
Now this one, art1s.m, uses a small part of the old structure  but it is a completely
new version that functions correctly and according to the theory (see the references).


The ART neural network is a vector classifier. An input vector is classified into one of a
number of categories depending on similarity with the previous patterns. If the similarity
criterion is not satisfied, a new category is created. Thus, the ART network solves
the dilemma between plasticity and stability by enabling the learning to occur only in
a resonance state. In this way the network learns new information  without destroying  the
old one. The ART1 NN works with binary input patterns which are compared to prototype vectors
in order of decreasing similarity until either an adequate match is found or a new category
is created. The prototype patterns (vectors) are stored in the network as connection weight
vectors of the Top-Down Long Term Memory (T-D LTM) traces. The prototype vectors that have
not been used until a certain time are set to 1 . These T-D LTMs give the crucial property
of code self-stabilization [1]. The new input patterns are also in part encoded in  the
Bottom-Up LTM traces (the B-U adaptive filter). The B-U  LTMs play role in the first stage
of determining the degree of similarity between the input pattern and the prototypes
represented by the active output nodes in the F2 layer. This is a "coarse classification"
of the input in one of the active categories. The active state of an output unit
(the winner), denoted by j,indicates that the input vector x belongs to the cluster
represented by this unit j.
The second stage of finding the similarity is the comparison of the feedback pattern from
F2 with the input pattern. The vigilance parameter rho , 0<=rho<=1, is used to determine
whether the input vector x and the output of F1 (in the program this is vector a1) are
similar enough. vj is the T-D LTMs associated with the winner j in F2 and represent an
already stored cluster. The ratio
 	sum(a1(:,q))/ sum(p(:,q));
gives the fraction of 1's in x that are also in vj . A vigilance parameter rho = 0.7 means
that an input vector x with 10 ones will resonate with a winner vector vj  that has at least
7 ones of the same position as the input x. If the vigilance test is not satisfied for
all cathegories and the input pattern cannot be clasified to neither of the existing
categories,a new category is created.

In Ex1 of ART1S the input patterns from "A" to "Z" are supplied to the program in a batch
matrix P (35x26). The vigilance parameter rho is also supplied to the program as an input
argument. The size of layers F1 and F2 is determined according to the size of the input
vectors (1x35) and the maximum number of categories (the batch size Q which in this
case is 26 patterns).

References:
	   [1]	Carpenter, G. A. and S. Grossberg, "ART2: self-organization
		of stable category recognition codes for analog input patterns."
		Applied Optics, vol. 26, no. 23, Dec. 1987, pp. 4919-4930.
	   [2]	J. Freeman and D. Skapura, Neural Networks: Algorithms,
		Applications, and Programming Techniques. Addison Wesley

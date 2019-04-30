/*EK125 FINAL PROJECT JEONGHOON CHOI
 * calcmean.c- > a mex program in MATLAB
 *
 * finds the mean of an array by finding sum then dividing by length of array
 *
 *
 * The calling syntax is:
 * mean = calcmean(mat)
 *
 * This is a MEX file for MATLAB.
*/
#include "mex.h"

void calcmean(double* mat, double* mean, mwSize length) {
	double total = 0.0;
	for (int i = 0; i < length; i++) {
		total += mat[i];
	}
	*mean = total / length;
}

/* The gateway function */
void mexFunction(int nlhs, mxArray* plhs[], int nrhs, const mxArray* prhs[]) {
	/* variable declarations here */
	double* mat;                  /* input matrix */
	size_t length;                    /* size of matrix */
	double* mean;                  /* output mean */

	/*declare variables*/
	mat = mxGetDoubles(prhs[0]);/*input array*/
	length = mxGetN(prhs[0]);/*number of inputs*/
	plhs[0] = mxCreateDoubleMatrix(1, 1, mxREAL);/*output array is 1x1*/
	mean = mxGetDoubles(plhs[0]);/*output mean*/

	/*call function*/
	calcmean(mat, mean, (mwSize)length);
}
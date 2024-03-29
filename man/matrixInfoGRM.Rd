% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matrixInfoGRM.R
\name{matrixInfoGRM}
\alias{matrixInfoGRM}
\title{Calculate the Information Matrix from an Item Bank Calibrated Using the Graded Response Model}
\usage{
matrixInfoGRM(ipar, thetaGrid, maxCat)
}
\arguments{
\item{ipar}{An item parameter matrix in slope/threshold format. Each item is on a separate line.
The column names should be "a" and "CB1" through "CB#" for
the slope and relevant thresholds. As is required by the GRM model, there will be K-1 thresholds.
Additional columns are allowed (e.g., for an item identifier or for number of categories with that item)
provided that the column name is not "a" and does not contain "CB" in it.}

\item{thetaGrid}{A vector of theta estimates at which the test information will be calculated.
The thetaGrid is not provided by default, insofar as it expected to be passed by the GRM engine
to the function. But if this function is intended to be used alone, a reasonable thetaGrid would
be a sequence from -4 to +4 incremented by 0.01 (which is the PROMIS default).}

\item{maxCat}{An integer for the maximum number of categories across all items in the bank.}
}
\value{
A list is returned with two elements. The first is an array with dimensions for the length of the thetaGrid,
the number of items, and the maximum number of response categories across the entire bank. It is named probDiff
and is the difference between adjacent categories on a category-by-category basis. The second element is a
matrix with dimensions the length of the thetaGrid by the number of items. It is called matrixInfo and contains the
information for each item calculated along the theta grid.
}
\description{
This function is used with the MobileToolbox GRM engine for item selection. The item parameters
need to be in slope/threshold parameterization. Then this function is called by the GRM engine
prior to administering items to calculate the information matrix, which can then be used
by the maximum posterior weighted information item selection procedure.
}
\examples{
# define item parameter bank; number of rows is the number of columns
# a = item slope; CB1 to CB# = category bins/thresholds for response; NCAT = number of categories for item
ipar <- data.frame(a = c(3.53, 2.99, 3.10),
                  CB1 = c(-2.79, -1.18, -2.12),
                  CB2 = c(-1.85, -0.499, -1.27),
                  CB3 = c(-1.19, 0.17, -0.52),
                  CB4 = c(-0.551, 0.653, 0.036),
                  NCAT = 5)
# define the lower and upper bounds of theta
thetaGrid <- seq(-4, 4, length.out=121)
# maximum number of categories across all items
maxCat <- max(ipar$NCAT)
# run
ex_info <- matrixInfoGRM(ipar = ipar, thetaGrid = thetaGrid, maxCat = maxCat)
names(ex_info)
ex_info$matrixInfo

}
\seealso{
Other GRM_CAT functions: 
\code{\link{calcEAP}()},
\code{\link{grmCAT}()},
\code{\link{selectMPWI}()}
}
\concept{GRM_CAT functions}

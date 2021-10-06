# SPARC_Project
This project contains 1 main files and some sub-functions in 11 files. 

Main.m: Input the dataset and set parameters, this function returns the clustering result and four clustering evaluation metrics.

SSC.m: This is the function to call the sparse optimization program, to call the spectral clustering algorithm and to compute the clustering error.

admmLasso_mat_func.m: This function takes a DxN matrix of N data points in a D-dimensional space and returns a NxN coefficient matrix of the sparse representation  of each data point in terms of the rest of the points.

BuildAdjacency.m: This function takes a NxN coefficient matrix and returns a NxN adjacency matrix by choosing the K strongest connections in the similarity graph.

SpectralClustering.m: This function takes an adjacency matrix of a graph and computes the clustering of the nodes using the spectral clustering algorithm of Ng, Jordan and Weiss.

Cal_ARI.m: This function compute the ARI value between predicted results and ground truth.

Cal_NMI.m: This function compute the NMI value between predicted results and ground truth.

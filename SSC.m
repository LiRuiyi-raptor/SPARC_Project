%--------------------------------------------------------------------------
% This is the function to call the sparse optimization program, to call the 
% spectral clustering algorithm and to compute the clustering error.
% r = projection dimension, if r = 0, then no projection
% affine = use the affine constraint if true
% s = clustering ground-truth
% missrate = clustering error
% CMat = coefficient matrix obtained by SSC
%--------------------------------------------------------------------------
% Copyright @ Ehsan Elhamifar, 2012
%--------------------------------------------------------------------------

function [missrate,CMat,result,ARI,NMI] = SSC(X,r,affine,alpha,outlier,rho,s,n)
ARI=0;
NMI=0;
if (nargin < 6)
    rho = 1;
end
if (nargin < 5)
    outlier = false;
end
if (nargin < 4)
    alpha = 20;
end
if (nargin < 3)
    affine = false;
end
if (nargin < 2)
    r = 0;
end


Xp = DataProjection(X,r);

if (~outlier)
    CMat = admmLasso_mat_func(Xp,affine,alpha);
    C = CMat;
else
    CMat = admmOutlier_mat_func(Xp,affine,alpha);
    N = size(Xp,2);
    C = CMat(1:N,:);
end

CKSym = BuildAdjacency(thrC(C,rho));
grps = SpectralClustering(CKSym,n);
if length(unique(s))>length(unique(grps))
    grps = bestMap(s,grps)
else 
    s= bestMap(grps,s)
end
result=grps;
ARI=Cal_ARI(s, grps);
NMI=Cal_NMI(s, grps);
missrate = sum(s(:) ~= grps(:)) / length(s);
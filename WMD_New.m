function [fval] = WMD_New(W1, W2, C)
%W1: 1*N1;  N1 is the number of words, where W1(i) is weight
%W2: 1*N2;  N2 is the number of words, where W2(i) is weight
%C: N1*N2; C(i)(j) is the similarity between W1(i) and W2(j);
% EMD   Earth Mover's Distance between two signatures
%    [X, FVAL] = EMD(F1, F2, W1, W2, FUNC) is the Earth Mover's Distance
%    between two signatures S1 = {F1, W1} and S2 = {F2, W2}. F1 and F2
%    consists of feature vectors which describe S1 and S2, respectively.
%    Weights of these features are stored in W1 and W2. FUNC is a function
%    which computes the ground distance between two feature vectors.
%
%    Example:
%    -------
%        f1 = [[100, 40, 22]; [211, 20, 2]; [32, 190, 150]; [2, 100, 100]];
%        f2 = [[0, 0, 0]; [50, 100, 80]; [255, 255, 255]];
%        w1 = [0.4; 0.3; 0.2; 0.1];
%        w2 = [0.5; 0.3; 0.2];
%        ...
%        [x fval] = emd(f1, f2, w1, w2, @gdf);
%        ...
%
%    EMD is formalized as linear programming problem in which the flow that
%    minimizes an overall cost function subject to a set of constraints is
%    computed. This implementation is based on "The Earth Mover's Distance
%    as a Metric for Image Retrieval", Y. Rubner, C. Tomasi and L. Guibas,
%    International Journal of Computer Vision, 40(2), pp. 99-121, 2000.
%
%    The outcome of EMD is the flow (X) which minimizes the cost function
%    and the value (FVAL) of this flow.
%
%    This file and its content belong to Ulas Yilmaz.
%    You are welcome to use it for non-commercial purposes, such as
%    student projects, research and personal interest. However,
%    you are not allowed to use it for commercial purposes, without
%    an explicit written and signed license agreement with Ulas Yilmaz.
%    Berlin University of Technology, Germany 2006.
%    http://www.cv.tu-berlin.de/~ulas/RaRF
%

% ground distance matrix
%f = gdm(F1, F2, Func);

f = reshape(C',1,[]);

[sortF, indF] = sort(f,'descend');

% number of feature vectors
W1 = W1';
W2 = W2';
[m a] = size(W1);
[n a] = size(W2);

fval = 0;

for i=1:length(indF)
    ind = indF(i);
    rowI = ceil(ind/n);
    colI = mod(ind,n);
    if colI==0
        colI = n;
    end
    
    if (W1(rowI)==0) || (W2(colI)==0)
        continue;
    end
    minV = min(W1(rowI),W2(colI));
    
    fval = fval + minV*sortF(i);
    
    W1(rowI) = W1(rowI) - minV;
    W2(colI) = W2(colI) - minV;
end
end


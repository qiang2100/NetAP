
% compute the distance between patients

%% Load an NBS propagation network

%NBSnetwork = load([ basedata_path '/networks/ST90Q_adj_mat.mat' ]);   
%NBSnetwork = load('/Users/jipengqiang/Desktop/cancer/nbs_release_v0.2/data/networks/PC_NCI_adj_mat.mat' ); 
% call floyd for genes' distance
%f_dist = floyd(NBSnetwork.network.adj_mat);

glap = load( '/Users/jipengqiang/Desktop/cancer/nbs_release_v0.2/data/networks/glap_subnetwork_PC_NCI.mat');
outDeg = 11;
 outDeg = 11;
 [knnGlap] = sim_to_knn_glap(glap.glap,outDeg);
 clear glap;
% 
 neigh_network = (-1)*knnGlap;
 neigh_network = neigh_network - diag(-diag(knnGlap));

% call floyd for genes' distance

gene_sis = floyd(neigh_network);

%gene_sis = glap.glap;

%f_sis(f_sis<0) = 0;

igeno = load('/Users/jipengqiang/Desktop/cancer/AffinityBasedNetwork/data/Uterine_PC');

uterSis = patiSisWMD(igeno.igeno,gene_sis);

csvwrite('../data/uter_sis_PC_new.csv',uterSis);
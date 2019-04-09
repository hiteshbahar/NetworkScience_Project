import numpy as np
import networkx as nx
import scipy as sp
import matplotlib.pyplot as plt
%matplotlib inline

#Graph Types:

Bara_20 = nx.barabasi_graph(20,0.15)
nx.draw(Bara_20) 
BB_20_lap = nx.laplacian_matrix(Bara_20)
BB_20_lap

Bara_40 = nx.barabasi_albert_graph(40, 35, seed=523)
nx.draw(Bara_40)
BB_40_lap = nx.laplacian_matrix(Bara_40)
BB_40_lap

ER_20 = nx.erdos_renyi_graph(20,0.15)
nx.draw(ER_20)
ET_20_lap = nx.laplacian_matrix(ER_20)
ET_20_lap
import numpy as np
from scipy import stats

#using numpy arrays
x=np.array([2,4,6,8,10,12])
y=np.array([40,55,62,80,85,96])

#calculating coorelation using scipy
correlation,p_value=stats.pearsonr(x,y)

print("correlation:",correlation)
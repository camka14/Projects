import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np
import scipy.stats as spstats


mpl.style.reload_library()
mpl.style.use('classic')
mpl.rcParams['figure.facecolor'] = (1,1,1,0)
mpl.rcParams['figure.figsize'] = (6.0,4.0)
mpl.rcParams['figure.dpi'] = 100

poke_df = pd.read_csv('Machine Learning(Tutorials)\Pokemon.csv',encoding='utf-8')
atk_def = poke_df[['Attack', 'Defense']]

from sklearn.preprocessing import PolynomialFeatures

pf = PolynomialFeatures(degree=2, interaction_only=False, include_bias=False)
res = pf.fit_transform(atk_def)
pd.DataFrame(pf.powers_, columns=['Attack_degree', 'Defense_degree'])

intr_features = pd.DataFrame(res, columns=['Attack_degree', 'Defense', 'Attack^2', 'Attack x Defense', 'Defense^2'])
print(intr_features.head(5))

new_df = pd.DataFrame(data=[[95, 75], [121, 120], [77, 60]], columns=['Attack', 'Defense'])
print(new_df)

new_res = pf.transform(new_df)
new_intr_features = pd.DataFrame(new_res, columns=['Attack_degree', 'Defense', 'Attack^2', 'Attack x Defense', 'Defense^2'])
print(new_intr_features)

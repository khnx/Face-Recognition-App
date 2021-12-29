clc; clear;

data = load_data();

[coeff, score, latent, tsquared, explained, mu] = pca(data);
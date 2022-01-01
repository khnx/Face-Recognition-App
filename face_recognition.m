clc; clear;

img_data = load_data();

[coeff, score, latent, tsquared, explained, mu] = pca(double(img_data));

% number of significant PCAs
n_components = 1;
while explained(n_components,1) > 1
    n_components = n_components +1;
end
n_components = n_components -1;

% all images - mean image
img_reduced = single(img_data) - single(mu);
eigenfaces = single(img_reduced) * single(coeff);

% calculate weights
img_size = size(img_data(:, 1), 1);
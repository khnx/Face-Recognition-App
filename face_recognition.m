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
eigenfaces_significant = eigenfaces(:, 1:n_components);

wieghts = img_reduced' * eigenfaces_significant;

sample_data = load_sample();

sample_reduced = single(sample_data) - single(mu);
sample_weights = sample_reduced' * eigenfaces_significant;
imshow(reshape(uint8(sample_reduced(:,1)), 112, 92));

euclidean_dist = norm(wieghts - sample_weights);

[min_dist, best_match] = min(euclidean_dist);
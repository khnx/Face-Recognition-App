clc; clear;

img_data = load_data();

[coeff, score, latent, tsquared, explained, mu] = pca(double(img_data));

coeff = single(coeff');

% number of images
no_images = size(img_data, 1);
img_size = size(img_data, 2);

% number of significant PCAs
no_components = 1;
while explained(no_components,1) > 1
    no_components = no_components +1;
end
no_components = no_components -1;

data_reduced = zeros(no_images, img_size, 'single');
for ii=1:no_images
    data_reduced(ii,:) = single(img_data(ii,:)) - single(mu);
end

eigenfaces = coeff(1:no_components, :);

weights = eigenfaces * data_reduced';

% load sample image
img_sample = load_sample(35, 5);
sample_reduced(1,:) = single(img_sample(1,:)) - single(mu);
sample_weight = eigenfaces * sample_reduced';

euclidean_dist = zeros(1, no_images);
for ii=1:no_images
    euclidean_dist(1,ii) = norm(weights(:, ii) - sample_weight);
end

[min_dist, best_match] = min(euclidean_dist);

fprintf("Best match: %i\n", best_match(1,1));
fprintf("Euclidean distance: %i\n", min_dist);
if min_dist > 2500
    fprintf("Warning: This image might not present the person from Your image.\n");
end
subplot(1,2,1);
imshow(uint8(reshape(img_data(best_match, :), 112, 92)));
subplot(1,2,2);
imshow(uint8(reshape(img_sample(1,:), 112, 92)));
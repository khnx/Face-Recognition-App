function [ ...
    out_img_original, out_img_recognized, ...
    out_best_match, out_matched_profile, ...
    out_euclidean_distance ...
    ] = face_recognition()
    %% user image
    % load user image
    user_img = load_user_img();
    
    % exit if image is not added
    if isequal(user_img, 0)
        disp('Add an Image!')
        return;
    end
    
    %% data set images

    [img_data, no_img] = load_data();
    
    [coeff, ~, ~, ~, ~, mu] = pca(double(img_data));
    
    coeff = single(coeff');
    
    % number of images
    no_images = size(img_data, 1);
    img_size = size(img_data, 2);
    
    % number of significant PCAs
    no_components = 50;
    
    data_reduced = zeros(no_images, img_size, 'single');
    for ii=1:no_images
        data_reduced(ii,:) = single(img_data(ii,:)) - single(mu);
    end
    
    eigenfaces = coeff(1:no_components, :);
    
    weights = eigenfaces * data_reduced';
    
    %% user image
    
    user_img_reduced(1,:) = single(user_img(1,:)) - single(mu);
    user_img_weight = eigenfaces * user_img_reduced';
    
    euclidean_dist = zeros(1, no_images);
    for ii=1:no_images
        euclidean_dist(1,ii) = norm(weights(:, ii) - user_img_weight);
    end
    
    [min_dist, best_match] = min(euclidean_dist);
    
    % determine the number of the best matched profile
    ii = 0;
    no_profile = 1;
    while ii < best_match
        ii = ii + no_img(no_profile);
        no_profile = no_profile+1;
    end
    no_profile = no_profile -1;
    
    %% send data for display
    out_img_original = uint8(reshape(user_img(1,:), 112, 92));
    out_img_recognized = uint8(reshape(img_data(best_match, :), 112, 92));
    out_best_match = best_match;
    out_matched_profile = no_profile;
    out_euclidean_distance = min_dist;
end
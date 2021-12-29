function data = load_data()
    % change directory to "/dataset"
    cd("dataset");
    s_dir = dir(pwd);
    % number of directories inside /dataset
    n_dir = sum([s_dir(~ismember({s_dir.name}, {'.', '..'})).isdir]);

    % container for all photos
    img_size_x = 112;
    img_size_y = 92;
    all_img = zeros(img_size_x*img_size_y, n_dir*10);
    
    for ii = 1:n_dir    % up to number of models
        cd(strcat('s',num2str(ii)));    % change to ii-th directory
        for jj = 1:10   % 10 photos for each model
            img = imread(strcat(num2str(jj), ".pgm"));
            % resize to correct x/y sizes
            img_2d = imresize(img, [img_size_x, img_size_y]);
            % reshape to (x * y) x 1 size
            img_1d = reshape(img_2d, img_size_x * img_size_y, 1);
            all_img(:, (ii - 1) * 10 + jj) = img_1d;
        end
        cd ..;
    end
    disp("Database Loaded Successfully!");
    % return to the beginning directory
    cd ..;
    % format for pca()
    data = reshape(all_img, n_dir*10, img_size_x*img_size_y);
    data = all_img;
end
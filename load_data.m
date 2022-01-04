function [data, no_img] = load_data()
    cd dataset;      % /dataset
    s_dir = dir(pwd);
    % number of directories inside /dataset
    no_dir = sum([s_dir(~ismember({s_dir.name}, {'.', '..'})).isdir]);

    % number of all images
    no_img = 1:no_dir;      % number of imgs in each directory
    no_all_img = 0;         % number of all imgs
    for ii = 1:no_dir       % up to number of profiles
        cd(strcat('s',num2str(ii)));    % ii-th s
        no_img(ii) = numel(dir('*.pgm'));
        no_all_img = no_all_img + no_img(ii);
        cd ..;
    end

    % container for all photos
    img_size_x = 112;
    img_size_y = 92;
    all_img = zeros(no_all_img, img_size_x*img_size_y, 'uint8');

    img_count = 1;         % track number of images processed
    for ii = 1:no_dir      % up to number of models
        cd(strcat('s',num2str(ii)));    % ii-th s
        for jj = 1:no_img(ii)
            img = uint8(imread(strcat(num2str(jj), ".pgm")));
            % reshape to (x * y) x 1 size
            img_1d = reshape(img, 1, img_size_x * img_size_y);
            all_img(img_count, :) = img_1d;
            img_count = img_count +1;
        end
        cd ..;      % /dataset
    end
    % return to the beginning directory
    cd ..;          % root

    disp("Database Loaded Successfully!");
    
    data = all_img;
end
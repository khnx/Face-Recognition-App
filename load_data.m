function data = load_data()
    cd dataset;      % /dataset
    s_dir = dir(pwd);
    % number of directories inside /dataset
    no_dir = sum([s_dir(~ismember({s_dir.name}, {'.', '..'})).isdir]);

    % number of all images
    no_img = 1:no_dir;
    for ii = 1:no_dir    % up to number of models
        cd(strcat('s',num2str(ii)));    % ii-th s
        no_img(ii) = numel(dir('*.pgm'));
        cd ..;
    end

    % container for all photos
    img_size_x = 112;
    img_size_y = 92;
    all_img = zeros(no_dir*10, img_size_x*img_size_y, 'uint8');

    for ii = 1:no_dir    % up to number of models
        cd(strcat('s',num2str(ii)));    % ii-th s
        for jj = 1:no_img(ii)   % 10 photos for each model
            % image to sample
            if ii == 20 && jj == 5
                continue;
            end
            img = uint8(imread(strcat(num2str(jj), ".pgm")));
            % reshape to (x * y) x 1 size
            img_1d = reshape(img, 1, img_size_x * img_size_y);
            all_img((ii-1)*10+jj, :) = img_1d;
        end
        cd ..;      % /dataset
    end
    % return to the beginning directory
    cd ..;          % root

    disp("Database Loaded Successfully!");
    
    data = all_img;
end
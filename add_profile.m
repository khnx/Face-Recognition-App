function [] = add_profile()

    cd dataset;      % /dataset
    s_dir = dir(pwd);
    % number of directories inside /dataset
    no_dir = sum([s_dir(~ismember({s_dir.name}, {'.', '..'})).isdir]);

    the_dir = strcat('s', num2str(no_dir+1));
    if ~exist(the_dir, 'dir')
        mkdir(the_dir);
    end

    cd ../new_profile;    % /new_profile
    
    % number of files in the directory
    no_img = numel(dir('*.jpg'));

    % img size
    img_size_x = 112;
    img_size_y = 92;

    for ii = 1:no_img
        % read an image
        img = imread(strcat(num2str(ii), '.jpg'));
        % convert an image to grayscale
        img_gray = rgb2gray(img);
        % resize image to 112x92
        im_resized = imresize(img_gray, [img_size_x, img_size_y]);
        
        cd ../dataset;
        cd(the_dir)
        imwrite(im_resized, strcat(num2str(ii), '.pgm'));
        cd ../../new_profile;
    end

    cd ..;


end
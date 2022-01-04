function [] = add_profile()

    root_path = pwd;
    % folder does not exist - exit
    add_profile = "add_profile";
    if ~isfolder(add_profile)
        disp("No Images in the Profile!");
        return;
    end

        % no images in add_profile - exit
        cd(add_profile);
        no_img = numel(dir('*.jpg'));
        cd(root_path);
        if no_img == 0
            disp('No Images in the Profile!');
            return;
        end
        % create a directory for the new profile
        cd(strcat(root_path, "\dataset"));
        % number of directories inside /dataset
        s_dir = dir(pwd);
        no_dir = sum([s_dir(~ismember({s_dir.name}, {'.', '..'})).isdir]);

        cd(root_path);

        % move imgs from add_profile to /dataset
        cd(strcat(root_path, "\", add_profile));
        img_size_x = 112;
        img_size_y = 92;
        all_img = zeros(no_img, img_size_x * img_size_y);
        for ii = 1:no_img
            % read an image
            img = imread(strcat(num2str(ii), '.jpg'));
            % convert an image to grayscale
            img_gray = rgb2gray(img);
            % resize image to 112x92
            img_resized = imresize(img_gray, [img_size_x, img_size_y]);
            % reshape to 1x112*92
            all_img(ii, :) = reshape(img_resized, 1, 112*92);
            % remove img
            delete(strcat(num2str(ii), ".jpg"));
        end

        % remove add_profile
        cd(root_path);
        rmdir(add_profile);

        % copy imgs into /dataset/s_
        cd(strcat(root_path, "\dataset"));

        s_ii = strcat("s", num2str(no_dir+1));
        mkdir(s_ii);
        cd(s_ii);
        for ii = 1:no_img
            img = reshape(all_img(ii,:), img_size_x, img_size_y);
            imwrite(img, strcat(num2str(ii), ".pgm"));
        end
        cd(root_path);
        disp("Profile added successfully.")

end
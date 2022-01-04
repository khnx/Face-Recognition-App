function [] = add_image_to_the_profile()

    % path to the root folder
    root_path = pwd;
    % get jpg file
    [filename,path] = uigetfile('*.jpg');
    % file added
    if ~isequal(filename, 0) && ~isequal(path, 0)
        profile = 'add_profile';
        cd(root_path);
        if ~isfolder(profile)
            mkdir(profile);
        end
        cd(path);
        file = imread(filename);
        cd (root_path);
        cd(profile);
        no_imgs = numel(dir('*.jpg'));
        imwrite(file, strcat(num2str(no_imgs+1), '.jpg'));
        cd ..;
        disp("Image added successfully.")
    else
            disp("Image Not Added.")
    end
    
end
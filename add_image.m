function [] = add_image()

    % path to the root folder
    root_path = pwd;
    % get jpg file
    [filename,path] = uigetfile('*.jpg');
    % file added
    if ~isequal(filename, 0) && ~isequal(path, 0)
        profile = 'profile';
        cd(root_path);
        if ~isfolder(profile)
            mkdir(profile);
        end
        cd(path);
        file = imread(filename);
        cd (root_path);
        cd(profile);
        imwrite(file, 'img.jpg');
        cd(root_path);
        disp("Image Added Successfully.")
        else
            disp("Image Could Not Be Added.")
    end
end
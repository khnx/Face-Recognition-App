% choose the last person as sample
function data = load_sample()
    cd("dataset");      % /dataset
    s_dir = dir(pwd);   % active directory abs path
    % number of directories inside /dataset
    n_dir = sum([s_dir(~ismember({s_dir.name}, {'.', '..'})).isdir]);

    % img sizes
    img_size_x = 112;
    img_size_y = 92;
    
    cd(strcat('s',num2str(n_dir-1)));    % change to sample directory

    img = uint8(imread(strcat(num2str(1), ".pgm")));
    img_1d = reshape(img, img_size_x * img_size_y, 1);

    cd ..;      % to /dataset
    cd ..;      % to root

    disp("Sample Loaded Successfully!");

    data = img_1d;
end
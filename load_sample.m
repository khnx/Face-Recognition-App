% choose the last person as sample
function data = load_sample(no_dir, no_img)
    cd("dataset");      % /dataset
    s_dir = dir(pwd);   % active directory abs path
    % number of directories inside /dataset
    max_dir = sum([s_dir(~ismember({s_dir.name}, {'.', '..'})).isdir]);

    % img sizes
    img_size_x = 112;
    img_size_y = 92;

    if no_dir > max_dir || no_dir < 1 || no_img > 10 || no_img < 1
        data = zeros(1, img_size_x * img_size_y);
        return
    end
    
    cd(strcat('s',num2str(no_dir)));    % change to sample directory

    img = uint8(imread(strcat(num2str(no_img), ".pgm")));
    img_1d = reshape(img, 1, img_size_x * img_size_y);

    cd ..;      % to /dataset
    cd ..;      % to root

    disp("Sample Loaded Successfully!");

    data = img_1d;
end
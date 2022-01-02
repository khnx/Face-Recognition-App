function data = load_data()
    cd("dataset");      % /dataset
    s_dir = dir(pwd);
    % number of directories inside /dataset
    n_dir = sum([s_dir(~ismember({s_dir.name}, {'.', '..'})).isdir]);
    n_dir = n_dir -1;

    % container for all photos
    img_size_x = 112;
    img_size_y = 92;
    all_img = zeros(img_size_x*img_size_y, n_dir*10, 'uint8');

    for ii = 1:n_dir    % up to number of models
        cd(strcat('s',num2str(ii)));    % ii-th s
        for jj = 1:10   % 10 photos for each model
            img = uint8(imread(strcat(num2str(jj), ".pgm")));
            % reshape to (x * y) x 1 size
            img_1d = reshape(img, img_size_x * img_size_y, 1);
            all_img(:, (ii-1)*10+jj) = img_1d;
        end
        cd ..;      % /dataset
    end
    % return to the beginning directory
    cd ..;          % root

    disp("Database Loaded Successfully!");
    
    data = all_img;
end
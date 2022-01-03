% choose the last person as sample
function data = load_sample2(no_img)
    cd samples;      % /samples

    % img sizes
    img_size_x = 112;
    img_size_y = 92;

    img = uint8(imread(strcat(num2str(no_img), ".pgm")));
    img_1d = reshape(img, 1, img_size_x * img_size_y);

    cd ..;      % to root

    disp("Sample Loaded Successfully!");

    data = img_1d;
end
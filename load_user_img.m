function data = load_user_img()

    % img sizes
    img_size_x = 112;
    img_size_y = 92;

    if isfolder("profile")
        cd("profile");
    else
        data = 0;
        return;
    end

    % read an image
    if ~isfile("img.jpg")
        data = 0;
        return;
    end
    img = imread("img.jpg");
    % convert an image to grayscale
    img_gray = rgb2gray(img);
    % resize image to 112x92
    img_resized = imresize(img_gray, [img_size_x, img_size_y]);% read an image
    img_1d = reshape(img_resized, 1, img_size_x * img_size_y);

    % remove img from profile
    delete("img.jpg");

    cd ..;      % to root

    rmdir profile;

    disp("Image Loaded Successfully!");

    data = img_1d;
end
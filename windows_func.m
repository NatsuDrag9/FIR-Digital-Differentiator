function y = windows_func(M, wind_name, len, w_min)
w_n = zeros(1, len);
if w_min == 0
    % Causal case
    if wind_name == "rectangular"                                               % rectangular
        if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n(len/2:(len/2)+M-1) = ones(1, M);
            else
                w_n(len/2:(len/2)+M-1) = ones(1, M);
            end
        else
            if mod(M,2) ~= 0
                w_n(((len+1)/2):((len+1)/2)+M-1) = ones(1, M);
            else
                w_n((len/2):(len/2)+M-1) = ones(1, M);
            end
        end
    elseif wind_name == "triangular"                                            % triangular
        if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n(len/2:(len/2)+M-1) = (1 - 2*abs([0:1:M-1] - (M-1)/2));
            else
                w_n(len/2:(len/2)+M-1) = (1 - 2*abs([0:1:M-1] - (M-1)/2));
            end
        else
            if mod(M,2) ~= 0
                w_n(((len+1)/2):((len+1)/2)+M-1) = (1 - 2*abs([0:1:M-1] - (M-1)/2));
            else
                w_n((len/2):(len/2)+M-1) = (1 - 2*abs([0:1:M-1] - (M-1)/2));
            end
        end
   elseif wind_name == "Hann"                                                  % Hann
       if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n(len/2:(len/2)+M-1) = 0.5 - 0.5*cos(2*pi*[0:1:M-1]/(M-1));
            else
                w_n(len/2:(len/2)+M-1) = 0.5 - 0.5*cos(2*pi*[0:1:M-1]/(M-1));
            end
       else
            if mod(M,2) ~= 0
                w_n(((len+1)/2):((len+1)/2)+M-1) = 0.5 - 0.5*cos(2*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2):(len/2)+M-1) = 0.5 - 0.5*cos(2*pi*[0:1:M-1]/(M-1));
            end
       end
   elseif wind_name == "Hamming"                                               % Hamming
       if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n(len/2:(len/2)+M-1) = 0.5 - 0.46*cos(2*pi*[0:1:M-1]/(M-1));
            else
                w_n(len/2:(len/2)+M-1) = 0.5 - 0.46*cos(2*pi*[0:1:M-1]/(M-1));
            end
       else
            if mod(M,2) ~= 0
                w_n(((len+1)/2):((len+1)/2)+M-1) = 0.5 - 0.46*cos(2*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2):(len/2)+M-1) = 0.5 - 0.46*cos(2*pi*[0:1:M-1]/(M-1));
            end
       end
    elseif wind_name == "Blackmann"                                               % Hamming
       if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n(len/2:(len/2)+M-1) = 0.42 - 0.5*cos(2*pi*[0:1:M-1]/(M-1)) + 0.08*cos(4*pi*[0:1:M-1]/(M-1));
            else
                w_n(len/2:(len/2)+M-1) = 0.42 - 0.5*cos(2*pi*[0:1:M-1]/(M-1)) + 0.08*cos(4*pi*[0:1:M-1]/(M-1));
            end
       else
            if mod(M,2) ~= 0
                w_n(((len+1)/2):((len+1)/2)+M-1) = 0.42 - 0.5*cos(2*pi*[0:1:M-1]/(M-1)) + 0.08*cos(4*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2):(len/2)+M-1) = 0.42 - 0.5*cos(2*pi*[0:1:M-1]/(M-1)) + 0.08*cos(4*pi*[0:1:M-1]/(M-1));
            end
       end
    end
elseif w_min == -pi
    % Non-causal case
    if wind_name == "rectangular"                                               % rectangular
        if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n((len/2)-(M-1)/2:(len/2)+(M-1)/2) = ones(1, M);
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = ones(1, M);
            end
        else
            if mod(M,2) ~= 0
                w_n(((len+1)/2)-(M-1)/2:((len+1)/2)+(M-1)/2) = ones(1, M);
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = ones(1, M);
            end
        end
    elseif wind_name == "triangular"                                            % triangular
        if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n((len/2)-(M-1)/2:(len/2)+(M-1)/2) = (1 - 2*abs([0:1:M-1] - (M-1)/2));
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = (1 - 2*abs([0:1:M-1] - (M-1)/2));
            end
        else
            if mod(M,2) ~= 0
                w_n(((len+1)/2)-(M-1)/2:((len+1)/2)+(M-1)/2) = (1 - 2*abs([0:1:M-1] - (M-1)/2));
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = (1 - 2*abs([0:1:M-1] - (M-1)/2));
            end
        end
    elseif wind_name == "Hann"                                                  % Hann
        if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n((len/2)-(M-1)/2:(len/2)+(M-1)/2) = 0.5 - 0.5*cos(2*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = 0.5 - 0.5*cos(2*pi*[0:1:M-1]/(M-1));
            end
        else
            if mod(M,2) ~= 0
                w_n(((len+1)/2)-(M-1)/2:((len+1)/2)+(M-1)/2) = 0.5 - 0.5*cos(2*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = 0.5 - 0.5*cos(2*pi*[0:1:M-1]/(M-1));
            end
        end
    elseif wind_name == "Hamming"                                               % Hamming 
        if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n((len/2)-(M-1)/2:(len/2)+(M-1)/2) = 0.5 - 0.46*cos(2*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = 0.5 - 0.46*cos(2*pi*[0:1:M-1]/(M-1));
            end
        else
            if mod(M,2) ~= 0
                w_n(((len+1)/2)-(M-1)/2:((len+1)/2)+(M-1)/2) = 0.5 - 0.46*cos(2*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = 0.5 - 0.46*cos(2*pi*[0:1:M-1]/(M-1));
            end
         end
    elseif wind_name == "Blackmann"
        if mod(len,2) == 0
            if mod(M,2) ~= 0
                w_n((len/2)-(M-1)/2:(len/2)+(M-1)/2) = 0.42 - 0.5*cos(2*pi*[0:1:M-1]/(M-1)) + 0.08*cos(4*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = 0.42 - 0.5*cos(2*pi*[0:1:M-1]/(M-1)) + 0.08*cos(4*pi*[0:1:M-1]/(M-1));
            end
        else
            if mod(M,2) ~= 0
                w_n(((len+1)/2)-(M-1)/2:((len+1)/2)+(M-1)/2) = 0.42 - 0.5*cos(2*pi*[0:1:M-1]/(M-1)) + 0.08*cos(4*pi*[0:1:M-1]/(M-1));
            else
                w_n((len/2)-M/2:(len/2)+(M/2)-1) = 0.42 - 0.5*cos(2*pi*[0:1:M-1]/(M-1)) + 0.08*cos(4*pi*[0:1:M-1]/(M-1));
            end
         end
     end
end
y = w_n;
end
%¼¤»îº¯Êý
function [ g ] = activate_fun( type )
%ACITIVATE_FUN Summary of this function goes here
%   Detailed explanation goes here

    switch type
        case 'tanh'
            g = @(x)tanh(x);
        case 'sigmoid'
            g = @(x)sigm(x);
        case 'radis'
            g  = @(x)radbas(x');
        otherwise
            error('activate fun should either be tanh sigmoid or radis');
    end

end


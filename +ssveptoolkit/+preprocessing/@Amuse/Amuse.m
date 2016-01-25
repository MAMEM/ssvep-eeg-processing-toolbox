classdef Amuse < ssveptoolkit.preprocessing.PreprocessingBase
    %FILTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        first;
        last;
        avgTime;
    end
    
    methods
        function AM = Amuse()
            AM.first = 2;
            AM.last = 256;
        end
        
        function out = process(AM,in )
            out = {};
            total = 0;
            for i=1:length(in)
                i
%                 in{i}.signal(end,:) = [];
                tic
                signal = in{i}.signal;
%                 signal(end,:) = [];
                [W,~,yest] = amuse(signal);
                signal = pinv(W(AM.first:AM.last,:))*yest(AM.first:AM.last,: );
                total = total + toc;
%                 in{i}.signal = signal;
                out{i} = ssveptoolkit.util.Trial(signal,in{i}.label,in{i}.samplingRate,in{i}.subjectid);
            end
%             out = in;
%             total = toc;
            AM.avgTime = total/length(in);
        end
        
        function configInfo = getConfigInfo(AM)
            configInfo = sprintf('Amuse:\t%d-%d',AM.first,AM.last);
        end
        
        function time = getTime(AM)
            time = AM.avgTime;
        end
    end
    
end

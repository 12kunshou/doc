% �г��ļ����ͱ�ǩ���������·��������minCount��ͼ�����ϵġ�
%fileFolder='D:/data/CASIA-WebFacec';
%fileFolder='D:/data/CASIA-WebFacec-60x72';
%fileFolder='D:/data/face/CASIA-WebFacec-60x72-check';
%fileFolder='G:/data/face/casia/CASIA-WebFacec';
fileFolder='F:/data/face/casia-maxpy/CASIA-maxpy-cleancc';
%fileFolder='G:/data/re-id/cuhk03_release/cuhk-03';
fid = fopen('listc1-.txt', 'w');
dirOutput=dir(fullfile(fileFolder,'*'));
label = 0; % ��ǩ����0��ʼ
minCount = 15; % ����������minCount��ͼ
for i = 3:size(dirOutput, 1)
   if (dirOutput(i).isdir)%
        dir2 = dir(fullfile(fileFolder, dirOutput(i).name));
        if (size(dir2, 1) - 2 < minCount)
            continue;
        end
        for j = 3:size(dir2, 1)
            name = strcat(dirOutput(i).name, '/', dir2(j).name);
            if (name(length(name) - 4) == '_')
                continue;
            end
            fprintf(fid, '%s %d\n', name, label);
        end
        label = label + 1;
   else
        %name = strcat(fileFolder, '\', dirOutput(i).name);
        %fprintf(fid, '%s\n', name);
   end
end
fclose(fid);
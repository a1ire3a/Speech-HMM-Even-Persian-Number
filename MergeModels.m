function MergeModels(modelsPath, phoneme, phoneNumber)
hmmdefFilePathName = [modelsPath,'\word1\hmmdefs'];
fid = fopen(hmmdefFilePathName,'w');

for k =1:phoneNumber %30
    modelFilePathName = [modelsPath,'\word1\',  phoneme{k}];
%     modelFilePathName
    fin = fopen(modelFilePathName,'r');
    while(~feof(fin))
        T = fgets(fin);
        fprintf(fid,'%s',T);
    end
    fclose(fin);
end

fclose(fid);
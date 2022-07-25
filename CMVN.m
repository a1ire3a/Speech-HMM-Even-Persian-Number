function CMVN(scriptFile)

fileList = textread(scriptFile, '%s');
 for i=1:length(fileList)
    [mfccfe, fp, dt, tc, t] = readhtk(fileList{i}); 
    newmfcc = (mfccfe - repmat(mean(mfccfe,1),[size(mfccfe,1) 1])) ./ repmat(std(mfccfe,1),[size(mfccfe,1) 1]);
    writehtk([fileList{i}], newmfcc, fp, tc);
 end
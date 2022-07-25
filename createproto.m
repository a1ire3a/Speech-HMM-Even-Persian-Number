function createProto(modelname,numstate,nummixture,vectorlen,pathfile)
fid = fopen(pathfile,'w');
fprintf(fid,'~o <STREAMINFO>1 ');
fprintf(fid,'%d',vectorlen);
fprintf(fid,'\n<VecSize> ');
fprintf(fid,'%d',vectorlen);
fprintf(fid,' <NullD><MFCC_E_D_A_Z><DIAGC>\n\n');
fprintf(fid,'~h \"');
fprintf(fid,'%s',modelname);
fprintf(fid,'\"\n');
fprintf(fid,'<BeginHMM>\n');
fprintf(fid,'<NumStates> ');
fprintf(fid,'%d',numstate);
fprintf(fid,'\n');
for i=2:numstate-1
    fprintf(fid,'<State> ');
    fprintf(fid,'%d',i);
    fprintf(fid,' <NumMixes> ');
    fprintf(fid,'%d',nummixture);
    fprintf(fid,'\n');
    c = 1.0 / nummixture;
    for j=1:nummixture
        fprintf(fid,'<Mixture> ');
        fprintf(fid,'%d',j);
        fprintf(fid,' ');
        fprintf(fid,'%f',c);
        fprintf(fid,'\n');
        fprintf(fid,'<Mean> ');
        fprintf(fid,'%d',vectorlen);
        fprintf(fid,'\n');
        for k=1:vectorlen
            fprintf(fid,'0 ');
        end
        fprintf(fid,'\n<Variance> ');
        fprintf(fid,'%d',vectorlen);
        fprintf(fid,'\n');
        for k=1:vectorlen
            fprintf(fid,'1.0 ');
        end
        fprintf(fid,'\n');
    end
end

fprintf(fid,'\n<TransP> ');
fprintf(fid,'%d',numstate);
fprintf(fid,'\n');

fprintf(fid,'0.0 1.0 ');
for i=3:numstate
    fprintf(fid,'0.0 ');
end
fprintf(fid,'\n');

for i=2:numstate-1
    fprintf(fid,'0.0 ');
    for j=2:numstate
        if ((j==i) || (j == i+1))
            fprintf(fid,'0.5 ');
        else
            fprintf(fid,'0.0 ');
        end
    end
    fprintf(fid,'\n');
end
for i=1:numstate
    fprintf(fid,'0.0 ');
end
fprintf(fid,'\n');

fprintf(fid,'\n<EndHMM>\n');
fclose(fid);
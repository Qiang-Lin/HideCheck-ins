function SanitizedHistogram(hist) 
    fid1=['name','.txt'];
    c=fopen(fid1,'a');
    fprintf(c,'%d \n',hist);
    fprintf(c,'\r\n');
    fclose(c); 
end
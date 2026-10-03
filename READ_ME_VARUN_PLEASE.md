**USE THIS BAT FILEIF YOU WANT TO RUN WITHOUT GENETIC MAP FILE (HERE I AM USING grch 37 FILE DOWNLAODED FROM PLINK WEBISTE)**



phase\_all\_vcfs.bat 





**IF YOU WANT TO RUN THE PAHSING FROM CHROMOSOEME 1 TO 22 IN onE GO USE THIS COMMAND** 



for /L %c in (1,1,22) do java -Xmx8g -jar beagle.27Feb25.75f.jar gt=chr%c.vcf.gz map=maps\\plink.chr%c.GRCh37.map out=chr%c.GRCh37.phased nthreads=4



**IF WANT TO RUN THE COMMAND FOR SPEPERAT CHROSOME THEN RUN THIS COMMAND**





java -Xmx8g -jar beagle.27Feb25.75f.jar gt=chr1.vcf.gz map=maps\\plink.chr1.GRCh37.map out=chr1.GRCh37.phased nthreads=4


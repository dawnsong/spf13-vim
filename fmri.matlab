%------------ FreeSurfer -----------------------------%
fshome = getenv('FREESURFER_HOME');
fsmatlab = sprintf('%s/matlab',fshome);
if (exist(fsmatlab) == 7)
    path(path,fsmatlab);
end
clear fshome fsmatlab;
%-----------------------------------------------------%

%------------ FreeSurfer FAST ------------------------%
fsfasthome = getenv('FSFAST_HOME');
fsfasttoolbox = sprintf('%s/toolbox',fsfasthome);
if (exist(fsfasttoolbox) == 7)
    path(path,fsfasttoolbox);
end
clear fsfasthome fsfasttoolbox;
%-----------------------------------------------------%

home = getenv('HOME');
addpath(genpath(sprintf('%s/fmri/afni.matlab/',home)));
addpath(genpath(sprintf('%s/fmri/bct.20121204/',home)));
addpath(genpath(sprintf('%s/fmri/nbs1.2/',home)));
addpath(genpath(sprintf('%s/fmri/gretna/',home)));
addpath(genpath(sprintf('%s/fmri/spm8/',home)));
addpath(genpath(sprintf('%s/fmri/surfstat/',home)));
addpath(genpath(sprintf('%s/fmri/panda/PANDA/',home)));
addpath(genpath(sprintf('%s/fmri/matlab/gift/GroupICATv3.0a/icatb',home)));
addpath(genpath(sprintf('%s/fmri/matlab/rest/REST/',home)));
addpath(genpath(sprintf('%s/fmri/matlab/mlsp/',home)));
addpath((sprintf('%s/fmri/matlab/m2html/',home)));
clear home;

%function filter_path(pattern)
pattern='.git';
all = path;
[entries] = regexp(all, '([^:]+):', 'tokens');
for i = 1:length(entries)
     entry = char(entries{i});
     if (~isempty(strfind(entry, pattern)))
         rmpath(entry);
     end;
end;
clear all pattern entry entries;


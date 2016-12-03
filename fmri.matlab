if ~isdeployed,

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

user=getenv('USER'),
node=getenv('HOSTNAME'),
if strcmp(user, 'xst833'),
    home = getenv('HOME');
else
    home = '/home/xst833/';
end

addpath(genpath(sprintf('%s/fmri/afni.matlab/',home)));
addpath(genpath(sprintf('%s/fmri/bct.20121204/',home)));
addpath(genpath(sprintf('%s/fmri/nbs1.2/',home)));
addpath(genpath(sprintf('%s/fmri/gretna/',home)));
%addpath((sprintf('%s/fmri/spm12/',home)));
%addpath((sprintf('%s/fmri/spm12/toolbox/cat12',home)));
addpath((sprintf('%s/fmri/spm8/',home)));
addpath((sprintf('%s/fmri/spm8/toolbox/vbm8',home)));
addpath(genpath(sprintf('%s/fmri/surfstat/',home)));
addpath(genpath(sprintf('%s/fmri/panda/PANDA/',home)));
addpath(genpath(sprintf('%s/fmri/matlab/gift/GroupICATv4.0a/icatb',home)));
addpath(genpath(sprintf('%s/fmri/matlab/rest/REST/',home)));
addpath(genpath(sprintf('%s/fmri/matlab/mlsp/',home)));
addpath((sprintf('%s/fmri/matlab/m2html/',home)));
addpath((sprintf('%s/fmri/matlab/BrainNetViewer/',home)));
addpath((sprintf('%s/fmri/matlab/eig3/',home)));
addpath((sprintf('%s/fmri/matlab/export_fig/',home)));
addpath(genpath(sprintf('%s/fmri/matlab/ite/code', home)));
addpath(sprintf('%s/fmri/matlab/jsonlab', home));
addpath(genpath(sprintf('%s/fmri/matlab/PengHC-MIToolbox-2.1.2', home)));

%add my bin path
dawnbind= getenv('DAWNBIND');
addpath(genpath(dawnbind));
clear home;

%function filter_path(pattern)
pattern={'.git', '.svn'};
all = path;
[entries] = regexp(all, '([^:]+):', 'tokens');
for i = 1:length(entries)
    entry = char(entries{i});
    for j=1:length(pattern),
         if (~isempty(strfind(entry, pattern{j})))
             rmpath(entry);
         end;
    end
end;
clear all pattern entry entries;

end %~isdeployed
